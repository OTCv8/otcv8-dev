# framework flags
# FRAMEWORK_SOUND
# FRAMEWORK_GRAPHICS
# FRAMEWORK_NET
# FRAMEWORK_XML

# CMAKE_CURRENT_LIST_DIR cmake 2.6 compatibility
if(${CMAKE_MAJOR_VERSION} EQUAL 2 AND ${CMAKE_MINOR_VERSION} EQUAL 6)
    get_filename_component(CMAKE_CURRENT_LIST_DIR ${CMAKE_CURRENT_LIST_FILE} PATH)
endif(${CMAKE_MAJOR_VERSION} EQUAL 2 AND ${CMAKE_MINOR_VERSION} EQUAL 6)

# add framework cmake modules
set(CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake;${CMAKE_MODULE_PATH}")

set(framework_LIBRARIES "")
set(framework_DEFINITIONS "")
set(framework_INCLUDE_DIRS "${CMAKE_CURRENT_LIST_DIR}/..")
set(framework_SOURCES ${framework_SOURCES}
    ${CMAKE_CURRENT_LIST_DIR}/const.h
    ${CMAKE_CURRENT_LIST_DIR}/global.h
    ${CMAKE_CURRENT_LIST_DIR}/pch.h
    ${CMAKE_CURRENT_LIST_DIR}/luafunctions.cpp

    ${CMAKE_CURRENT_LIST_DIR}/util/color.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/color.h
    ${CMAKE_CURRENT_LIST_DIR}/util/crypt.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/crypt.h
    ${CMAKE_CURRENT_LIST_DIR}/util/databuffer.h
    ${CMAKE_CURRENT_LIST_DIR}/util/extras.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/extras.h
    ${CMAKE_CURRENT_LIST_DIR}/util/pngunpacker.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/pngunpacker.h
    ${CMAKE_CURRENT_LIST_DIR}/util/framecounter.h
    ${CMAKE_CURRENT_LIST_DIR}/util/matrix.h
    ${CMAKE_CURRENT_LIST_DIR}/util/point.h
    ${CMAKE_CURRENT_LIST_DIR}/util/qrcodegen.c
    ${CMAKE_CURRENT_LIST_DIR}/util/qrcodegen.h
    ${CMAKE_CURRENT_LIST_DIR}/util/rect.h
    ${CMAKE_CURRENT_LIST_DIR}/util/size.h
    ${CMAKE_CURRENT_LIST_DIR}/util/stats.cpp
    ${CMAKE_CURRENT_LIST_DIR}/util/stats.h

    # stdext
    ${CMAKE_CURRENT_LIST_DIR}/stdext/any.h
    ${CMAKE_CURRENT_LIST_DIR}/stdext/boolean.h
    ${CMAKE_CURRENT_LIST_DIR}/stdext/cast.h
    ${CMAKE_CURRENT_LIST_DIR}/stdext/compiler.h
    ${CMAKE_CURRENT_LIST_DIR}/stdext/demangle.cpp
    ${CMAKE_CURRENT_LIST_DIR}/stdext/demangle.h
    ${CMAKE_CURRENT_LIST_DIR}/stdext/dumper.h
    ${CMAKE_CURRENT_LIST_DIR}/stdext/dynamic_storage.h
    ${CMAKE_CURRENT_LIST_DIR}/stdext/exception.h
    ${CMAKE_CURRENT_LIST_DIR}/stdext/fastrand.h
    ${CMAKE_CURRENT_LIST_DIR}/stdext/format.h
    ${CMAKE_CURRENT_LIST_DIR}/stdext/math.cpp
    ${CMAKE_CURRENT_LIST_DIR}/stdext/math.h
    ${CMAKE_CURRENT_LIST_DIR}/stdext/net.cpp
    ${CMAKE_CURRENT_LIST_DIR}/stdext/net.h
    ${CMAKE_CURRENT_LIST_DIR}/stdext/packed_any.h
    ${CMAKE_CURRENT_LIST_DIR}/stdext/packed_storage.h
    ${CMAKE_CURRENT_LIST_DIR}/stdext/shared_object.h
    ${CMAKE_CURRENT_LIST_DIR}/stdext/stdext.h
    ${CMAKE_CURRENT_LIST_DIR}/stdext/string.cpp
    ${CMAKE_CURRENT_LIST_DIR}/stdext/string.h
    ${CMAKE_CURRENT_LIST_DIR}/stdext/thread.h
    ${CMAKE_CURRENT_LIST_DIR}/stdext/time.cpp
    ${CMAKE_CURRENT_LIST_DIR}/stdext/time.h
    ${CMAKE_CURRENT_LIST_DIR}/stdext/traits.h
    ${CMAKE_CURRENT_LIST_DIR}/stdext/types.h
    ${CMAKE_CURRENT_LIST_DIR}/stdext/uri.cpp
    ${CMAKE_CURRENT_LIST_DIR}/stdext/uri.h

    # core
    ${CMAKE_CURRENT_LIST_DIR}/core/adaptiverenderer.cpp
    ${CMAKE_CURRENT_LIST_DIR}/core/adaptiverenderer.h
    ${CMAKE_CURRENT_LIST_DIR}/core/application.cpp
    ${CMAKE_CURRENT_LIST_DIR}/core/application.h
    ${CMAKE_CURRENT_LIST_DIR}/core/asyncdispatcher.cpp
    ${CMAKE_CURRENT_LIST_DIR}/core/asyncdispatcher.h
    ${CMAKE_CURRENT_LIST_DIR}/core/binarytree.cpp
    ${CMAKE_CURRENT_LIST_DIR}/core/binarytree.h
    ${CMAKE_CURRENT_LIST_DIR}/core/clock.cpp
    ${CMAKE_CURRENT_LIST_DIR}/core/clock.h
    ${CMAKE_CURRENT_LIST_DIR}/core/config.cpp
    ${CMAKE_CURRENT_LIST_DIR}/core/config.h
    ${CMAKE_CURRENT_LIST_DIR}/core/configmanager.cpp
    ${CMAKE_CURRENT_LIST_DIR}/core/configmanager.h
    ${CMAKE_CURRENT_LIST_DIR}/core/declarations.h
    ${CMAKE_CURRENT_LIST_DIR}/core/event.cpp
    ${CMAKE_CURRENT_LIST_DIR}/core/event.h
    ${CMAKE_CURRENT_LIST_DIR}/core/eventdispatcher.cpp
    ${CMAKE_CURRENT_LIST_DIR}/core/eventdispatcher.h
    ${CMAKE_CURRENT_LIST_DIR}/core/filestream.cpp
    ${CMAKE_CURRENT_LIST_DIR}/core/filestream.h
    ${CMAKE_CURRENT_LIST_DIR}/core/graphicalapplication.cpp
    ${CMAKE_CURRENT_LIST_DIR}/core/graphicalapplication.h
    ${CMAKE_CURRENT_LIST_DIR}/core/inputevent.h
    ${CMAKE_CURRENT_LIST_DIR}/core/logger.cpp
    ${CMAKE_CURRENT_LIST_DIR}/core/logger.h
    ${CMAKE_CURRENT_LIST_DIR}/core/module.cpp
    ${CMAKE_CURRENT_LIST_DIR}/core/module.h
    ${CMAKE_CURRENT_LIST_DIR}/core/modulemanager.cpp
    ${CMAKE_CURRENT_LIST_DIR}/core/modulemanager.h
    ${CMAKE_CURRENT_LIST_DIR}/core/resourcemanager.cpp
    ${CMAKE_CURRENT_LIST_DIR}/core/resourcemanager.h
    ${CMAKE_CURRENT_LIST_DIR}/core/scheduledevent.cpp
    ${CMAKE_CURRENT_LIST_DIR}/core/scheduledevent.h
    ${CMAKE_CURRENT_LIST_DIR}/core/timer.cpp
    ${CMAKE_CURRENT_LIST_DIR}/core/timer.h

    # luaengine
    ${CMAKE_CURRENT_LIST_DIR}/luaengine/declarations.h
    ${CMAKE_CURRENT_LIST_DIR}/luaengine/lbitlib.cpp
    ${CMAKE_CURRENT_LIST_DIR}/luaengine/lbitlib.h
    ${CMAKE_CURRENT_LIST_DIR}/luaengine/luabinder.h
    ${CMAKE_CURRENT_LIST_DIR}/luaengine/luaexception.cpp
    ${CMAKE_CURRENT_LIST_DIR}/luaengine/luaexception.h
    ${CMAKE_CURRENT_LIST_DIR}/luaengine/luainterface.cpp
    ${CMAKE_CURRENT_LIST_DIR}/luaengine/luainterface.h
    ${CMAKE_CURRENT_LIST_DIR}/luaengine/luaobject.cpp
    ${CMAKE_CURRENT_LIST_DIR}/luaengine/luaobject.h
    ${CMAKE_CURRENT_LIST_DIR}/luaengine/luavaluecasts.cpp
    ${CMAKE_CURRENT_LIST_DIR}/luaengine/luavaluecasts.h

    # otml
    ${CMAKE_CURRENT_LIST_DIR}/otml/declarations.h
    ${CMAKE_CURRENT_LIST_DIR}/otml/otml.h
    ${CMAKE_CURRENT_LIST_DIR}/otml/otmldocument.cpp
    ${CMAKE_CURRENT_LIST_DIR}/otml/otmldocument.h
    ${CMAKE_CURRENT_LIST_DIR}/otml/otmlemitter.cpp
    ${CMAKE_CURRENT_LIST_DIR}/otml/otmlemitter.h
    ${CMAKE_CURRENT_LIST_DIR}/otml/otmlexception.cpp
    ${CMAKE_CURRENT_LIST_DIR}/otml/otmlexception.h
    ${CMAKE_CURRENT_LIST_DIR}/otml/otmlnode.cpp
    ${CMAKE_CURRENT_LIST_DIR}/otml/otmlnode.h
    ${CMAKE_CURRENT_LIST_DIR}/otml/otmlparser.cpp
    ${CMAKE_CURRENT_LIST_DIR}/otml/otmlparser.h

    # crash handler
    ${CMAKE_CURRENT_LIST_DIR}/platform/crashhandler.h
    ${CMAKE_CURRENT_LIST_DIR}/platform/unixcrashhandler.cpp
    ${CMAKE_CURRENT_LIST_DIR}/platform/win32crashhandler.cpp
    ${CMAKE_CURRENT_LIST_DIR}/platform/win32platform.cpp
    ${CMAKE_CURRENT_LIST_DIR}/platform/unixplatform.cpp
    ${CMAKE_CURRENT_LIST_DIR}/platform/platform.cpp
    ${CMAKE_CURRENT_LIST_DIR}/platform/platform.h
)

set_source_files_properties(${CMAKE_CURRENT_LIST_DIR}/luafunctions.cpp
                            PROPERTIES LANGUAGE CXX COMPILE_FLAGS "-g0 -Os")

# some build options
option(LUAJIT "Use lua jit" ON)
if(NOT APPLE)
    option(CRASH_HANDLER "Generate crash reports" ON)
    option(USE_STATIC_LIBS "Don't use shared libraries (dlls)" ON)
    option(USE_LIBCPP "Use the new libc++ library instead of stdc++" OFF)
    option(USE_LTO "Use link time optimizations" OFF)
else()
    set(CRASH_HANDLER OFF)
    set(USE_STATIC_LIBS ON)
    set(USE_LIBCPP ON)
endif()
set(BUILD_COMMIT "devel" CACHE "Git commit string (intended for releases)" STRING)
set(BUILD_REVISION 0 CACHE "Git revision string (intended for releases)" STRING)

# default build type
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE "release")
endif()

