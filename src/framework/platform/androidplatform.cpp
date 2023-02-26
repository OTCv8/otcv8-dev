/*
 * Copyright (c) 2010-2016 OTClient <https://github.com/edubart/otclient>
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

#ifdef ANDROID

#include <framework/global.h>

#include "platform.h"
#include "androidwindow.h"
#include <fstream>
#include <unistd.h>
#include <string.h>
#include <framework/stdext/stdext.h>
#include <framework/core/eventdispatcher.h>

#include <sys/stat.h>

void Platform::processArgs(std::vector<std::string>& args)
{
    //nothing todo, linux args are already utf8 encoded
}

bool Platform::spawnProcess(std::string process, const std::vector<std::string>& args)
{
    return false;
}

int Platform::getProcessId()
{
    return getpid();
}

bool Platform::isProcessRunning(const std::string& name)
{
    return false;
}

bool Platform::killProcess(const std::string& name)
{
    return false;
}

std::string Platform::getTempPath()
{
    return "/tmp/";
}

std::string Platform::getCurrentDir()
{
    std::string res;
    char cwd[2048];
    if (getcwd(cwd, sizeof(cwd)) != NULL) {
        res = cwd;
        res += "/";
    }
    return res;
}

bool Platform::copyFile(std::string from, std::string to)
{
    return true;
}

bool Platform::fileExists(std::string file)
{
    return true;
}

bool Platform::removeFile(std::string file)
{
    return false;
}

ticks_t Platform::getFileModificationTime(std::string file)
{
    return 0;
}

bool Platform::openUrl(std::string url, bool now)
{
    g_graphicsDispatcher.addEvent(std::bind(&AndroidWindow::openUrl, g_androidWindow, url));
    return true;
}

bool Platform::openDir(std::string path, bool now)
{
    return true;
}

std::string Platform::getCPUName()
{
    return std::string();
}

double Platform::getTotalSystemMemory()
{
    return 0;
}

double Platform::getMemoryUsage()
{
    return 0;
}

std::string Platform::getOSName()
{
    return "android";
}

std::string Platform::traceback(const std::string& where, int level, int maxDepth)
{
    return "";
}

std::vector<std::string> Platform::getMacAddresses()
{
    return std::vector<std::string>();
}

std::string Platform::getUserName()
{
    return "android";
}

std::vector<std::string> Platform::getDlls()
{
    return std::vector<std::string>();
}

std::vector<std::string> Platform::getProcesses()
{
    return std::vector<std::string>();
}

std::vector<std::string> Platform::getWindows()
{
    return std::vector<std::string>();
}

#endif
