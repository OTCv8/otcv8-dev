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

#ifndef WIN32WINDOW_H
#define WIN32WINDOW_H

#include "platformwindow.h"

#include <winsock2.h>
#include <windows.h>

#ifdef OPENGL_ES
#include <EGL/egl.h>
#endif

struct WindowProcProxy;

class WIN32Window : public PlatformWindow
{
    void internalSetupTimerAccuracy();
    void internalCreateWindow();
    void internalCreateGLContext();
    void internalDestroyGLContext();
    void internalRestoreGLContext();

    void *getExtensionProcAddress(const char *ext);
    bool isExtensionSupported(const char *ext);

    LRESULT windowProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam);
    LRESULT dispatcherWindowProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam);
    friend struct WindowProcProxy;

    Fw::Key retranslateVirtualKey(WPARAM wParam, LPARAM lParam);

public:
    WIN32Window();

    void init();
    void terminate();

    void move(const Point& pos);
    void resize(const Size& size);
    void show();
    void hide();
    void minimize();
    void maximize();
    void poll();
    void swapBuffers();
    void showMouse();
    void hideMouse();
    void displayFatalError(const std::string& message);

    void setMouseCursor(int cursorId);
    void restoreMouseCursor();

    void setTitle(const std::string& title);
    void setMinimumSize(const Size& minimumSize);
    void setFullscreen(bool fullscreen);
    void setVerticalSync(bool enable);
    void setIcon(const std::string& file);
    void setClipboardText(const std::string& text);

    Size getDisplaySize();
    std::string getClipboardText();
    std::string getPlatformType();

    void flash() override;

protected:
    int internalLoadMouseCursor(const ImagePtr& image, const Point& hotSpot);

private:
    Rect getClientRect();
    Rect getWindowRect();
    Rect adjustWindowRect(const Rect& rect);

    std::vector<HCURSOR> m_cursors;
    HWND m_window;
    HINSTANCE m_instance;
    HDC m_deviceContext;
    HCURSOR m_cursor;
    HCURSOR m_defaultCursor;
    UINT m_timerRes = 0;
    bool m_hidden;

#ifdef OPENGL_ES
    EGLConfig m_eglConfig;
    EGLContext m_eglContext;
    EGLDisplay m_eglDisplay;
    EGLSurface m_eglSurface;
#else
    HGLRC m_wglContext;
#endif
};

#endif