set (CMAKE_CXX_STANDARD 17)

# gcc compile flags
set(WARNS_FLAGS "-Wall -Wextra -Wno-unused -Wno-unused-parameter -Wno-unused-result")
if(WASM)
    set(CMAKE_CXX_FLAGS                   "${CMAKE_CXX_FLAGS} ${WARNS_FLAGS} ${ARCH_FLAGS} -s USE_ZLIB=1 -s USE_LIBPNG=1 -s USE_SDL=2 -s USE_BOOST_HEADERS=1 -s USE_PTHREADS=1 -O1") # add -Ofast
    set(framework_INCLUDE_DIRS ${framework_INCLUDE_DIRS} 
            D:\\wasm\\physfs\\src 
            D:\\wasm\\lua-lua-5.1\\src)
    set(framework_LIBRARIES ${framework_LIBRARIES} "D:/wasm/physfs/build/libphysfs.a")

    include_directories("D:\\wasm\\lua-lua-5.1")
    set( LUA_DIR "D:/wasm/lua-lua-5.1/src" )
    set ( LUA_SRC ${LUA_DIR}/lapi.c ${LUA_DIR}/lcode.c ${LUA_DIR}/ldebug.c ${LUA_DIR}/ldo.c ${LUA_DIR}/ldump.c ${LUA_DIR}/lfunc.c 
      ${LUA_DIR}/lgc.c ${LUA_DIR}/llex.c ${LUA_DIR}/lmem.c ${LUA_DIR}/lobject.c ${LUA_DIR}/lopcodes.c ${LUA_DIR}/lparser.c ${LUA_DIR}/lstate.c 
      ${LUA_DIR}/lstring.c ${LUA_DIR}/ltable.c ${LUA_DIR}/ltm.c ${LUA_DIR}/lundump.c ${LUA_DIR}/lvm.c ${LUA_DIR}/lzio.c ${LUA_DIR}/lauxlib.c 
      ${LUA_DIR}/lbaselib.c ${LUA_DIR}/ldblib.c ${LUA_DIR}/liolib.c ${LUA_DIR}/lmathlib.c ${LUA_DIR}/loslib.c ${LUA_DIR}/ltablib.c 
      ${LUA_DIR}/lstrlib.c ${LUA_DIR}/linit.c )
    set_source_files_properties(${LUA_SRC} PROPERTIES LANGUAGE CXX )
    set(framework_SOURCES ${framework_SOURCES} ${LUA_SRC})
    message(STATUS "LUA: " ${LUA_SRC})
