/*
 * Copyright (c) 2010-2017 OTClient <https://github.com/edubart/otclient>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */


#include "graphicalapplication.h"
#include <framework/core/adaptiverenderer.h>
#include <framework/core/clock.h>
#include <framework/core/eventdispatcher.h>
#include <framework/core/asyncdispatcher.h>
#include <framework/platform/platformwindow.h>
#include <framework/ui/uimanager.h>
#include <framework/graphics/graph.h>
#include <framework/graphics/graphics.h>
#include <framework/graphics/texturemanager.h>
#include <framework/graphics/painter.h>
#include <framework/graphics/framebuffermanager.h>
#include <framework/graphics/fontmanager.h>
#include <framework/graphics/atlas.h>
#include <framework/graphics/image.h>
#include <framework/graphics/textrender.h>
#include <framework/graphics/shadermanager.h>
#include <framework/input/mouse.h>
#include <framework/util/extras.h>
#include <framework/util/stats.h>

#ifdef FW_SOUND
#include <framework/sound/soundmanager.h>
#endif

GraphicalApplication g_app;

void GraphicalApplication::init(std::vector<std::string>& args)
{
    Application::init(args);

    // setup platform window
    g_window.init();
    g_graphics.checkForError(__FUNCTION__, __FILE__, __LINE__);
    g_window.hide();
    g_window.setOnResize(std::bind(&GraphicalApplication::resize, this, std::placeholders::_1));
    g_window.setOnInputEvent(std::bind(&GraphicalApplication::inputEvent, this, std::placeholders::_1));
    g_window.setOnClose(std::bind(&GraphicalApplication::close, this));
    g_graphics.checkForError(__FUNCTION__, __FILE__, __LINE__);

    g_mouse.init();

    // initialize ui
    g_ui.init();

    // initialize graphics
    g_graphics.init();

    // fire first resize event
    resize(g_window.getSize());

#ifdef FW_SOUND
    // initialize sound
    g_sounds.init();
#endif
}

void GraphicalApplication::deinit()
{
    // hide the window because there is no render anymore
    g_window.hide();
    g_asyncDispatcher.terminate();

    Application::deinit();
}

void GraphicalApplication::terminate()
{
    // destroy any remaining widget
    g_ui.terminate();

    Application::terminate();
    m_terminated = false;

#ifdef FW_SOUND
    // terminate sound
    g_sounds.terminate();
#endif

    g_mouse.terminate();

    // terminate graphics
    g_graphicsDispatcher.shutdown();
    g_graphics.terminate();
    g_window.terminate();

    m_terminated = true;
}