else()
    set(CMAKE_CXX_FLAGS                   "${CMAKE_CXX_FLAGS} ${WARNS_FLAGS} ${ARCH_FLAGS} -pipe")
    set(CMAKE_CXX_FLAGS_COMPILESPEED      "-O0")
    set(CMAKE_CXX_FLAGS_DEBUG             "-O0 -g")
    set(CMAKE_CXX_FLAGS_RELWITHDEBINFO    "-O1 -g -fno-omit-frame-pointer")
    set(CMAKE_CXX_FLAGS_RELEASE           "-O2")
    set(CMAKE_CXX_FLAGS_PERFORMANCE       "-Ofast -march=native")
endif()

if(USE_LTO)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fwhole-program -flto")
    if(WIN32)
        set(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} -Wl,-O1,--gc-sections,--sort-common,--relax")
    else()
        set(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} -Wl,-O1,--gc-sections,--sort-common,--relax,-z,relro")
    endif()
endif()

# process options
if(USE_STATIC_LIBS)
        if(NOT APPLE)
            set(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} -static-libgcc -static-libstdc++")
        endif()
        message(STATUS "Link to static libraries: ON")
        set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")
else()
        message(STATUS "Link to static libraries: OFF")
endif()

message(STATUS "Build type: " ${CMAKE_BUILD_TYPE})
add_definitions(-D"BUILD_TYPE=\\\"${CMAKE_BUILD_TYPE}\\\"")
message(STATUS "Build commit: ${BUILD_COMMIT}")
add_definitions(-D"BUILD_COMMIT=\\\"${BUILD_COMMIT}\\\"")
message(STATUS "Build revision: ${BUILD_REVISION}")
add_definitions(-D"BUILD_REVISION=${BUILD_REVISION}")