void GraphicalApplication::run()
{
    m_running = true;
    m_windowPollTimer.restart();

    // first clock update
    g_clock.update();

    // run the first poll
    poll();
    pollGraphics();
    g_clock.update();

    // show window
    g_window.show();

    // run the second poll
    poll();
    pollGraphics();
    g_clock.update();

    g_lua.callGlobalField("g_app", "onRun");

    m_framebuffer = g_framebuffers.createFrameBuffer();
    m_framebuffer->resize(g_painter->getResolution());
    m_mapFramebuffer = g_framebuffers.createFrameBuffer();
    m_mapFramebuffer->resize(g_painter->getResolution());

    ticks_t lastRender = stdext::micros();

    std::shared_ptr<DrawQueue> drawQueue;
    std::shared_ptr<DrawQueue> drawMapQueue;
    std::shared_ptr<DrawQueue> drawMapForegroundQueue;
    bool isOnline = false;
    size_t totalFrames = 0;

    std::mutex mutex;
    std::thread worker([&] {
        g_dispatcherThreadId = std::this_thread::get_id();
        while (!m_stopping) {
            m_processingFrames.addFrame();
            {
                g_clock.update();
                poll();
                g_clock.update();
            }

            mutex.lock();
            if (drawQueue && drawMapQueue && m_maxFps > 0) { // old drawQueue not processed yet
                mutex.unlock();
                AutoStat s(STATS_MAIN, "Sleep");
                stdext::millisleep(1);
                continue;
            }
            mutex.unlock();

            ticks_t renderStart = stdext::millis();
            {
                AutoStat s(STATS_MAIN, "DrawMapBackground");
                g_drawQueue = std::make_shared<DrawQueue>();
                g_ui.render(Fw::MapBackgroundPane);
            }
            std::shared_ptr<DrawQueue> mapBackgroundQueue = g_drawQueue;
            {
                AutoStat s(STATS_MAIN, "DrawMapForeground");
                g_drawQueue = std::make_shared<DrawQueue>();
                g_ui.render(Fw::MapForegroundPane);
            }

            mutex.lock();
            drawMapQueue = mapBackgroundQueue;
            drawMapForegroundQueue = g_drawQueue;
            mutex.unlock();

            {
                AutoStat s(STATS_MAIN, "DrawForeground");
                g_drawQueue = std::make_shared<DrawQueue>();
                g_ui.render(Fw::ForegroundPane);
            }

            mutex.lock();
            drawQueue = g_drawQueue;
            g_drawQueue = nullptr;
            mutex.unlock();

            g_graphs[GRAPH_CPU_FRAME_TIME].addValue(stdext::millis() - renderStart);

            if (m_maxFps > 0 || g_window.hasVerticalSync()) {
                AutoStat s(STATS_MAIN, "Sleep");
                stdext::millisleep(1);
            }
        }
        g_dispatcher.poll(); // last poll
        g_dispatcherThreadId = g_mainThreadId;
    });

    std::shared_ptr<DrawQueue> toDrawQueue, toDrawMapQueue, toDrawMapForegroundQueue;
    ticks_t lastFrame = stdext::millis();
    while (!m_stopping) {
        m_iteration += 1;

        g_clock.update();
        pollGraphics();

        if (!g_window.isVisible()) {
            AutoStat s(STATS_RENDER, "Sleep");
            stdext::millisleep(1);
            g_adaptiveRenderer.refresh();
            continue;
        }

#ifdef FREE_VERSION_LIB
        m_maxFps = 150;
#endif
        int frameDelay = m_maxFps <= 0 ? 0 : (1000000 / m_maxFps);
        if (lastRender + frameDelay > stdext::micros() && !m_mustRepaint) {
            AutoStat s(STATS_RENDER, "Sleep");
            stdext::millisleep(1);
            continue;
        }

        mutex.lock();
        if ((!drawQueue && !toDrawQueue) || 
            ((!drawMapQueue || !drawMapForegroundQueue) && isOnline) || 
            (m_mustRepaint && !drawQueue)) {
            mutex.unlock();
            AutoStat s(STATS_RENDER, "Wait");
            stdext::millisleep(1);
            continue;
        }
        toDrawQueue = drawQueue ? drawQueue : toDrawQueue;
        toDrawMapQueue = drawMapQueue;
        toDrawMapForegroundQueue = drawMapForegroundQueue;
        drawQueue = drawMapQueue = drawMapForegroundQueue = nullptr;
        mutex.unlock();

        g_adaptiveRenderer.newFrame();
        m_graphicsFrames.addFrame();
        m_mustRepaint = false;
        lastRender = stdext::micros() > lastRender + frameDelay * 2 ? stdext::micros() : lastRender + frameDelay;

        g_painter->resetDraws();
        if (m_scaling > 1.0f) {
            AutoStat s(STATS_RENDER, "SetupScaling");
            g_painter->setResolution(g_graphics.getViewportSize() / m_scaling);
            m_framebuffer->resize(g_painter->getResolution());
            m_framebuffer->bind();
        }

        if (toDrawMapQueue && toDrawMapQueue->hasFrameBuffer()) {
            AutoStat s(STATS_RENDER, "UpdateMap");
            m_mapFramebuffer->resize(toDrawMapQueue->getFrameBufferSize());
            m_mapFramebuffer->bind();
            g_painter->clear(Color::black);
            toDrawMapQueue->draw(DRAW_ALL);
            m_mapFramebuffer->release();
        }

        {
            AutoStat s(STATS_RENDER, "Clear");
            g_painter->clear(Color::alpha);
        }

        {
            AutoStat s(STATS_RENDER, "DrawFirstForeground");
            if (toDrawQueue)
                toDrawQueue->draw(DRAW_BEFORE_MAP);
        }

        if(toDrawMapQueue) {
            isOnline = toDrawMapQueue->hasFrameBuffer();
            if(isOnline) {
                AutoStat s(STATS_RENDER, "DrawMapBackground");
                PainterShaderProgramPtr shader = nullptr;
                if (!toDrawMapQueue->getShader().empty()) {
                    shader = g_shaders.getShader(toDrawMapQueue->getShader());
                }
                if (shader) {
                    g_painter->setShaderProgram(shader);
                    shader->bindMultiTextures();
                    shader->setCenter(toDrawMapQueue->getFrameBufferDest().center());
                    shader->setOffset(toDrawMapQueue->getFrameBufferSrc().topLeft());
                }
                m_mapFramebuffer->draw(toDrawMapQueue->getFrameBufferDest(), toDrawMapQueue->getFrameBufferSrc());
                if (shader) {
                    g_painter->resetShaderProgram();
                }
            }
            if(toDrawMapForegroundQueue) {
                AutoStat s(STATS_RENDER, "DrawMapForeground");
                toDrawMapForegroundQueue->draw();
            }
        }

        {
            AutoStat s(STATS_RENDER, "DrawSecondForeground");
            toDrawQueue->draw(DRAW_AFTER_MAP);
        }

        {
            if (g_extras.debugRender) {
                AutoStat s(STATS_RENDER, "DrawGraphs");
                for (int i = 0, x = 60, y = 30; i <= GRAPH_LAST; ++i) {
                    g_graphs[i].draw(Rect(x, y, Size(200, 60)));
                    y += 70;
                    if (y + 70 > g_painter->getResolution().height()) {
                        x += 220;
                        y = 30;
                    }
                }
            }
        }

        if (m_scaling > 1.0f) {
            AutoStat s(STATS_RENDER, "DrawScaled");
            m_framebuffer->release();
            g_painter->setResolution(g_graphics.getViewportSize());
            g_painter->clear(Color::alpha);
            m_framebuffer->draw(Rect(0, 0, g_painter->getResolution()));
        }

        g_graphs[GRAPH_GPU_CALLS].addValue(g_painter->calls());
        g_graphs[GRAPH_GPU_DRAWS].addValue(g_painter->draws());

        AutoStat s(STATS_RENDER, "SwapBuffers");
        g_window.swapBuffers();
        g_graphics.checkForError(__FUNCTION__, __FILE__, __LINE__);
        g_graphs[GRAPH_TOTAL_FRAME_TIME].addValue(stdext::millis() - lastFrame);
        lastFrame = stdext::millis();
        totalFrames += 1;

#ifdef FREE_VERSION_LIB
        if (totalFrames > m_maxFps * 3600 * 1.2 || stdext::millis() > 3600'000) {
            g_logger.info("Free version of OTCv8 is limited to 1 hour of runtime. Exiting...");
            g_app.exit();
        }
        if (totalFrames > m_maxFps * 3600 * 1.3 || stdext::millis() > 3900'000) {
            // force exit
            g_logger.fatal("Free version of OTCv8 is limited to 1 hour of runtime. Exiting...");
            std::exit(0);
        }
        if (totalFrames > m_maxFps * 3600 * 1.4) {
            // can't exit, crash app
            m_framebuffer = nullptr;
            m_mapFramebuffer = nullptr;
            g_drawQueue = nullptr;
        }
#endif
    }

    worker.join();
    g_graphicsDispatcher.poll();

    m_framebuffer = nullptr;
    m_mapFramebuffer = nullptr;
    g_drawQueue = nullptr;
    m_stopping = false;
    m_running = false;
}