message(STATUS "Build with encryption")
add_definitions(-D"WITH_ENCRYPTION")

# main libs
if(NOT WASM)
    # find boost
    set(REQUIRED_BOOST_COMPONENTS system filesystem)
    set(Boost_USE_MULTITHREADED ON)
    set(Boost_USE_STATIC_LIBS ${USE_STATIC_LIBS})
    find_package(Boost 1.67.0 COMPONENTS ${REQUIRED_BOOST_COMPONENTS} REQUIRED)

    #find zip
    find_package(LibZip REQUIRED)
    find_package(ZLIB REQUIRED)
    find_package(BZip2 REQUIRED)

    #find lua
    if(LUAJIT)
        find_package(LuaJIT REQUIRED)
        set(LUA_INCLUDE_DIR ${LUAJIT_INCLUDE_DIR})
        set(LUA_LIBRARY ${LUAJIT_LIBRARY})

        if(APPLE)
          set(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} -pagezero_size 10000 -image_base 100000000")
        endif()
    else()
        find_package(Lua REQUIRED)
    endif()
    message(STATUS "LuaJIT: " ${LUAJIT})

    find_package(PhysFS REQUIRED)
    find_package(OpenSSL REQUIRED)
    find_package(ZLIB REQUIRED)

    set(framework_LIBRARIES ${framework_LIBRARIES}
        ${Boost_LIBRARIES}
        ${LUA_LIBRARY}
        ${PHYSFS_LIBRARY}
        ${OPENSSL_LIBRARIES}
        ${ZLIB_LIBRARY}
        ${LIBZIP_LIBRARY}
	${ZLIB_LIBRARY}
	${BZIP2_LIBRARIES}
    )

    if(WIN32)
        set(framework_LIBRARIES ${framework_LIBRARIES} -lbcrypt -ldbghelp -lshlwapi -liphlpapi -lpsapi)
    endif()

    set(framework_INCLUDE_DIRS ${framework_INCLUDE_DIRS}
        ${Boost_INCLUDE_DIRS}
        ${LUA_INCLUDE_DIR}
        ${PHYSFS_INCLUDE_DIR}
        ${OPENSSL_INCLUDE_DIR}
        ${framework_INCLUDE_DIRS}
        ${LIBZIP_INCLUDE_DIR_ZIP}
        ${LIBZIP_INCLUDE_DIR_ZIPCONF}
	${ZLIB_INCLUDE_DIR}
	${BZIP2_INCLUDE_DIR}
    )