void GraphicalApplication::poll() {
    ticks_t start = stdext::millis();
#ifdef FW_SOUND
    g_sounds.poll();
#endif
    Application::poll();
    g_graphs[GRAPH_PROCESSING_POLL].addValue(stdext::millis() - start, true);
}

void GraphicalApplication::pollGraphics()
{
    ticks_t start = stdext::millis();
    g_graphicsDispatcher.poll();
    g_text.poll();
    if (m_windowPollTimer.elapsed_millis() > 10) {
        g_window.poll();
        m_windowPollTimer.restart();
    }
    g_graphs[GRAPH_GRAPHICS_POLL].addValue(stdext::millis() - start, true);
}

void GraphicalApplication::close()
{
    VALIDATE(std::this_thread::get_id() == g_dispatcherThreadId);
    m_onInputEvent = true;
    Application::close();
    m_onInputEvent = false;
}

void GraphicalApplication::resize(const Size& size)
{
    VALIDATE(std::this_thread::get_id() == g_mainThreadId);
    g_graphics.resize(size); // uses painter
    scale(m_scaling); // thread safe
}

void GraphicalApplication::inputEvent(InputEvent event)
{
    VALIDATE(std::this_thread::get_id() == g_dispatcherThreadId);
    m_onInputEvent = true;
    g_ui.inputEvent(event);
    m_onInputEvent = false;
}