endif()


if(CMAKE_BUILD_TYPE STREQUAL "Debug" OR CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo")
    message(STATUS "Debug information: ON")
else()
    message(STATUS "Debug information: OFF")
    set(framework_DEFINITIONS ${framework_DEFINITIONS} -DNDEBUG) # NDEBUG disable asserts
    if(NOT APPLE)
        set(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} -Wl,-s") # strip all debug information
        if(NOT WASM)
            set(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} -Wl,--as-needed") # only link needed libraries
        endif()
    endif()
endif()

if(CRASH_HANDLER)
    set(framework_DEFINITIONS ${framework_DEFINITIONS} -DCRASH_HANDLER)
    message(STATUS "Crash handler: ON")
    if(WIN32)
        set(framework_LIBRARIES ${framework_LIBRARIES} imagehlp)
    endif()
else()
    message(STATUS "Crash handler: OFF")
endif()

if(USE_LIBCPP)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libc++")
endif()

if(WIN32)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mthreads")
    set(framework_DEFINITIONS ${framework_DEFINITIONS} -D_WIN32_WINNT=0x0501 -DWIN32)
    #set(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} -Wl,--large-address-aware") # strip all debug information
    set(SYSTEM_LIBRARIES "")
else()
    if(APPLE)
        set(framework_DEFINITIONS ${framework_DEFINITIONS} -D_REENTRANT) # enable thread safe code
        set(SYSTEM_LIBRARIES "")
    elseif(NOT WASM)
        set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")
        set(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} -rdynamic -Wl,-rpath,./libs") # rdynamic is needed by backtrace.h used in crash handler
        set(SYSTEM_LIBRARIES dl rt)
    endif()
endif()
set(framework_LIBRARIES ${framework_LIBRARIES} ${SYSTEM_LIBRARIES})

if(FRAMEWORK_THREAD_SAFE)
    set(framework_DEFINITIONS ${framework_DEFINITIONS} -DTHREAD_SAFE)
endif()

if(FRAMEWORK_GRAPHICS)
    set(OPENGLES "OFF" CACHE "Use OpenGL ES 1.0 or 2.0 (for mobiles devices)" STRING)
    set(OpenGL_GL_PREFERENCE "LEGACY")
    if(WASM)
        set(OPENGLES "2.0")
        set(framework_DEFINITIONS ${framework_DEFINITIONS} -DOPENGL_ES=2)
    ELSEif(OPENGLES STREQUAL "2.0")
        find_package(OpenGLES2 REQUIRED)
        find_package(EGL REQUIRED)
        set(framework_DEFINITIONS ${framework_DEFINITIONS} -DOPENGL_ES=2)
        set(framework_INCLUDE_DIRS ${framework_INCLUDE_DIRS} ${EGL_INCLUDE_DIR} ${OPENGLES2_INCLUDE_DIR})
        set(framework_LIBRARIES ${framework_LIBRARIES} ${EGL_LIBRARY} ${OPENGLES2_LIBRARY})
    ELSEif(OPENGLES STREQUAL "1.0")
        find_package(OpenGLES1 REQUIRED)
        find_package(EGL REQUIRED)
        set(framework_DEFINITIONS ${framework_DEFINITIONS} -DOPENGL_ES=1)
        set(framework_INCLUDE_DIRS ${framework_INCLUDE_DIRS} ${EGL_INCLUDE_DIR} ${OPENGLES1_INCLUDE_DIR})
        set(framework_LIBRARIES ${framework_LIBRARIES} ${EGL_LIBRARY} ${OPENGLES1_LIBRARY})
    else()
        ## TODO: CMake Documentation says that this is not the right
        # Thing for Mac OS X, but it works for now.
        if(APPLE)
            include_directories(/usr/X11R6/include/)
            link_directories(/usr/X11R6/lib/)
            SET(OPENGL_LIBRARIES GL)
        else()
            if(USE_STATIC_LIBS)
                set(CMAKE_FIND_LIBRARY_SUFFIXES ".so")
                find_package(OpenGL REQUIRED)
                set(CMAKE_FIND_LIBRARY_SUFFIXES ".a")
            else()
                find_package(OpenGL REQUIRED)            
            endif()
        endif()
        set(USE_STATIC_LIBS OFF)
        find_package(GLEW REQUIRED)
        set(USE_STATIC_LIBS ON)
        set(framework_LIBRARIES ${framework_LIBRARIES} ${GLEW_LIBRARY} ${OPENGL_LIBRARIES})
        MESSAGE(${framework_LIBRARIES})
    endif()
    message(STATUS "OpenGL ES: " ${OPENGLES})

    if(WIN32)
        option(WINDOWS_CONSOLE "Enables console window on Windows platform" OFF)
        if(WINDOWS_CONSOLE)
            message(STATUS "Windows console: ON")
        else()
            set(CMAKE_CXX_LINK_FLAGS "${CMAKE_CXX_LINK_FLAGS} -mwindows")
            message(STATUS "Windows console: OFF")
        endif()
    elseif(NOT WASM)
        set(framework_LIBRARIES ${framework_LIBRARIES} X11)
    endif()

    set(framework_SOURCES ${framework_SOURCES}
        ${CMAKE_CURRENT_LIST_DIR}/graphics/animatedtexture.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/animatedtexture.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/apngloader.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/apngloader.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/atlas.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/atlas.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/bitmapfont.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/bitmapfont.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/cachedtext.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/cachedtext.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/colorarray.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/coordsbuffer.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/coordsbuffer.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/declarations.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/deptharray.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/drawcache.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/drawcache.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/drawqueue.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/drawqueue.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/fontmanager.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/fontmanager.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/framebuffer.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/framebuffer.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/framebuffermanager.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/framebuffermanager.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/glutil.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/graphics.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/graphics.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/graph.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/graph.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/hardwarebuffer.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/hardwarebuffer.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/image.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/image.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/painter.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/painter.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/paintershaderprogram.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/paintershaderprogram.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/shader.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/shader.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/shaderprogram.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/shaderprogram.h
	${CMAKE_CURRENT_LIST_DIR}/graphics/shadermanager.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/shadermanager.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/textrender.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/textrender.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/texture.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/texture.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/texturemanager.cpp
        ${CMAKE_CURRENT_LIST_DIR}/graphics/texturemanager.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/vertexarray.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/shaders/newshader.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/shaders/shaders.h
        ${CMAKE_CURRENT_LIST_DIR}/graphics/shaders/shadersources.h

        # ui
        ${CMAKE_CURRENT_LIST_DIR}/ui/declarations.h
        ${CMAKE_CURRENT_LIST_DIR}/ui/ui.h
        ${CMAKE_CURRENT_LIST_DIR}/ui/uianchorlayout.cpp
        ${CMAKE_CURRENT_LIST_DIR}/ui/uianchorlayout.h
        ${CMAKE_CURRENT_LIST_DIR}/ui/uiboxlayout.cpp
        ${CMAKE_CURRENT_LIST_DIR}/ui/uiboxlayout.h
        ${CMAKE_CURRENT_LIST_DIR}/ui/uigridlayout.cpp
        ${CMAKE_CURRENT_LIST_DIR}/ui/uigridlayout.h
        ${CMAKE_CURRENT_LIST_DIR}/ui/uihorizontallayout.cpp
        ${CMAKE_CURRENT_LIST_DIR}/ui/uihorizontallayout.h
        ${CMAKE_CURRENT_LIST_DIR}/ui/uilayout.cpp
        ${CMAKE_CURRENT_LIST_DIR}/ui/uilayout.h
        ${CMAKE_CURRENT_LIST_DIR}/ui/uimanager.cpp
        ${CMAKE_CURRENT_LIST_DIR}/ui/uimanager.h
        ${CMAKE_CURRENT_LIST_DIR}/ui/uitextedit.cpp
        ${CMAKE_CURRENT_LIST_DIR}/ui/uitextedit.h
        ${CMAKE_CURRENT_LIST_DIR}/ui/uitranslator.cpp
        ${CMAKE_CURRENT_LIST_DIR}/ui/uitranslator.h
        ${CMAKE_CURRENT_LIST_DIR}/ui/uiverticallayout.cpp
        ${CMAKE_CURRENT_LIST_DIR}/ui/uiverticallayout.h
        ${CMAKE_CURRENT_LIST_DIR}/ui/uiwidget.cpp
        ${CMAKE_CURRENT_LIST_DIR}/ui/uiwidget.h
        ${CMAKE_CURRENT_LIST_DIR}/ui/uiwidgetbasestyle.cpp
        ${CMAKE_CURRENT_LIST_DIR}/ui/uiwidgetimage.cpp
        ${CMAKE_CURRENT_LIST_DIR}/ui/uiwidgettext.cpp

        # platform window
        ${CMAKE_CURRENT_LIST_DIR}/platform/platformwindow.cpp
        ${CMAKE_CURRENT_LIST_DIR}/platform/platformwindow.h
        ${CMAKE_CURRENT_LIST_DIR}/platform/win32window.cpp
        ${CMAKE_CURRENT_LIST_DIR}/platform/win32window.h
        ${CMAKE_CURRENT_LIST_DIR}/platform/x11window.cpp
        ${CMAKE_CURRENT_LIST_DIR}/platform/x11window.h
        ${CMAKE_CURRENT_LIST_DIR}/platform/sdlwindow.cpp
        ${CMAKE_CURRENT_LIST_DIR}/platform/sdlwindow.h

        # window input
        ${CMAKE_CURRENT_LIST_DIR}/input/mouse.cpp
        ${CMAKE_CURRENT_LIST_DIR}/input/mouse.h

        ${CMAKE_CURRENT_LIST_DIR}/core/graphicalapplication.cpp
        ${CMAKE_CURRENT_LIST_DIR}/core/graphicalapplication.h
    )
    set(framework_DEFINITIONS ${framework_DEFINITIONS} -DFW_GRAPHICS)
else()
    set(framework_SOURCES ${framework_SOURCES}
        ${CMAKE_CURRENT_LIST_DIR}/core/consoleapplication.cpp
        ${CMAKE_CURRENT_LIST_DIR}/core/consoleapplication.h
    )
endif()

if(FRAMEWORK_SOUND)
    find_package(OpenAL REQUIRED)
    find_package(VorbisFile REQUIRED)
    find_package(Vorbis REQUIRED)
    find_package(Ogg REQUIRED)

    set(framework_INCLUDE_DIRS ${framework_INCLUDE_DIRS} ${OPENAL_INCLUDE_DIR} ${VORBISFILE_INCLUDE_DIR})
    set(framework_LIBRARIES ${OPENAL_LIBRARY} ${VORBISFILE_LIBRARY} ${VORBIS_LIBRARY} ${OGG_LIBRARY} ${framework_LIBRARIES})

    if(WIN32)
        set(framework_LIBRARIES ${framework_LIBRARIES} winmm)
    elseif(APPLE)
        set(framework_LIBRARIES ${framework_LIBRARIES} System)
    endif()

    set(framework_SOURCES ${framework_SOURCES}
        ${CMAKE_CURRENT_LIST_DIR}/sound/combinedsoundsource.cpp
        ${CMAKE_CURRENT_LIST_DIR}/sound/combinedsoundsource.h
        ${CMAKE_CURRENT_LIST_DIR}/sound/declarations.h
        ${CMAKE_CURRENT_LIST_DIR}/sound/oggsoundfile.cpp
        ${CMAKE_CURRENT_LIST_DIR}/sound/oggsoundfile.h
        ${CMAKE_CURRENT_LIST_DIR}/sound/soundbuffer.cpp
        ${CMAKE_CURRENT_LIST_DIR}/sound/soundbuffer.h
        ${CMAKE_CURRENT_LIST_DIR}/sound/soundchannel.cpp
        ${CMAKE_CURRENT_LIST_DIR}/sound/soundchannel.h
        ${CMAKE_CURRENT_LIST_DIR}/sound/soundfile.cpp
        ${CMAKE_CURRENT_LIST_DIR}/sound/soundfile.h
        ${CMAKE_CURRENT_LIST_DIR}/sound/soundmanager.cpp
        ${CMAKE_CURRENT_LIST_DIR}/sound/soundmanager.h
        ${CMAKE_CURRENT_LIST_DIR}/sound/soundsource.cpp
        ${CMAKE_CURRENT_LIST_DIR}/sound/soundsource.h
        ${CMAKE_CURRENT_LIST_DIR}/sound/streamsoundsource.cpp
        ${CMAKE_CURRENT_LIST_DIR}/sound/streamsoundsource.h
    )
    set(framework_DEFINITIONS ${framework_DEFINITIONS} -DFW_SOUND)
endif()

if(FRAMEWORK_NET)
    if(WIN32)
        set(NET_LIBRARIES ws2_32 mswsock)
    else()
        set(NET_LIBRARIES "")
    endif()
    set(framework_LIBRARIES ${framework_LIBRARIES} ${NET_LIBRARIES})

    set(framework_SOURCES ${framework_SOURCES}
        ${CMAKE_CURRENT_LIST_DIR}/net/connection.cpp
        ${CMAKE_CURRENT_LIST_DIR}/net/connection.h
        ${CMAKE_CURRENT_LIST_DIR}/net/declarations.h
        ${CMAKE_CURRENT_LIST_DIR}/net/inputmessage.cpp
        ${CMAKE_CURRENT_LIST_DIR}/net/inputmessage.h
        ${CMAKE_CURRENT_LIST_DIR}/net/outputmessage.cpp
        ${CMAKE_CURRENT_LIST_DIR}/net/outputmessage.h
        ${CMAKE_CURRENT_LIST_DIR}/net/protocol.cpp
        ${CMAKE_CURRENT_LIST_DIR}/net/protocol.h
        ${CMAKE_CURRENT_LIST_DIR}/net/server.cpp
        ${CMAKE_CURRENT_LIST_DIR}/net/server.h
        ${CMAKE_CURRENT_LIST_DIR}/net/packet_player.cpp
        ${CMAKE_CURRENT_LIST_DIR}/net/packet_player.h
        ${CMAKE_CURRENT_LIST_DIR}/net/packet_recorder.cpp
        ${CMAKE_CURRENT_LIST_DIR}/net/packet_recorder.h
        ${CMAKE_CURRENT_LIST_DIR}/proxy/proxy.cpp
        ${CMAKE_CURRENT_LIST_DIR}/proxy/proxy.h
        ${CMAKE_CURRENT_LIST_DIR}/proxy/proxy_client.cpp
        ${CMAKE_CURRENT_LIST_DIR}/proxy/proxy_client.h
        ${CMAKE_CURRENT_LIST_DIR}/http/http.cpp
        ${CMAKE_CURRENT_LIST_DIR}/http/http.h
        ${CMAKE_CURRENT_LIST_DIR}/http/session.cpp
        ${CMAKE_CURRENT_LIST_DIR}/http/session.h
        ${CMAKE_CURRENT_LIST_DIR}/http/websocket.cpp
        ${CMAKE_CURRENT_LIST_DIR}/http/websocket.h
        ${CMAKE_CURRENT_LIST_DIR}/http/result.h
    )
    set(framework_DEFINITIONS ${framework_DEFINITIONS} -DFW_NET)
endif()

if(FRAMEWORK_XML)
    set(framework_SOURCES ${framework_SOURCES}
        ${CMAKE_CURRENT_LIST_DIR}/xml/tinyxml.cpp
        ${CMAKE_CURRENT_LIST_DIR}/xml/tinyxml.h
        ${CMAKE_CURRENT_LIST_DIR}/xml/tinystr.cpp
        ${CMAKE_CURRENT_LIST_DIR}/xml/tinystr.h
        ${CMAKE_CURRENT_LIST_DIR}/xml/tinyxmlerror.cpp
        ${CMAKE_CURRENT_LIST_DIR}/xml/tinyxmlparser.cpp
    )
    set(framework_DEFINITIONS ${framework_DEFINITIONS} -DFW_XML)
endif()

if(EXTRA_LIBS)
    set(framework_LIBRARIES ${framework_LIBRARIES} ${EXTRA_LIBS})
endif()

include_directories(${framework_INCLUDE_DIRS})
add_definitions(${framework_DEFINITIONS})