void GraphicalApplication::doScreenshot(std::string file)
{
    if (g_mainThreadId != std::this_thread::get_id()) {
        g_graphicsDispatcher.addEvent(std::bind(&GraphicalApplication::doScreenshot, this, file));
        return;
    }

    if (file.empty()) {
        file = "screenshot.png";
    }
    auto resolution = g_graphics.getViewportSize();
    int width = resolution.width();
    int height = resolution.height();
    auto pixels = std::make_shared<std::vector<uint8_t>>(width * height * 4 * sizeof(GLubyte), 0);
    glReadPixels(0, 0, width, height, GL_RGBA, GL_UNSIGNED_BYTE, (GLubyte*)(pixels->data()));

    g_asyncDispatcher.dispatch([resolution, pixels, file] {
        for (int line = 0, h = resolution.height(), w = resolution.width(); line != h / 2; ++line) {
            std::swap_ranges(
                pixels->begin() + 4 * w * line,
                pixels->begin() + 4 * w * (line + 1),
                pixels->begin() + 4 * w * (h - line - 1));
        }
        try {
            Image image(resolution, 4, pixels->data());
            image.savePNG(file);
        } catch (stdext::exception& e) {
            g_logger.error(std::string("Can't do screenshot: ") + e.what());
        }
    });
}

void GraphicalApplication::scaleUp()
{
    if (g_mainThreadId != std::this_thread::get_id()) {
        g_graphicsDispatcher.addEvent(std::bind(&GraphicalApplication::scaleUp, this));
        return;
    }
    scale(m_scaling + 0.5);
}

void GraphicalApplication::scaleDown()
{
    if (g_mainThreadId != std::this_thread::get_id()) {
        g_graphicsDispatcher.addEvent(std::bind(&GraphicalApplication::scaleDown, this));
        return;
    }
    scale(m_scaling - 0.5);
}

void GraphicalApplication::scale(float value)
{
    if (g_mainThreadId != std::this_thread::get_id()) {
        g_graphicsDispatcher.addEvent(std::bind(&GraphicalApplication::scale, this, value));
        return;
    }

    float maxScale = std::min<float>((g_graphics.getViewportSize().height() / 180),
                                        g_graphics.getViewportSize().width() / 280);
    if (maxScale < 2.0)
        maxScale = 2.0;
    maxScale /= 2;

    if (m_scaling == value) {
        value = m_lastScaling;
    } else {
        m_lastScaling = std::max<float>(1.0, std::min<float>(maxScale, value));
    }

    m_scaling = std::max<float>(1.0, std::min<float>(maxScale, value));
    g_window.setScaling(m_scaling);

    g_dispatcher.addEvent([&] {
        m_onInputEvent = true;
        g_ui.resize(g_graphics.getViewportSize() / m_scaling);
        m_onInputEvent = false;
        m_mustRepaint = true;
    });
}

void GraphicalApplication::setSmooth(bool value)
{
    if (!m_mapFramebuffer) return;

    m_mapFramebuffer->setSmooth(value);
}

void GraphicalApplication::doMapScreenshot(std::string fileName)
{
    if (!m_mapFramebuffer) return;

    m_mapFramebuffer->doScreenshot(fileName);
}