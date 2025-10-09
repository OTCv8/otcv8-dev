# Framework Overview (UI, System, Input)

Poniżej znajduje się przegląd klas i metod z folderu `framework/`, odpowiedzialnych za interfejs graficzny, zarządzanie UI, inputy, zdarzenia i inne aspekty systemowe klienta.
# # framework/global.h

- `fatalError(const char* error, const char* file, int line)`
- `VALIDATE(expression)`
# # framework/luafunctions.cpp

- `e(exp, std::regex::ECMAScript)`
- `UIWidgetPtr(new UIWidget)`
- `UIVerticalLayoutPtr(new UIVerticalLayout(parent))`
- `UIHorizontalLayoutPtr(new UIHorizontalLayout(parent))`
- `UIGridLayoutPtr(new UIGridLayout(parent))`
- `UIAnchorLayoutPtr(new UIAnchorLayout(parent))`
- `UITextEditPtr(new UITextEdit)`
- `ProtocolPtr(new Protocol)`
- `InputMessagePtr(new InputMessage)`
- `OutputMessagePtr(new OutputMessage)`
# # framework/core/adaptiverenderer.h

class AdaptiveRenderer
- `newFrame()`
- `refresh()`
- `effetsLimit()`
- `creaturesLimit()`
- `itemsLimit()`
- `textsLimit()`
- `mapRenderInterval()`
- `creaturesRenderInterval()`
- `allowFading()`
- `getLevel()`
- `foregroundUpdateInterval()`
- `getDebugInfo()`
- `setForcedLevel(int value)`
# # framework/core/application.cpp

- `exitSignalHandler(int sig)`
- `signal(SIGTERM, exitSignalHandler)`
- `poll()`
- `c(g_resources.getBinaryName())`
- `exit()`
- `c(g_resources.getBinaryName(), boost::process::args(args))`
- `exit()`
# # framework/core/application.h

class Application
- `Application()`
- `init(std::vector<std::string>& args)`
- `deinit()`
- `terminate()`
- `poll()`
- `exit()`
- `quick_exit()`
- `close()`
- `restart()`
- `restartArgs(const std::vector<std::string>& args)`
- `setName(const std::string& name)`
- `setCompactName(const std::string& compactName)`
- `setVersion(const std::string& version)`
- `isRunning()`
- `isStopping()`
- `isTerminated()`
- `getCharset()`
- `getBuildCompiler()`
- `getBuildDate()`
- `getBuildRevision()`
- `getBuildCommit()`
- `getBuildType()`
- `getBuildType()`
- `getBuildArch()`
- `getAuthor()`
- `getOs()`
- `getStartupOptions()`
- `isMobile()`
- `registerLuaFunctions()`
# # framework/core/asyncdispatcher.cpp

- `lock(m_mutex)`
# # framework/core/asyncdispatcher.h

class AsyncDispatcher
class F
- `init()`
- `terminate()`
- `spawn_thread()`
- `stop()`
- `schedule(const F& task)`
- `lock(m_mutex)`
- `dispatch(std::function<void()> f)`
- `lock(m_mutex)`
- `exec_loop()`
# # framework/core/binarytree.cpp

- `node(new BinaryTree(m_fin))`
- `ret((char*)&m_buffer[m_pos], len)`
# # framework/core/binarytree.h

class BinaryTree
class OutputBinaryTree
- `BinaryTree(const FileStreamPtr& fin)`
- `seek(uint pos)`
- `skip(uint len)`
- `tell()`
- `size()`
- `getU8()`
- `getU16()`
- `getU32()`
- `getU64()`
- `getString(uint16 len = 0)`
- `getPoint()`
- `getChildren()`
- `canRead()`
- `unserialize()`
- `skipNodes()`
- `OutputBinaryTree(const FileStreamPtr& finish)`
- `addU8(uint8 v)`
- `addU16(uint16 v)`
- `addU32(uint32 v)`
- `addString(const std::string& v)`
- `addPos(uint16 x, uint16 y, uint8 z)`
- `addPoint(const Point& point)`
- `startNode(uint8 node)`
- `endNode()`
- `write(const uint8* data, size_t size)`
# # framework/core/clock.h

class Clock
- `Clock()`
- `update()`
- `micros()`
- `millis()`
- `seconds()`
- `realMicros()`
- `realMillis()`
# # framework/core/config.h

class Config
- `Config()`
- `load(const std::string& file)`
- `unload()`
- `save()`
- `clear()`
- `setValue(const std::string& key, const std::string& value)`
- `setList(const std::string& key, const std::vector<std::string>& list)`
- `getValue(const std::string& key)`
- `getList(const std::string& key)`
- `setNode(const std::string& key, const OTMLNodePtr& node)`
- `mergeNode(const std::string& key, const OTMLNodePtr& node)`
- `getNode(const std::string& key)`
- `getNodeSize(const std::string& key)`
- `exists(const std::string& key)`
- `remove(const std::string& key)`
- `getFileName()`
- `isLoaded()`
- `asConfig()`
# # framework/core/configmanager.cpp

- `Config())`
- `Config())`
- `Config())`
# # framework/core/configmanager.h

class ConfigManager
- `init()`
- `terminate()`
- `getSettings()`
- `get(const std::string& file)`
- `create(const std::string& file)`
- `loadSettings(const std::string file)`
- `load(const std::string& file)`
- `unload(const std::string& file)`
- `remove(const ConfigPtr config)`
# # framework/core/consoleapplication.cpp

- `poll()`
# # framework/core/consoleapplication.h

class ConsoleApplication
- `run()`
# # framework/core/declarations.h

class ConfigManager
class ModuleManager
class ResourceManager
class Module
class Config
class Event
class ScheduledEvent
class FileStream
class BinaryTree
class OutputBinaryTree
# # framework/core/event.h

class Event
- `Event(const std::string& function, const std::function<void()>& callback, bool botSafe = false)`
- `execute()`
- `cancel()`
- `isCanceled()`
- `isExecuted()`
- `isBotSafe()`
# # framework/core/eventdispatcher.cpp

- `s(this == &g_dispatcher ? STATS_MAIN : STATS_RENDER, "PollDispatcher")`
- `lock(m_mutex)`
- `s2(STATS_DISPATCHER, scheduledEvent->getFunction())`
- `s2(STATS_DISPATCHER, event->getFunction())`
- `ScheduledEventPtr(new ScheduledEvent("", nullptr, delay, 1))`
- `lock(m_mutex)`
- `scheduledEvent(new ScheduledEvent(function, callback, delay, 1, g_app.isOnInputEvent()))`
- `ScheduledEventPtr(new ScheduledEvent("", nullptr, delay, 0))`
- `lock(m_mutex)`
- `scheduledEvent(new ScheduledEvent(function, callback, delay, 0, g_app.isOnInputEvent()))`
- `EventPtr(new Event("", nullptr))`
- `event(new Event(function, callback, g_app.isOnInputEvent()))`
- `lock(m_mutex)`
# # framework/core/eventdispatcher.h

class EventDispatcher
- `shutdown()`
- `poll()`
- `addEventEx(const std::string& function, const std::function<void()>& callback, bool pushFront = false)`
- `scheduleEventEx(const std::string& function, const std::function<void()>& callback, int delay)`
- `cycleEventEx(const std::string& function, const std::function<void()>& callback, int delay)`
- `isBotSafe()`
# # framework/core/filestream.cpp

- `PHYSFS_fileLength(m_fileHandle)`
- `PHYSFS_tell(m_fileHandle)`
- `PHYSFS_eof(m_fileHandle)`
- `buffer(len, 0)`
- `start(getBinaryTree): %d", byte))`
- `BinaryTreePtr(new BinaryTree(asFileStream()))`
# # framework/core/filestream.h

class FileStream
- `FileStream(const std::string& name, PHYSFS_File *fileHandle, bool writeable)`
- `close()`
- `flush()`
- `write(const void *buffer, uint count)`
- `read(void *buffer, uint size, uint nmemb = 1)`
- `seek(uint pos)`
- `skip(uint len)`
- `size()`
- `tell()`
- `eof()`
- `name()`
- `getU8()`
- `getU16()`
- `getU32()`
- `getU64()`
- `get8()`
- `get16()`
- `get32()`
- `get64()`
- `getString()`
- `getBinaryTree()`
- `startNode(uint8 n)`
- `endNode()`
- `addU8(uint8 v)`
- `addU16(uint16 v)`
- `addU32(uint32 v)`
- `addU64(uint64 v)`
- `add8(int8 v)`
- `add16(int16 v)`
- `add32(int32 v)`
- `add64(int64 v)`
- `addString(const std::string& v)`
- `addPos(uint16 x, uint16 y, uint8 z)`
- `addPoint(const Point& p)`
- `asFileStream()`
- `initFromGzip(const std::string& buffer)`
- `checkWrite()`
- `throwError(const std::string& message, bool physfsError = false)`
# # framework/core/graphicalapplication.cpp

- `resize(g_window.getSize())`
- `poll()`
- `poll()`
- `s(STATS_MAIN, "Sleep")`
- `s(STATS_MAIN, "DrawMapBackground")`
- `s(STATS_MAIN, "DrawMapForeground")`
- `s(STATS_MAIN, "DrawForeground")`
- `s(STATS_MAIN, "Sleep")`
- `s(STATS_RENDER, "Sleep")`
- `s(STATS_RENDER, "Sleep")`
- `s(STATS_RENDER, "Wait")`
- `s(STATS_RENDER, "SetupScaling")`
- `s(STATS_RENDER, "UpdateMap")`
- `s(STATS_RENDER, "Clear")`
- `s(STATS_RENDER, "DrawFirstForeground")`
- `s(STATS_RENDER, "DrawMapBackground")`
- `s(STATS_RENDER, "DrawMapForeground")`
- `s(STATS_RENDER, "DrawSecondForeground")`
- `s(STATS_RENDER, "DrawGraphs")`
- `s(STATS_RENDER, "DrawScaled")`
- `s(STATS_RENDER, "SwapBuffers")`
- `scale(m_scaling)`
- `image(resolution, 4, pixels->data())`
# # framework/core/graphicalapplication.h

class GraphicalApplication
- `init(std::vector<std::string>& args)`
- `deinit()`
- `terminate()`
- `run()`
- `poll()`
- `pollGraphics()`
- `close()`
- `willRepaint()`
- `repaint()`
- `setMaxFps(int maxFps)`
- `getMaxFps()`
- `getFps()`
- `getGraphicsFps()`
- `getProcessingFps()`
- `isOnInputEvent()`
- `getIteration()`
- `doScreenshot(std::string file)`
- `scaleUp()`
- `scaleDown()`
- `scale(float value)`
- `setSmooth(bool value)`
- `doMapScreenshot(std::string fileName)`
- `resize(const Size& size)`
- `inputEvent(InputEvent event)`
# # framework/core/inputevent.h

- `reset(Fw::InputEventType eventType = Fw::NoInputEvent)`
# # framework/core/logger.cpp

- `lock(m_mutex, std::try_to_lock)`
- `exit(-1)`
- `lock(m_mutex)`
- `lock(m_mutex)`
- `lock(m_mutex)`
- `fatalError(const char* error, const char* file, int line)`
# # framework/core/logger.h

class Logger
- `log(Fw::LogLevel level, const std::string& message)`
- `logFunc(Fw::LogLevel level, const std::string& message, std::string prettyFunction)`
- `debug(const std::string& what)`
- `info(const std::string& what)`
- `warning(const std::string& what)`
- `error(const std::string& what)`
- `fatal(const std::string& what)`
- `fireOldMessages()`
- `setLogFile(const std::string& file)`
- `setOnLog(const OnLogCallback& onLog)`
- `getLastLog()`
- `setTestingMode()`
- `logTraceCounter()`
- `logTraceFrameCounter()`
# # framework/core/module.cpp

- `errorHandler(e.what())`
- `load()`
# # framework/core/module.h

class Module
class ModuleManager
- `Module(const std::string& name)`
- `load()`
- `unload()`
- `reload()`
- `canUnload()`
- `canReload()`
- `isLoaded()`
- `isReloadable()`
- `isDependent()`
- `isSandboxed()`
- `hasDependency(const std::string& name, bool recursive = false)`
- `getSandbox(LuaInterface *lua)`
- `getDescription()`
- `getName()`
- `getAuthor()`
- `getWebsite()`
- `getVersion()`
- `isAutoLoad()`
- `getAutoLoadPriority()`
- `asModule()`
- `discover(const OTMLNodePtr& moduleNode)`
# # framework/core/modulemanager.cpp

- `Module(name))`
# # framework/core/modulemanager.h

class ModuleManager
class Module
- `clear()`
- `discoverModules()`
- `autoLoadModules(int maxPriority)`
- `discoverModule(const std::string& moduleFile)`
- `ensureModuleLoaded(const std::string& moduleName)`
- `unloadModules()`
- `reloadModules()`
- `getModule(const std::string& moduleName)`
- `getModules()`
- `updateModuleLoadOrder(ModulePtr module)`
# # framework/core/resourcemanager.cpp

- `PHYSFS_init(argv0)`
- `path(std::filesystem::u8path(localDir))`
- `c(binary.string())`
- `localDir(PHYSFS_getWriteDir())`
- `directory(or data.zip)")`
- `file(m_binaryPath.string(), std::ios::binary)`
- `v(1 + size)`
- `buffer(readFileContents(fileName))`
- `buffer(fileSize, 0)`
- `buffer(size)`
- `writeFileBuffer(fileName, (const uchar*)data.c_str(), data.size())`
- `FileStreamPtr(new FileStream(fullPath, readFileContents(fullPath)))`
- `FileStreamPtr(new FileStream(fullPath, file, false))`
- `FileStreamPtr(new FileStream(fileName, file, true))`
- `FileStreamPtr(new FileStream(fileName, file, true))`
- `PHYSFS_mkdir(directory.c_str())`
- `buffer(fileSize, 0)`
- `name(file_stat.name)`
- `file(m_binaryPath.string(), std::ios::binary)`
- `buffer(std::istreambuf_iterator<char>(file), {})`
- `chunk(CHUNK_SIZE)`
- `path(m_binaryPath)`
- `newBinaryPath(std::filesystem::u8path(PHYSFS_getWriteDir()))`
- `data(zipSize, '\0')`
- `name(file_stat.name)`
- `buffer(file_stat.size, '\0')`
- `str(entry.path().string())`
- `in_file(it, std::ios::binary)`
- `buffer(std::istreambuf_iterator<char>(in_file), {})`
- `out_file(it, std::ios::binary)`
- `new_buffer(24 + buffer.size() * 2, '0')`
# # framework/core/resourcemanager.h

class ResourceManager
- `init(const char *argv0)`
- `terminate()`
- `launchCorrect(const std::string& product, const std::string& app)`
- `setupWriteDir(const std::string& product, const std::string& app)`
- `setup()`
- `getCompactName()`
- `loadDataFromSelf(bool unmountIfMounted = false)`
- `fileExists(const std::string& fileName)`
- `directoryExists(const std::string& directoryName)`
- `readFileStream(const std::string& fileName, std::iostream& out)`
- `readFileContents(const std::string& fileName, bool safe = false)`
- `readFileContentsSafe(const std::string& fileName)`
- `readFileContents(fileName, true)`
- `isFileEncryptedOrCompressed(const std::string& fileName)`
- `writeFileBuffer(const std::string& fileName, const uchar* data, uint size)`
- `writeFileContents(const std::string& fileName, const std::string& data)`
- `writeFileStream(const std::string& fileName, std::iostream& in)`
- `openFile(const std::string& fileName, bool dontCache = false)`
- `appendFile(const std::string& fileName)`
- `createFile(const std::string& fileName)`
- `deleteFile(const std::string& fileName)`
- `makeDir(const std::string directory)`
- `listDirectoryFiles(const std::string & directoryPath = "", bool fullPath = false, bool raw = false)`
- `resolvePath(std::string path)`
- `getWorkDir()`
- `getWriteDir()`
- `getBinaryName()`
- `getWriteDir()`
- `getBinaryName()`
- `guessFilePath(const std::string& filename, const std::string& type)`
- `isFileType(const std::string& filename, const std::string& type)`
- `isLoadedFromArchive()`
- `isLoadedFromMemory()`
- `fileChecksum(const std::string& path)`
- `filesChecksums()`
- `selfChecksum()`
- `readCrashLog(bool txt)`
- `deleteCrashLog()`
- `updateData(const std::set<std::string>& files, bool reMount)`
- `updateExecutable(std::string fileName)`
- `createArchive(const std::map<std::string, std::string>& files)`
- `decompressArchive(std::string dataOrPath)`
- `encrypt(const std::string& seed = "")`
- `encryptBuffer(std::string & buffer, uint32_t seed = 0)`
- `decryptBuffer(std::string & buffer)`
- `installDlls(std::filesystem::path dest)`
- `setLayout(std::string layout)`
- `getLayout()`
- `mountMemoryData(const std::shared_ptr<std::vector<uint8_t>>& data)`
- `unmountMemoryData()`
# # framework/core/scheduledevent.h

class ScheduledEvent
- `ScheduledEvent(const std::string& function, const std::function<void()>& callback, int delay, int maxCycles, bool botSafe = false)`
- `execute()`
- `nextCycle()`
- `ticks()`
- `remainingTicks()`
- `delay()`
- `cyclesExecuted()`
- `maxCycles()`
- `operator()(const ScheduledEventPtr& a, const ScheduledEventPtr& b)`
# # framework/core/timer.h

class Timer
- `Timer()`
- `restart()`
- `stop()`
- `adjust(ticks_t value)`
- `startTicks()`
- `ticksElapsed()`
- `timeElapsed()`
- `running()`
# # framework/graphics/animatedtexture.cpp

- `Texture(frames[i], buildMipmaps, compress))`
# # framework/graphics/animatedtexture.h

class AnimatedTexture
- `AnimatedTexture(const Size& size, std::vector<ImagePtr> frames, std::vector<int> framesDelay, bool buildMipmaps = false, bool compress = false)`
- `replace(const ImagePtr& image)`
- `update()`
- `isAnimatedTexture()`
- `buildHardwareMipmaps()`
- `setSmooth(bool smooth)`
- `setRepeat(bool repeat)`
# # framework/graphics/apngloader.cpp

- `read32(std::istream& f1)`
- `read16(std::istream& f1)`
- `readshort(unsigned char * p)`
- `read_sub_row(unsigned char * row, unsigned int rowbytes, unsigned int bpp)`
- `read_up_row(unsigned char * row, unsigned char * prev_row, unsigned int rowbytes, unsigned int bpp)`
- `read_average_row(unsigned char * row, unsigned char * prev_row, unsigned int rowbytes, unsigned int bpp)`
- `read_paeth_row(unsigned char * row, unsigned char * prev_row, unsigned int rowbytes, unsigned int bpp)`
- `unpack(z_stream& zstream, unsigned char * dst, unsigned int dst_size, unsigned char * src, unsigned int src_size, unsigned int h, unsigned int rowbytes, unsigned char bpp)`
- `read_sub_row(row, rowbytes, bpp)`
- `read_up_row(row, prev_row, rowbytes, bpp)`
- `read_average_row(row, prev_row, rowbytes, bpp)`
- `read_paeth_row(row, prev_row, rowbytes, bpp)`
- `compose0(unsigned char * dst1, unsigned int dstbytes1, unsigned char * dst2, unsigned int dstbytes2, unsigned char * src, unsigned int srcbytes, unsigned int w, unsigned int h, unsigned int bop, unsigned char depth)`
- `compose2(unsigned char * dst1, unsigned int dstbytes1, unsigned char * dst2, unsigned int dstbytes2, unsigned char * src, unsigned int srcbytes, unsigned int w, unsigned int h, unsigned int bop, unsigned char depth)`
- `compose3(unsigned char * dst1, unsigned int dstbytes1, unsigned char * dst2, unsigned int dstbytes2, unsigned char * src, unsigned int srcbytes, unsigned int w, unsigned int h, unsigned int bop, unsigned char depth)`
- `compose4(unsigned char * dst, unsigned int dstbytes, unsigned char * src, unsigned int srcbytes, unsigned int w, unsigned int h, unsigned int bop, unsigned char depth)`
- `compose6(unsigned char * dst, unsigned int dstbytes, unsigned char * src, unsigned int srcbytes, unsigned int w, unsigned int h, unsigned int bop, unsigned char depth)`
- `load_apng(std::stringstream& file, struct apng_data *apng)`
- `compose0(pDst1, outrow1, pDst2, outrow2, pTemp, rowbytes+1, w0, h0, bop, depth)`
- `compose2(pDst1, outrow1, pDst2, outrow2, pTemp, rowbytes+1, w0, h0, bop, depth)`
- `compose3(pDst1, outrow1, pDst2, outrow2, pTemp, rowbytes+1, w0, h0, bop, depth)`
- `compose4(pDst1, outrow1,                 pTemp, rowbytes+1, w0, h0, bop, depth)`
- `compose6(                pDst2, outrow2, pTemp, rowbytes+1, w0, h0, bop, depth)`
- `memset(pDst2, 0, w0*4)`
- `memset(pDst2, 0, w0*4)`
- `memset(pDst2, 0, w0*4)`
- `memset(pDst1, 0, w0*2)`
- `memset(pDst2, 0, w0*4)`
- `compose0(pDst1, outrow1, pDst2, outrow2, pTemp, rowbytes+1, w0, h0, bop, depth)`
- `compose2(pDst1, outrow1, pDst2, outrow2, pTemp, rowbytes+1, w0, h0, bop, depth)`
- `compose3(pDst1, outrow1, pDst2, outrow2, pTemp, rowbytes+1, w0, h0, bop, depth)`
- `compose4(pDst1, outrow1,                 pTemp, rowbytes+1, w0, h0, bop, depth)`
- `compose6(                pDst2, outrow2, pTemp, rowbytes+1, w0, h0, bop, depth)`
- `write_chunk(std::ostream& f, const char* name, unsigned char* data, unsigned int length)`
- `write_IDATs(std::ostream& f, unsigned char* data, unsigned int length, unsigned int idat_size)`
- `save_png(std::stringstream& f, unsigned int width, unsigned int height, int channels, unsigned char *pixels)`
- `write_IDATs(f, zbuf2, zstream2.total_out, idat_size)`
- `free_apng(struct apng_data *apng)`
# # framework/graphics/apngloader.h

- `load_apng(std::stringstream& file, struct apng_data *apng)`
- `save_png(std::stringstream& file, unsigned int width, unsigned int height, int channels, unsigned char *pixels)`
- `free_apng(struct apng_data *apng)`
# # framework/graphics/atlas.cpp

- `Point(-1, -1)`
- `Point(-1, -1)`
# # framework/graphics/atlas.h

class Atlas
- `init()`
- `terminate()`
- `reload()`
- `cache(uint64_t hash, const Size& size, bool& draw)`
- `cacheFont(const TexturePtr& fontTexture)`
- `get(int location)`
- `bind()`
- `release()`
- `getStats()`
- `reset()`
- `resetAtlas(int location)`
- `findSpace(int location, int index)`
- `calculateIndex(const Size& size)`
# # framework/graphics/bitmapfont.cpp

- `offset(0, 0)`
- `screenCoords(startPos, boxSize)`
- `glyphScreenCoords(glyphsPositions[i], m_glyphsSize[glyph])`
- `glyphsPositions(1)`
- `lineWidths(1)`
- `virtualPos(0, m_yOffset)`
- `updateColors(colors, lastColorSeparator, 1)`
# # framework/graphics/bitmapfont.h

class BitmapFont
- `BitmapFont(const std::string& name) : m_name(name)`
- `load(const OTMLNodePtr& fontNode)`
- `drawText(const std::string& text, const Point& startPos, const Color& color = Color::white, bool shadow = false)`
- `drawText(const std::string& text, const Rect& screenCoords, Fw::AlignmentFlag align = Fw::AlignTopLeft, const Color& color = Color::white, bool shadow = false)`
- `drawColoredText(const std::string& text, const Rect& screenCoords, Fw::AlignmentFlag align, const std::vector<std::pair<int, Color>>& colors, bool shadow = false)`
- `calculateDrawTextCoords(CoordsBuffer& coordsBuffer, const std::string& text, const Rect& screenCoords, Fw::AlignmentFlag align = Fw::AlignTopLeft)`
- `calculateTextRectSize(const std::string& text)`
- `wrapText(const std::string& text, int maxWidth, std::vector<std::pair<int, Color>>* colors = nullptr)`
- `getId()`
- `getName()`
- `getGlyphHeight()`
- `getYOffset()`
- `getGlyphSpacing()`
- `calculateGlyphsWidthsAutomatically(const ImagePtr& image, const Size& glyphSize)`
- `updateColors(std::vector<std::pair<int, Color>>* colors, int pos, int newTextLen)`
# # framework/graphics/cachedtext.cpp

- `c(Color::white)`
# # framework/graphics/cachedtext.h

class CachedText
- `CachedText()`
- `draw(const Rect& rect, const Color& color)`
- `wrapText(int maxWidth)`
- `setFont(const BitmapFontPtr& font)`
- `setText(const std::string& text)`
- `setColoredText(const std::vector<std::string>& texts)`
- `setAlign(Fw::AlignmentFlag align)`
- `getTextSize()`
- `getText()`
- `getFont()`
- `getAlign()`
- `hasText()`
- `update()`
# # framework/graphics/colorarray.h

class ColorArray
- `addColor(float r, float g, float b, float a)`
- `addColor(const Color& c)`
- `clear()`
- `colorCount()`
- `count()`
- `size()`
# # framework/graphics/coordsbuffer.cpp

- `addRect(Rect(right - w + 1, top, w, height - w))`
- `addRect(Rect(left + w, bottom - w + 1, width - w, w))`
- `addRect(Rect(left, top + w, w, height - w))`
- `virtualDest(0, 0, dest.size())`
- `partialDest(x, y, src.size())`
- `partialSrc(src)`
- `Rect(Point(x1, y1), Point(x2, y2))`
# # framework/graphics/coordsbuffer.h

class CoordsBuffer
- `CoordsBuffer()`
- `clear()`
- `addTriangle(const Point& a, const Point& b, const Point& c)`
- `addRect(const Rect& dest)`
- `addRect(const Rect& dest, const Rect& src)`
- `addRect(const RectF& dest, const RectF& src)`
- `addQuad(const Rect& dest, const Rect& src)`
- `addUpsideDownQuad(const Rect& dest, const Rect& src)`
- `addBoudingRect(const Rect& dest, int innerLineWidth)`
- `addRepeatedRects(const Rect& dest, const Rect& src)`
- `getVertexCount()`
- `getTextureCoordCount()`
- `unlock(bool clear = false)`
- `cache()`
- `getTextureRect()`
# # framework/graphics/declarations.h

class Texture
class TextureManager
class Image
class AnimatedTexture
class BitmapFont
class CachedText
class FrameBuffer
class FrameBufferManager
class Shader
class ShaderProgram
class PainterShaderProgram
# # framework/graphics/deptharray.h

class DepthArray
- `addDepth(float depth)`
- `clear()`
- `depthCount()`
- `count()`
- `size()`
# # framework/graphics/drawcache.cpp

- `emptyRect(Point(-10, -10), Point(-10, -10))`
# # framework/graphics/drawcache.h

class DrawCache
- `draw()`
- `bind()`
- `release()`
- `hasSpace(int size)`
- `getSize()`
- `addRect(const Rect& dest, const Color& color)`
- `addTexturedRect(const Rect& dest, const Rect& src, const Color& color)`
- `addCoords(CoordsBuffer& coords, const Color& color)`
- `addTexturedCoords(CoordsBuffer& coords, const Point& offset, const Color& color)`
- `addRectRaw(float* dest, const Rect& rect)`
- `addColorRaw(const Color& color, int count)`
# # framework/graphics/drawqueue.cpp

- `vertices(1024, 0)`
- `DrawQueueItemText(screenCoords.topLeft(), font->getTexture(), hash, color, shadow))`
- `DrawQueueItemTextColored(screenCoords.topLeft(), font->getTexture(), hash, colors, shadow))`
# # framework/graphics/drawqueue.h

class DrawQueue
class DrawQueue
- `draw()`
- `draw(const Point& pos)`
- `cache()`
- `draw()`
- `draw(const Point& pos)`
- `cache()`
- `draw()`
- `draw(const Point& pos)`
- `cache()`
- `draw()`
- `draw()`
- `draw(const Point& pos)`
- `cache()`
- `cache()`
- `draw()`
- `cache()`
- `draw()`
- `draw()`
- `draw()`
- `start(DrawQueue* queue)`
- `end(DrawQueue* queue)`
- `start(DrawQueue* queue)`
- `end(DrawQueue* queue)`
- `start(DrawQueue* queue)`
- `end(DrawQueue* queue)`
- `draw(DrawType drawType = DRAW_ALL)`
- `add(DrawQueueItem* item)`
- `DrawQueueItemTexturedRect(dest, texture, src, color))`
- `addTextureCoords(CoordsBuffer& coords, const TexturePtr& texture, const Color& color = Color::white)`
- `DrawQueueItemTextureCoords(coords, texture, color))`
- `addColoredTextureCoords(CoordsBuffer& coords, const TexturePtr& texture, const std::vector<std::pair<int, Color>>& colors)`
- `DrawQueueItemColoredTextureCoords(coords, texture, colors))`
- `addFilledRect(const Rect& dest, const Color& color = Color::white)`
- `DrawQueueItemFilledRect(dest, color))`
- `addFillCoords(CoordsBuffer& coords, const Color& color = Color::white)`
- `DrawQueueItemFillCoords(coords, color))`
- `addClearRect(const Rect& dest, const Color& color = Color::white)`
- `DrawQueueItemClearRect(dest, color))`
- `addText(BitmapFontPtr font, const std::string& text, const Rect& screenCoords, Fw::AlignmentFlag align = Fw::AlignTopLeft, const Color& color = Color::white, bool shadow = false)`
- `addColoredText(BitmapFontPtr font, const std::string& text, const Rect& screenCoords, Fw::AlignmentFlag align, const std::vector<std::pair<int, Color>>& colors, bool shadow = false)`
- `addFilledTriangle(const Point& a, const Point& b, const Point& c, const Color& color = Color::white)`
- `addBoundingRect(const Rect& dest, int innerLineWidth, const Color& color = Color::white)`
- `addLine(const std::vector<Point>& points, int width, const Color& color = Color::white)`
- `DrawQueueItemLine(points, width, color))`
- `setFrameBuffer(const Rect& dest, const Size& size, const Rect& src)`
- `hasFrameBuffer()`
- `getFrameBufferDest()`
- `getFrameBufferSize()`
- `getFrameBufferSrc()`
- `size()`
- `setOpacity(size_t start, float opacity)`
- `setClip(size_t start, const Rect& clip)`
- `DrawQueueConditionClip(start, m_queue.size(), clip))`
- `setRotation(size_t start, const Point& center, float angle)`
- `DrawQueueConditionRotation(start, m_queue.size(), center, angle))`
- `setMark(size_t start, const Color& color)`
- `DrawQueueConditionMark(start, m_queue.size(), color))`
- `markMapPosition()`
- `correctOutfit(const Rect& dest, int fromPos, bool oldScaling)`
- `setShader(const std::string& shader)`
- `getShader()`
# # framework/graphics/fontmanager.cpp

- `BitmapFont("emptyfont"))`
- `BitmapFont("emptyfont"))`
- `font(new BitmapFont(name))`
- `getDefaultFont()`
# # framework/graphics/fontmanager.h

class FontManager
- `FontManager()`
- `terminate()`
- `clearFonts()`
- `importFont(std::string file)`
- `fontExists(const std::string& fontName)`
- `getFont(const std::string& fontName)`
- `getDefaultFont()`
- `setDefaultFont(const std::string& fontName)`
# # framework/graphics/framebuffer.cpp

- `internalCreate()`
- `Texture(size, false, m_smooth, true))`
- `internalBind()`
- `internalRelease()`
- `rect(0, 0, getSize())`
- `ret(width * height * sizeof(GLubyte), 0)`
- `image(size, 4, pixels->data())`
# # framework/graphics/framebuffer.h

class FrameBuffer
class FrameBufferManager
- `FrameBuffer(bool withDepth = false)`
- `resize(const Size& size)`
- `bind(const FrameBufferPtr& depthFramebuffer = nullptr)`
- `release()`
- `draw()`
- `draw(const Rect& dest)`
- `draw(const Rect& dest, const Rect& src)`
- `setSmooth(bool enabled)`
- `getTexture()`
- `getSize()`
- `isSmooth()`
- `getDepthRenderBuffer()`
- `hasDepth()`
- `readPixels()`
- `doScreenshot(std::string fileName)`
- `internalCreate()`
- `internalBind()`
- `internalRelease()`
# # framework/graphics/framebuffermanager.cpp

- `FrameBuffer())`
- `FrameBuffer())`
- `FrameBuffer(withDepth))`
# # framework/graphics/framebuffermanager.h

class FrameBufferManager
- `init()`
- `terminate()`
- `clear()`
- `createFrameBuffer(bool withDepth = false)`
# # framework/graphics/graph.cpp

- `vertices(MAX_CAPACITY * 2, 0)`
- `lock(m_mutex)`
- `lock(m_mutex)`
# # framework/graphics/graph.h

class to
class Graph
- `Graph(const std::string& name, size_t capacity = 100)`
- `draw(const Rect& dest)`
- `clear()`
- `addValue(int value, bool ignoreSmallValues = false)`
# # framework/graphics/graphics.cpp

- `glEnable(GL_BLEND)`
- `checkDepthSupport()`
- `Painter()`
# # framework/graphics/graphics.h

class Painter
class Graphics
- `Graphics()`
- `init()`
- `terminate()`
- `resize(const Size& size)`
- `checkDepthSupport()`
- `getMaxTextureSize()`
- `getVendor()`
- `getRenderer()`
- `getVersion()`
- `getExtensions()`
- `ok()`
- `checkForError(const std::string& function, const std::string& file, int line)`
- `checkDepthSupport()`
# # framework/graphics/hardwarebuffer.h

class HardwareBuffer
- `bind()`
- `unbind(Type type)`
- `write(void *data, int count, UsagePattern usage)`
# # framework/graphics/image.cpp

- `Image(Size(apng.width, apng.height), apng.bpp, apng.pdata))`
- `temp((char*)data, size)`
- `fin(temp)`
- `Image(Size(apng.width, apng.height), apng.bpp, apng.pdata))`
- `newImage(new Image(m_size * 2))`
- `pixels(ow*oh*4, 0xFF)`
- `image(new Image(Size(size + border * 2, size + border * 2)))`
# # framework/graphics/image.h

class Image
- `Image(const Size& size, int bpp = 4, uint8 *pixels = nullptr)`
- `load(std::string file)`
- `loadPNG(const std::string& file)`
- `loadPNG(const void* data, uint32_t size)`
- `savePNG(const std::string& fileName)`
- `blit(const Point& dest, const ImagePtr& other)`
- `paste(const ImagePtr& other)`
- `upscale()`
- `resize(const Size& size)`
- `nextMipmap()`
- `setPixel(int x, int y, uint8 *pixel)`
- `setPixel(int x, int y, uint32_t argb)`
- `setPixel(int x, int y, const Color& color)`
- `getPixelCount()`
- `getWidth()`
- `getHeight()`
- `getBpp()`
- `fromQRCode(const std::string& code, int border)`
# # framework/graphics/painter.cpp

- `setResolution(g_window.getSize())`
- `resetDepth()`
- `updateDepthFunc()`
- `setDepth(m_olderStates[m_oldStateIndex].depth)`
- `glClearDepthf(0.99f)`
- `glClearDepth(0.99f)`
- `glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)`
- `glClear(GL_COLOR_BUFFER_BIT)`
- `glClearDepthf(0.99f)`
- `glClearDepth(0.99f)`
- `glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT)`
- `glClear(GL_COLOR_BUFFER_BIT)`
- `setClipRect(oldClipRect)`
- `glBlendFuncSeparate(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA, GL_ONE, GL_ONE)`
- `glBlendFunc(GL_DST_COLOR, GL_ONE_MINUS_SRC_ALPHA)`
- `glBlendFunc(GL_ONE, GL_ONE)`
- `glBlendFunc(GL_ONE, GL_ZERO)`
- `glBlendFunc(GL_ONE_MINUS_DST_ALPHA, GL_DST_ALPHA)`
- `glBlendFunc(GL_ZERO, GL_SRC_COLOR)`
- `glBlendFuncSeparate(GL_ZERO, GL_ONE, GL_ONE, GL_ZERO)`
- `glBlendFuncSeparate(GL_ZERO, GL_ONE, GL_ONE, GL_ONE)`
- `glBlendFuncSeparate(GL_ONE_MINUS_DST_ALPHA, GL_DST_ALPHA, GL_ONE, GL_ONE)`
- `glDisable(GL_DEPTH_TEST)`
- `glDepthFunc(GL_ALWAYS)`
- `glDepthFunc(GL_ALWAYS)`
- `glDepthFunc(GL_EQUAL)`
- `glDepthFunc(GL_LEQUAL)`
- `glDepthFunc(GL_LEQUAL)`
- `glDepthFunc(GL_LESS)`
- `glDepthFunc(GL_LESS)`
- `glColorMask(1, 1, 1, 0)`
- `glBindTexture(GL_TEXTURE_2D, activeTexture)`
- `glBindTexture(GL_TEXTURE_2D, activeTexture)`
# # framework/graphics/painter.h

class Painter
- `bind()`
- `unbind()`
- `resetState()`
- `refreshState()`
- `saveState()`
- `saveAndResetState()`
- `restoreSavedState()`
- `clear(const Color& color)`
- `clearRect(const Color& color, const Rect& rect)`
- `setTransformMatrix(const Matrix3& transformMatrix)`
- `setProjectionMatrix(const Matrix3& projectionMatrix)`
- `setTextureMatrix(const Matrix3& textureMatrix)`
- `setCompositionMode(CompositionMode compositionMode)`
- `setBlendEquation(BlendEquation blendEquation)`
- `setDepthFunc(DepthFunc func)`
- `setClipRect(const Rect& clipRect)`
- `setShaderProgram(PainterShaderProgram* shaderProgram)`
- `setTexture(const TexturePtr& texture)`
- `setAlphaWriting(bool enable)`
- `setResolution(const Size& resolution)`
- `scale(float x, float y)`
- `translate(float x, float y)`
- `rotate(float angle)`
- `rotate(float x, float y, float angle)`
- `pushTransformMatrix()`
- `popTransformMatrix()`
- `getTransformMatrix()`
- `getProjectionMatrix()`
- `getTextureMatrix()`
- `getBlendEquation()`
- `getAlphaWriting()`
- `resetBlendEquation()`
- `resetTexture()`
- `resetAlphaWriting()`
- `resetTransformMatrix()`
- `drawCoords(CoordsBuffer& coordsBuffer, DrawMode drawMode = Triangles, ColorArray* colorBuffer = nullptr, const std::vector<std::pair<int, Color>>* colors = nullptr)`
- `drawFillCoords(CoordsBuffer& coordsBuffer)`
- `drawTextureCoords(CoordsBuffer& coordsBuffer, const TexturePtr& texture, const std::vector<std::pair<int, Color>>* colors = nullptr)`
- `drawTexturedRect(const Rect& dest, const TexturePtr& texture, const Rect& src)`
- `drawTexturedRect(const Rect& dest, const TexturePtr& texture)`
- `drawColorOnTexturedRect(const Rect& dest, const TexturePtr& texture, const Rect& src)`
- `drawUpsideDownTexturedRect(const Rect& dest, const TexturePtr& texture, const Rect& src)`
- `drawRepeatedTexturedRect(const Rect& dest, const TexturePtr& texture, const Rect& src)`
- `drawFilledRect(const Rect& dest)`
- `setDrawProgram(PainterShaderProgram* drawProgram)`
- `hasShaders()`
- `drawText(const Point& pos, CoordsBuffer& coordsBuffer, const Color& color, const TexturePtr& texture)`
- `drawText(const Point& pos, CoordsBuffer& coordsBuffer, const std::vector<std::pair<int, Color>>& colors, const TexturePtr& texture)`
- `drawLine(const std::vector<float>& vertex, int size, int width = 1)`
- `setSecondTexture(const TexturePtr& texture)`
- `setOffset(const Point& offset)`
- `setAtlasTextures(const TexturePtr& atlas)`
- `drawCache(const std::vector<float>& vertex, const std::vector<float>& texture, const std::vector<float>& color, int size)`
- `setColor(const Color& color)`
- `setShaderProgram(const PainterShaderProgramPtr& shaderProgram)`
- `scale(float factor)`
- `translate(const Point& p)`
- `rotate(const Point& p, float angle)`
- `setDepth(float depth)`
- `getDepth()`
- `getDepthFunc()`
- `resetDepth()`
- `setDepth(0.0f)`
- `resetDepthFunc()`
- `getResolution()`
- `getColor()`
- `getClipRect()`
- `getCompositionMode()`
- `resetClipRect()`
- `resetCompositionMode()`
- `resetColor()`
- `resetShaderProgram()`
- `draws()`
- `calls()`
- `resetDraws()`
- `setDrawColorOnTextureShaderProgram()`
- `setMatrixColor(const Matrix4& mat4)`
- `setDrawOutfitLayersProgram()`
- `updateGlTexture()`
- `updateGlCompositionMode()`
- `updateGlBlendEquation()`
- `updateGlClipRect()`
- `updateGlAlphaWriting()`
- `updateGlViewport()`
- `updateDepthFunc()`
# # framework/graphics/paintershaderprogram.cpp

- `setUniformValue(TRANSFORM_MATRIX_UNIFORM, m_transformMatrix)`
# # framework/graphics/paintershaderprogram.h

class PainterShaderProgram
class Painter
- `setupUniforms()`
- `PainterShaderProgram(const std::string& name)`
- `link()`
- `setTransformMatrix(const Matrix3& transformMatrix)`
- `setProjectionMatrix(const Matrix3& projectionMatrix)`
- `setTextureMatrix(const Matrix3& textureMatrix)`
- `setColor(const Color& color)`
- `setMatrixColor(const Matrix4& colors)`
- `setDepth(float depth)`
- `setResolution(const Size& resolution)`
- `setOffset(const Point& offset)`
- `setCenter(const Point& center)`
- `updateTime()`
- `addMultiTexture(const std::string& file)`
- `bindMultiTextures()`
- `clearMultiTextures()`
- `enableColorMatrix()`
# # framework/graphics/shader.cpp

- `glShaderSource(m_shaderId, 1, &c_source, NULL)`
- `compileSourceCode(sourceCode)`
- `buf(infoLogLength)`
# # framework/graphics/shader.h

class Shader
- `compileSourceCode(const std::string& sourceCode)`
- `compileSourceFile(const std::string& sourceFile)`
- `log()`
- `getShaderId()`
- `getShaderType()`
# # framework/graphics/shadermanager.h

class ShaderManager
- `init()`
- `terminate()`
- `createShader(const std::string& name, std::string vertex, std::string fragment, bool colorMatrix = false)`
- `createOutfitShader(const std::string& name, std::string vertex, std::string fragment)`
- `createShader(name, vertex, fragment, true)`
- `addTexture(const std::string& name, const std::string& file)`
- `getShader(const std::string& name)`
# # framework/graphics/shaderprogram.cpp

- `program(new PainterShaderProgram(name))`
- `shader(new Shader(shaderType))`
- `addShader(shader)`
- `shader(new Shader(shaderType))`
- `addShader(shader)`
- `infoLog(maxLength)`
- `buf(infoLogLength)`
- `glGetAttribLocation(m_programId, name)`
- `glBindAttribLocation(m_programId, location, name)`
# # framework/graphics/shaderprogram.h

class ShaderProgram
- `ShaderProgram(const std::string& name)`
- `create(const std::string& name, const std::string& vertexShader, const std::string& fragmentShader, bool colorMatrix = false)`
- `addShader(const ShaderPtr& shader)`
- `addShaderFromSourceCode(Shader::ShaderType shaderType, const std::string& sourceCode)`
- `addShaderFromSourceFile(Shader::ShaderType shaderType, const std::string& sourceFile)`
- `removeShader(const ShaderPtr& shader)`
- `removeAllShaders()`
- `link()`
- `bind()`
- `release()`
- `log()`
- `disableAttributeArray(int location)`
- `enableAttributeArray(int location)`
- `disableAttributeArray(const char* name)`
- `enableAttributeArray(const char* name)`
- `getAttributeLocation(const char* name)`
- `bindAttributeLocation(int location, const char* name)`
- `bindUniformLocation(int location, const char* name)`
- `setAttributeArray(int location, const float* values, int size, int stride = 0)`
- `setAttributeValue(int location, float value)`
- `setAttributeValue(int location, float x, float y)`
- `setAttributeValue(int location, float x, float y, float z)`
- `setAttributeArray(const char* name, const float* values, int size, int stride = 0)`
- `setAttributeValue(const char* name, float value)`
- `setAttributeValue(const char* name, float x, float y)`
- `setAttributeValue(const char* name, float x, float y, float z)`
- `setUniformValue(int location, const Color& color)`
- `setUniformValue(int location, int value)`
- `setUniformValue(int location, float value)`
- `setUniformValue(int location, float x, float y)`
- `setUniformValue(int location, float x, float y, float z)`
- `setUniformValue(int location, float x, float y, float z, float w)`
- `setUniformValue(int location, const Matrix2& mat)`
- `setUniformValue(int location, const Matrix3& mat)`
- `setUniformValue(int location, const Matrix4& mat)`
- `setUniformValue(int location, int count, const int* value)`
- `setUniformValue(const char* name, const Color& color)`
- `setUniformValue(const char* name, int value)`
- `setUniformValue(const char* name, float value)`
- `setUniformValue(const char* name, float x, float y)`
- `setUniformValue(const char* name, float x, float y, float z)`
- `setUniformValue(const char* name, float x, float y, float z, float w)`
- `setUniformValue(const char* name, const Matrix2& mat)`
- `setUniformValue(const char* name, const Matrix3& mat)`
- `setUniformValue(const char* name, const Matrix4& mat)`
- `isLinked()`
- `getProgramId()`
- `getShaders()`
- `getName()`
# # framework/graphics/textrender.cpp

- `lock(m_mutex[index])`
- `drawText(pos, hash, Color::white)`
# # framework/graphics/textrender.h

class TextRender
- `init()`
- `terminate()`
- `poll()`
- `addText(BitmapFontPtr font, const std::string& text, const Size& size, Fw::AlignmentFlag align = Fw::AlignTopLeft)`
- `drawText(const Rect& rect, const std::string& text, BitmapFontPtr font, const Color& color = Color::white, Fw::AlignmentFlag align = Fw::AlignTopLeft, bool shadow = false)`
- `drawText(const Point& pos, uint64_t hash, const Color& color, bool shadow = false)`
- `drawColoredText(const Point& pos, uint64_t hash, const std::vector<std::pair<int, Color>>& colors, bool shadow = false)`
# # framework/graphics/texture.h

class Texture
- `Texture(const Size& size, bool depthTexture = false, bool smooth = false, bool upsideDown = false)`
- `replace(const ImagePtr& image)`
- `resize(const Size& size)`
- `update()`
- `setUpsideDown(bool upsideDown)`
- `setSmooth(bool smooth)`
- `setRepeat(bool repeat)`
- `buildHardwareMipmaps()`
- `setTime(ticks_t time)`
- `setCanCache(bool canCache)`
- `getId()`
- `getUniqueId()`
- `getTime()`
- `getWidth()`
- `getHeight()`
- `isEmpty()`
- `hasRepeat()`
- `hasMipmaps()`
- `canCache()`
- `isAnimatedTexture()`
- `uploadPixels(const ImagePtr& image, bool buildMipmaps = false, bool compress = false)`
- `setupSize(const Size& size)`
- `setupWrap()`
- `setupFilters()`
- `setupTranformMatrix()`
- `setupPixels(int level, const Size& size, uchar *pixels, int channels = 4, bool compress = false)`
# # framework/graphics/texturemanager.cpp

- `imageSize(apng.width, apng.height)`
- `512x512(they can't be cached)", source, apng.width, apng.height))`
- `Image(imageSize, apng.bpp, frameData)))`
- `AnimatedTexture(imageSize, frames, framesDelay)`
- `Image(imageSize, apng.bpp, apng.pdata))`
- `Texture(image))`
# # framework/graphics/texturemanager.h

class TextureManager
- `init()`
- `terminate()`
- `clearCache()`
- `reload()`
- `preload(const std::string& fileName)`
- `getTexture(const std::string& fileName)`
- `loadTexture(std::stringstream& file, const std::string& source)`
# # framework/graphics/vertexarray.h

class VertexArray
- `VertexArray()`
- `addVertex(float x, float y)`
- `addTriangle(const Point& a, const Point& b, const Point& c)`
- `addRect(const Rect& rect)`
- `addRect(const RectF& rect)`
- `addQuad(const Rect& rect)`
- `addUpsideDownQuad(const Rect& rect)`
- `clear()`
- `vertexCount()`
- `size()`
- `cache()`
- `HardwareBuffer(HardwareBuffer::VertexBuffer)`
- `isCached()`
# # framework/graphics/shaders/shadersources.h

- `calculatePosition()`
- `main()`
- `calculatePosition()`
- `calculatePosition()`
- `vec4((u_ProjectionMatrix * u_TransformMatrix * vec3(a_Vertex.xy, 1.0)).xy, u_Depth / 16384.0, 1.0)`
- `calculatePixel()`
- `calculatePixel()`
- `calculatePixel()`
- `calculatePixel()`
- `vec4(0,0,0,0)`
# # framework/http/http.h

class WebsocketSession
class Http
- `Http() : m_ios(), m_guard(boost::asio::make_work_guard(m_ios))`
- `init()`
- `terminate()`
- `get(const std::string& url, int timeout = 5)`
- `post(const std::string& url, const std::string& data, int timeout = 5, bool isJson = false)`
- `download(const std::string& url, std::string path, int timeout = 5)`
- `ws(const std::string& url, int timeout = 5)`
- `wsSend(int operationId, std::string message)`
- `wsClose(int operationId)`
- `cancel(int id)`
- `clearDownloads()`
- `getFile(std::string path)`
- `setUserAgent(const std::string& userAgent)`
# # framework/http/result.h

class HttpSession
# # framework/http/session.cpp

- `self(shared_from_this())`
- `self(shared_from_this())`
- `onError("resolve error", ec.message())`
- `onError("connection error", ec.message())`
- `ec2(static_cast<int>(::ERR_get_error()), boost::asio::error::get_ssl_category())`
- `onError("HTTPS error", ec2.message())`
- `self(shared_from_this())`
- `onError("HTTPS handshake error", ec.message())`
- `onError("request sending error", ec.message())`
- `onError("canceled")`
- `onError("read header error", ec.message())`
- `onError("canceled", ec.message())`
- `close()`
- `onError("Invalid http status code", std::to_string(msg.result_int()))`
- `on_read(ec, 0)`
- `onError("canceled", ec.message())`
- `onError("read error", ec.message())`
- `close()`
- `m_callback(m_result)`
- `self(shared_from_this())`
- `onError("timeout")`
# # framework/http/session.h

class HttpSession
- `start()`
- `cancel()`
- `on_resolve(const boost::system::error_code& ec, boost::asio::ip::tcp::resolver::iterator iterator)`
- `on_connect(const boost::system::error_code& ec)`
- `on_request_sent(const boost::system::error_code& ec)`
- `on_read_header(const boost::system::error_code & ec, size_t bytes_transferred)`
- `on_read(const boost::system::error_code& ec, size_t bytes_transferred)`
- `close()`
- `onTimeout(const boost::system::error_code& error)`
- `onError(const std::string& error, const std::string& details = "")`
# # framework/http/websocket.cpp

- `self(shared_from_this())`
- `self(shared_from_this())`
- `ec2(static_cast<int>(::ERR_get_error()), boost::asio::error::get_ssl_category())`
- `onError("WSS error", ec2.message())`
- `onError("resolve error", ec.message())`
- `onError("connection error", ec.message())`
- `self(shared_from_this())`
- `onError("WSS handshake error", ec.message())`
- `onError("handshake error", ec.message())`
- `onError("send error", ec.message())`
- `onError("canceled", ec.message())`
- `onError("read error", ec.message())`
- `onError("timeout")`
# # framework/http/websocket.h

class WebsocketSession
- `start()`
- `send(std::string data)`
- `close()`
- `on_resolve(const boost::system::error_code& ec, boost::asio::ip::tcp::resolver::iterator iterator)`
- `on_connect(const boost::system::error_code& ec)`
- `on_handshake(const boost::system::error_code& ec)`
- `on_send(const boost::system::error_code& ec)`
- `on_read(const boost::system::error_code& ec, size_t bytes_transferred)`
- `onTimeout(const boost::system::error_code& error)`
- `onError(const std::string& error, const std::string& details = "")`
# # framework/input/mouse.cpp

- `lock(m_mutex)`
- `lock(m_mutex)`
- `lock(m_mutex)`
# # framework/input/mouse.h

class Mouse
- `init()`
- `terminate()`
- `loadCursors(std::string filename)`
- `addCursor(const std::string& name, const std::string& file, const Point& hotSpot)`
- `pushCursor(const std::string& name)`
- `popCursor(const std::string& name)`
- `isCursorChanged()`
- `isPressed(Fw::MouseButton mouseButton)`
# # framework/luaengine/declarations.h

class LuaInterface
class LuaObject
# # framework/luaengine/lbitlib.cpp

- `lua_pushunsigned(lua_State *L, lua_Unsigned u)`
- `luaL_checkunsigned(lua_State *L, int arg)`
- `andaux(lua_State *L)`
- `trim(r)`
- `b_and(lua_State *L)`
- `b_test(lua_State *L)`
- `b_or(lua_State *L)`
- `b_xor(lua_State *L)`
- `b_not(lua_State *L)`
- `b_shift(lua_State *L, b_uint r, int i)`
- `b_lshift(lua_State *L)`
- `b_shift(L, luaL_checkunsigned(L, 1), luaL_checkint(L, 2))`
- `b_rshift(lua_State *L)`
- `b_shift(L, luaL_checkunsigned(L, 1), -luaL_checkint(L, 2))`
- `b_arshift(lua_State *L)`
- `b_shift(L, r, -i)`
- `b_rot(lua_State *L, int i)`
- `b_lrot(lua_State *L)`
- `b_rot(L, luaL_checkint(L, 2))`
- `b_rrot(lua_State *L)`
- `b_rot(L, -luaL_checkint(L, 2))`
- `fieldargs(lua_State *L, int farg, int *width)`
- `b_extract(lua_State *L)`
- `b_replace(lua_State *L)`
- `luaopen_bit32(lua_State *L)`
# # framework/luaengine/lbitlib.h

- `luaopen_bit32(lua_State *L)`
# # framework/luaengine/luabinder.h

class FC
class FC
- `call(Tuple& tuple, LuaInterface* lua)`
- `call(Tuple& tuple, LuaInterface* lua)`
- `call_fun_and_push_result(const F& f, LuaInterface* lua, const Args&... args)`
- `call_fun_and_push_result(const F& f, LuaInterface* lua, const Args&... args)`
- `call(const Tuple& tuple, const F& f, LuaInterface* lua, const Args&... args)`
- `call(const Tuple& tuple, const F& f, LuaInterface* lua, const Args&... args)`
- `bind_fun_specializer(const F& f)`
- `bind_fun(const std::function<int(LuaInterface*)>& f)`
- `bind_fun(const std::function<Ret(Args...)>& f)`
- `call(const Lambda& f)`
- `bind_fun(const Lambda& f)`
- `bind_fun(Ret (*f)(Args...))`
- `bind_fun(std::function<Ret(Args...)>(f))`
- `LuaException("failed to call a member function because the passed object is nil")`
- `mf(obj.get(), args...)`
- `LuaException("failed to call a member function because the passed object is nil")`
- `mf(instance, args...)`
- `bind_mem_fun(Ret (FC::* f)(Args...))`
- `bind_singleton_mem_fun(Ret (FC::*f)(Args...), C *instance)`
- `bind_mem_fun(int (C::*f)(LuaInterface*))`
- `mf(obj, lua)`
# # framework/luaengine/luaexception.cpp

- `generateLuaErrorMessage(error, traceLevel)`
# # framework/luaengine/luaexception.h

class LuaException
class LuaBadNumberOfArgumentsException
class LuaBadValueCastException
- `LuaException(const std::string& error, int traceLevel = -1)`
- `generateLuaErrorMessage(const std::string& error, int traceLevel)`
- `throw()`
- `LuaException()`
- `LuaBadNumberOfArgumentsException(int expected = -1, int got = -1)`
- `LuaBadValueCastException(const std::string& luaTypeName, const std::string& cppTypeName)`
# # framework/luaengine/luainterface.cpp

class table
class methods
class fieldmethods
class metatable
class ones
class methods
class fieldmethods
- `pushThread()`
- `VALIDATE(stdext::demangle_class<LuaObject>() == "LuaObject")`
- `closeLuaState()`
- `newTable()`
- `newTable()`
- `pushCppFunction(&LuaInterface::luaObjectGetEvent)`
- `pushValue(klass)`
- `pushValue(klass)`
- `pushValue(klass_fieldmethods)`
- `pop(3)`
- `getGlobal("__func")`
- `pushNil()`
- `getGlobal("__exp")`
- `pushNil()`
- `pushNil()`
- `getGlobal("debug")`
- `popString()`
- `pop()`
- `pop()`
- `LuaException(errorMsg)`
- `LuaException("function call didn't return the expected number of results", 0)`
- `pushNil()`
- `LuaException("function call didn't return the expected number of results", 0)`
- `LuaException("attempt to call a non function", 0)`
- `LuaException("attempt to call a non function value", 0)`
- `newTable()`
- `getRef(getGlobalEnvironment())`
- `setField("__index")`
- `setMetatable()`
- `ref()`
- `s(STATS_LUACALLBACK, g_lua.getSource(1))`
- `luaL_openlibs(L)`
- `luaopen_bit32(L)`
- `newTable()`
- `getGlobal("package")`
- `pushCFunction(&LuaInterface::lua_dofile)`
- `pushCFunction(&LuaInterface::lua_dofiles)`
- `pushCFunction(&LuaInterface::lua_loadfile)`
- `pushCFunction(nullptr)`
- `lua_close(L)`
- `LuaException("Compiled lua files are not allowed in free version", 0)`
- `LuaException(popString(), 0)`
- `dumpWriter(lua_State *L, const void* p, size_t sz, void* ud)`
- `lua_pcall(L, numArgs, numRets, errorFuncIndex)`
- `getRef(m_weakTableRef)`
- `pop()`
- `lua_typename(L, type)`
- `lua_next(L, index)`
- `pushNil()`
- `pop()`
- `pushValue()`
- `pop()`
- `insert(-2)`
- `pushNil()`
- `rawSet(index-3)`
- `pushNil()`
- `rawSet(index-2)`
- `lua_newuserdata(L, size)`
- `lua_touserdata(L, lua_upvalueindex(1))`
- `new(newUserdata(sizeof(LuaObjectPtr))) LuaObjectPtr(obj)`
- `LuaCppFunction(func))`
- `newTable()`
- `pushCFunction(&LuaInterface::luaCppFunctionCallback, 1)`
- `lua_isnil(L, index)`
- `lua_isboolean(L, index)`
- `lua_isnumber(L, index)`
- `lua_isstring(L, index)`
- `lua_istable(L, index)`
- `lua_isfunction(L, index)`
- `lua_iscfunction(L, index)`
- `lua_isuserdata(L, index)`
- `lua_tointeger(L, index)`
- `lua_tonumber(L, index)`
- `lua_tostring(L, index)`
- `lua_touserdata(L, index)`
- `lua_gettop(L)`
# # framework/luaengine/luainterface.h

class LuaInterface
class C
class B
class C
class C
class C
class C
class C
class C
class C
class FC
class C
class FC
class C
class FC
class C
class FC
class C
class FC
class C
class FC
class C
class FC
class C
class FC
class T
class T
class C
class C
class C
class C
class FC
class C
class FC
class C
class FC
class C
class FC
class C
class FC
class C
class FC
class C
class FC
class C
class FC
class T
- `int(*LuaCFunction) (lua_State *L)`
- `LuaInterface()`
- `init()`
- `terminate()`
- `registerFunctions()`
- `registerSingletonClass(const std::string& className)`
- `registerClass(const std::string& className, const std::string& baseClass = "LuaObject")`
- `registerClass()`
- `registerClassStaticFunction(const std::string& functionName, const LuaCppFunction& function)`
- `registerClassMemberFunction(const std::string& functionName, const LuaCppFunction& function)`
- `bindSingletonFunction(const std::string& functionName, F C::*function, C *instance)`
- `bindSingletonFunction(const std::string& className, const std::string& functionName, F C::* function, C* instance)`
- `bindSingletonFunction(const std::string& className, const std::string& functionName, const F& function)`
- `bindClassStaticFunction(const std::string& functionName, const F& function)`
- `bindClassStaticFunction(const std::string& className, const std::string& functionName, const F& function)`
- `bindClassMemberFunction(const std::string& functionName, F FC::*function)`
- `bindClassMemberFunction(const std::string& className, const std::string& functionName, F FC::*function)`
- `bindClassMemberField(const std::string& fieldName, F1 FC::*getFunction, F2 FC::*setFunction)`
- `bindClassMemberField(const std::string& className, const std::string& fieldName, F1 FC::*getFunction, F2 FC::*setFunction)`
- `bindClassMemberGetField(const std::string& fieldName, F FC::*getFunction)`
- `bindClassMemberGetField(const std::string& className, const std::string& fieldName, F FC::*getFunction)`
- `bindClassMemberSetField(const std::string& fieldName, F FC::*setFunction)`
- `bindClassMemberSetField(const std::string& className, const std::string& fieldName, F FC::*setFunction)`
- `bindGlobalFunction(const std::string& functionName, const F& function)`
- `luaObjectGetEvent(LuaInterface* lua)`
- `luaObjectSetEvent(LuaInterface* lua)`
- `luaObjectEqualEvent(LuaInterface* lua)`
- `luaObjectCollectEvent(LuaInterface* lua)`
- `safeRunScript(const std::string& fileName)`
- `runScript(const std::string& fileName)`
- `runBuffer(const std::string& buffer, const std::string& source)`
- `loadScript(const std::string& fileName)`
- `loadFunction(const std::string& buffer, const std::string& source = "lua function buffer")`
- `evaluateExpression(const std::string& expression, const std::string& source = "lua expression")`
- `traceback(const std::string& errorMessage = "", int level = 0)`
- `throwError(const std::string& message)`
- `getCurrentSourcePath(int level = 0)`
- `getCurrentFunction(int level = 0)`
- `safeCall(int numArgs = 0, int numRets = -1, const std::shared_ptr<std::string>& error = nullptr)`
- `signalCall(int numArgs = 0, int numRets = -1)`
- `newSandboxEnv()`
- `luaCallGlobalField(const std::string& global, const std::string& field, const T&... args)`
- `callGlobalField(const std::string& global, const std::string& field, const T&... args)`
- `isInCppCallback()`
- `luaScriptLoader(lua_State* L)`
- `lua_dofile(lua_State* L)`
- `lua_dofiles(lua_State* L)`
- `lua_loadfile(lua_State* L)`
- `luaErrorHandler(lua_State* L)`
- `luaCppFunctionCallback(lua_State* L)`
- `luaCollectCppFunction(lua_State* L)`
- `createLuaState()`
- `closeLuaState()`
- `collectGarbage()`
- `loadBuffer(const std::string& buffer, const std::string& source)`
- `generateByteCode(const std::string & buffer, std::string source)`
- `pcall(int numArgs = 0, int numRets = 0, int errorFuncIndex = 0)`
- `call(int numArgs = 0, int numRets = 0)`
- `error()`
- `ref()`
- `weakRef()`
- `unref(int ref)`
- `useValue()`
- `functionSourcePath()`
- `functionSource()`
- `insert(int index)`
- `remove(int index)`
- `next(int index = -2)`
- `checkStack()`
- `getStackFunction(int level = 0)`
- `getRef(int ref)`
- `getWeakRef(int weakRef)`
- `getGlobalEnvironment()`
- `setGlobalEnvironment(int env)`
- `resetGlobalEnvironment()`
- `setMetatable(int index = -2)`
- `getMetatable(int index = -1)`
- `getField(const char* key, int index = -1)`
- `getField(const std::string& key, int index = -1)`
- `getField(key.c_str(), index)`
- `setField(const char* key, int index = -2)`
- `setField(const std::string& key, int index = -2)`
- `setField(key.c_str(), index)`
- `getTable(int index = -2)`
- `setTable(int index = -3)`
- `clearTable(int index = -1)`
- `getEnv(int index = -1)`
- `setEnv(int index = -2)`
- `getGlobal(const std::string& key)`
- `getGlobalField(const std::string& globalKey, const std::string& fieldKey)`
- `setGlobal(const std::string& key)`
- `rawGet(int index = -1)`
- `rawGeti(int n, int index = -1)`
- `rawSet(int index = -3)`
- `rawSeti(int n, int index = -2)`
- `newTable()`
- `createTable(int narr, int nrec)`
- `pop(int n = 1)`
- `popInteger()`
- `popNumber()`
- `popBoolean()`
- `popString()`
- `popObject()`
- `pushNil()`
- `pushInteger(long v)`
- `pushNumber(double v)`
- `pushBoolean(bool v)`
- `pushCString(const char* v)`
- `pushString(const std::string& v)`
- `pushLightUserdata(void* p)`
- `pushThread()`
- `pushValue(int index = -1)`
- `pushObject(const LuaObjectPtr& obj)`
- `pushCFunction(LuaCFunction func, int n = 0)`
- `pushCppFunction(const LuaCppFunction& func)`
- `isNil(int index = -1)`
- `isBoolean(int index = -1)`
- `isNumber(int index = -1)`
- `isString(int index = -1)`
- `isTable(int index = -1)`
- `isFunction(int index = -1)`
- `isCFunction(int index = -1)`
- `isLuaFunction(int index = -1)`
- `isUserdata(int index = -1)`
- `toBoolean(int index = -1)`
- `toInteger(int index = -1)`
- `toNumber(int index = -1)`
- `toString(int index = -1)`
- `toObject(int index = -1)`
- `getTop()`
- `stackSize()`
- `getTop()`
- `clearStack()`
- `hasIndex(int index)`
- `getSource(int level = 2)`
- `loadFiles(std::string directory, bool recursive = false, std::string contains = "")`
- `polymorphicPush(const T& v, const Args&... args)`
- `polymorphicPush()`
- `LuaBadValueCastException(typeName(index), stdext::demangle_type<T>())`
- `s(STATS_LUA, std::string(global) + ":" + field)`
# # framework/luaengine/luaobject.cpp

- `ref_count()`
# # framework/luaengine/luaobject.h

class LuaObject
class name
- `LuaObject()`
- `connectLuaField(const std::string& field, const std::function<T>& f, bool pushFront = false)`
- `luaCallLuaField(const std::string& field, const T&... args)`
- `callLuaField(const std::string& field, const T&... args)`
- `hasLuaField(const std::string& field)`
- `setLuaField(const std::string& key, const T& value)`
- `releaseLuaFieldsTable()`
- `luaSetField(const std::string& key)`
- `luaGetField(const std::string& key)`
- `luaGetMetatable()`
- `luaGetFieldsTable()`
- `getUseCount()`
- `getClassName()`
- `asLuaObject()`
- `connect(const LuaObjectPtr& obj, const std::string& field, const std::function<F>& f, bool pushFront = false)`
- `connect(const LuaObjectPtr& obj, const std::string& field, const Lambda& f, bool pushFront = false)`
- `connect(const LuaObjectPtr& obj, const std::string& field, const std::function<F>& f, bool pushFront)`
- `call(const LuaObjectPtr& obj, const std::string& field, const Lambda& f, bool pushFront)`
- `connect(const LuaObjectPtr& obj, const std::string& field, const Lambda& f, bool pushFront)`
- `s(STATS_LUA, getClassName() + ":" + field)`
- `s(STATS_LUA, field)`
# # framework/luaengine/luavaluecasts.cpp

- `push_luavalue(bool b)`
- `luavalue_cast(int index, bool& b)`
- `push_luavalue(int i)`
- `luavalue_cast(int index, int& i)`
- `push_luavalue(double d)`
- `luavalue_cast(int index, double& d)`
- `push_luavalue(const char* cstr)`
- `push_luavalue(const std::string& str)`
- `luavalue_cast(int index, std::string& str)`
- `push_luavalue(const LuaCppFunction& func)`
- `push_luavalue(const Color& color)`
- `luavalue_cast(int index, Color& color)`
- `push_luavalue(const Rect& rect)`
- `luavalue_cast(int index, Rect& rect)`
- `push_luavalue(const Point& point)`
- `luavalue_cast(int index, Point& point)`
- `push_luavalue(const Size& size)`
- `luavalue_cast(int index, Size& size)`
- `push_otml_subnode_luavalue(const OTMLNodePtr& node)`
- `push_luavalue(const OTMLNodePtr& node)`
- `luavalue_cast(int index, OTMLNodePtr& node)`
- `VALIDATE(g_lua.isNumber())`
- `luavalue_cast(int index, LuaObjectPtr& obj)`
# # framework/luaengine/luavaluecasts.h

class T
class T
class T
class T
class T
class K
class V
class K
class V
class K
class V
class T
class T
class T
class K
class V
class K
class V
class K
class V
- `push_internal_luavalue(T v)`
- `push_luavalue(bool b)`
- `luavalue_cast(int index, bool& b)`
- `push_luavalue(int i)`
- `luavalue_cast(int index, int& i)`
- `push_luavalue(double d)`
- `luavalue_cast(int index, double& d)`
- `push_luavalue(float f)`
- `luavalue_cast(int index, float& f)`
- `push_luavalue(int8 v)`
- `luavalue_cast(int index, int8& v)`
- `push_luavalue(uint8 v)`
- `luavalue_cast(int index, uint8& v)`
- `push_luavalue(int16 v)`
- `luavalue_cast(int index, int16& v)`
- `push_luavalue(uint16 v)`
- `luavalue_cast(int index, uint16& v)`
- `push_luavalue(uint32 v)`
- `luavalue_cast(int index, uint32& v)`
- `push_luavalue(int64 v)`
- `luavalue_cast(int index, int64& v)`
- `push_luavalue(uint64 v)`
- `luavalue_cast(int index, uint64& v)`
- `push_luavalue(const char* cstr)`
- `push_luavalue(const std::string& str)`
- `luavalue_cast(int index, std::string& str)`
- `push_luavalue(const LuaCppFunction& func)`
- `push_luavalue(const Color& color)`
- `luavalue_cast(int index, Color& color)`
- `push_luavalue(const Rect& rect)`
- `luavalue_cast(int index, Rect& rect)`
- `push_luavalue(const Point& point)`
- `luavalue_cast(int index, Point& point)`
- `push_luavalue(const Size& size)`
- `luavalue_cast(int index, Size& size)`
- `push_luavalue(const OTMLNodePtr& node)`
- `luavalue_cast(int index, OTMLNodePtr& node)`
- `push_luavalue(T e)`
- `push_luavalue((int)e)`
- `luavalue_cast(int index, T& myenum)`
- `push_luavalue(const T& obj)`
- `luavalue_cast(int index, LuaObjectPtr& obj)`
- `luavalue_cast(int index, stdext::shared_object_ptr<T>& ptr)`
- `push_luavalue(const std::function<Ret(Args...)>& func)`
- `luavalue_cast(int index, std::function<void(Args...)>& func)`
- `luavalue_cast(int index, std::function<Ret(Args...)>& func)`
- `push_luavalue(const std::list<T>& list)`
- `luavalue_cast(int index, std::list<T>& list)`
- `push_luavalue(const std::vector<T>& vec)`
- `luavalue_cast(int index, std::vector<T>& vec)`
- `push_luavalue(const std::set<T>& vec)`
- `luavalue_cast(int index, std::set<T>& vec)`
- `push_luavalue(const std::deque<T>& vec)`
- `luavalue_cast(int index, std::deque<T>& vec)`
- `push_luavalue(const std::map<K, V>& map)`
- `luavalue_cast(int index, std::map<K, V>& map)`
- `luavalue_cast(int index, std::pair<K, V>& pair)`
- `push_luavalue(const std::tuple<Args...>& tuple)`
- `push_internal_luavalue(const std::tuple<Args...>& tuple)`
- `push_internal_luavalue(T v)`
- `push_luavalue(v)`
- `luavalue_cast(int index, T& myenum)`
- `push_luavalue(const T& obj)`
- `luavalue_cast(int index, stdext::shared_object_ptr<T>& ptr)`
- `push_luavalue(const std::function<Ret(Args...)>& func)`
- `luavalue_cast(int index, std::function<void(Args...)>& func)`
- `luavalue_cast(int index, std::function<Ret(Args...)>& func)`
- `LuaException("a function from lua didn't retrieve the expected number of results", 0)`
- `Ret()`
- `push_luavalue(const std::list<T>& list)`
- `luavalue_cast(int index, std::list<T>& list)`
- `push_luavalue(const std::vector<T>& vec)`
- `luavalue_cast(int index, std::vector<T>& vec)`
- `push_luavalue(const std::set<T>& set)`
- `luavalue_cast(int index, std::set<T>& set)`
- `push_luavalue(const std::deque<T>& vec)`
- `luavalue_cast(int index, std::deque<T>& vec)`
- `push_luavalue(const std::map<K, V>& map)`
- `luavalue_cast(int index, std::map<K, V>& map)`
- `luavalue_cast(int index, std::pair<K, V>& pair)`
- `call(const Tuple& tuple)`
- `call(const Tuple& tuple)`
- `push_internal_luavalue(const std::tuple<Args...>& tuple)`
- `call(const Tuple& tuple)`
- `call(const Tuple& tuple)`
- `push_luavalue(const std::tuple<Args...>& tuple)`
# # framework/net/connection.cpp

- `s(STATS_MAIN, "PollConnection")`
- `query(host, stdext::unsafe_cast<std::string>(port))`
- `os(m_outputStream.get())`
- `handleError(error)`
- `option(true)`
- `handleError(error)`
- `handleError(error)`
# # framework/net/connection.h

class Connection
class Server
- `Connection()`
- `poll()`
- `terminate()`
- `connect(const std::string& host, uint16 port, const std::function<void()>& connectCallback)`
- `close()`
- `write(uint8* buffer, size_t size)`
- `read(uint32 bytes, const RecvCallback& callback)`
- `read_until(const std::string& what, const RecvCallback& callback)`
- `read_some(const RecvCallback& callback)`
- `setErrorCallback(const ErrorCallback& errorCallback)`
- `getIp()`
- `getError()`
- `isConnecting()`
- `isConnected()`
- `getElapsedTicksSinceLastRead()`
- `asConnection()`
- `internal_connect(asio::ip::basic_resolver<asio::ip::tcp>::iterator endpointIterator)`
- `internal_write()`
- `onResolve(const boost::system::error_code& error, asio::ip::tcp::resolver::iterator endpointIterator)`
- `onConnect(const boost::system::error_code& error)`
- `onCanWrite(const boost::system::error_code& error)`
- `onWrite(const boost::system::error_code& error, size_t writeSize, std::shared_ptr<asio::streambuf> outputStream)`
- `onRecv(const boost::system::error_code& error, size_t recvSize)`
- `onTimeout(const boost::system::error_code& error)`
- `handleError(const boost::system::error_code& error)`
# # framework/net/declarations.h

class InputMessage
class OutputMessage
class Connection
class Protocol
class Server
class PacketPlayer
class PacketRecorder
# # framework/net/inputmessage.h

class InputMessage
class Protocol
- `setBuffer(const std::string& buffer)`
- `getBuffer()`
- `getBodyBuffer()`
- `skipBytes(uint32 bytes)`
- `setReadPos(uint32 readPos)`
- `getU8()`
- `getU16()`
- `getU32()`
- `getU64()`
- `getString()`
- `getDouble()`
- `peekU8()`
- `peekU16()`
- `peekU32()`
- `peekU64()`
- `decryptRsa(int size)`
- `getHeaderPos()`
- `getHeaderSize()`
- `getReadSize()`
- `getReadPos()`
- `getUnreadSize()`
- `getMessageSize()`
- `eof()`
- `reset()`
- `fillBuffer(uint8 *buffer, uint32 size)`
- `setHeaderSize(uint32 size)`
- `setMessageSize(uint32 size)`
- `readSize(bool bigSize)`
- `readChecksum()`
- `addZlibFooter()`
- `canRead(int bytes)`
- `checkRead(int bytes)`
- `checkWrite(int bytes)`
# # framework/net/outputmessage.h

class OutputMessage
class Protocol
class PacketPlayer
- `reset()`
- `setBuffer(const std::string& buffer)`
- `getBuffer()`
- `addU8(uint8 value)`
- `addU16(uint16 value)`
- `addU32(uint32 value)`
- `addU64(uint64 value)`
- `addString(const std::string& buffer)`
- `addRawString(const std::string& buffer)`
- `addPaddingBytes(int bytes, uint8 byte = 0)`
- `encryptRsa()`
- `getWritePos()`
- `getMessageSize()`
- `setWritePos(uint32 writePos)`
- `setMessageSize(uint32 messageSize)`
- `writeChecksum()`
- `writeSequence(uint32_t sequence)`
- `writeMessageSize(bool bigSize)`
- `canWrite(int bytes)`
- `checkWrite(int bytes)`
# # framework/net/packet_player.cpp

- `f(std::string("records/") + file)`
- `f(std::filesystem::path("records") / file)`
- `m_disconnectCallback(boost::asio::error::eof)`
# # framework/net/packet_player.h

class PacketPlayer
- `PacketPlayer(const std::string& file)`
- `start(std::function<void(std::shared_ptr<std::vector<uint8_t>>)> recvCallback, std::function<void(boost::system::error_code)> disconnectCallback)`
- `stop()`
- `onOutputPacket(const OutputMessagePtr& packet)`
- `process()`
# # framework/net/packet_recorder.h

class PacketRecorder
- `PacketRecorder(const std::string& file)`
- `addInputPacket(const InputMessagePtr& packet)`
- `addOutputPacket(const OutputMessagePtr& packet)`
# # framework/net/protocol.cpp

- `onConnect()`
- `onConnect()`
- `eng(std::time(NULL))`
- `unif(0, 0xFFFFFFFF)`
- `self(asProtocol())`
- `self(asProtocol())`
- `self(asProtocol())`
# # framework/net/protocol.h

class Protocol
- `Protocol()`
- `connect(const std::string& host, uint16 port)`
- `disconnect()`
- `setRecorder(PacketRecorderPtr recorder)`
- `playRecord(PacketPlayerPtr player)`
- `isConnected()`
- `isConnecting()`
- `getElapsedTicksSinceLastRead()`
- `getConnection()`
- `setConnection(const ConnectionPtr& connection)`
- `generateXteaKey()`
- `setXteaKey(uint32 a, uint32 b, uint32 c, uint32 d)`
- `getXteaKey()`
- `enableXteaEncryption()`
- `enableChecksum()`
- `enabledSequencedPackets()`
- `enableBigPackets()`
- `enableCompression()`
- `send(const OutputMessagePtr& outputMessage, bool rawPacket = false)`
- `recv()`
- `asProtocol()`
- `onConnect()`
- `onRecv(const InputMessagePtr& inputMessage)`
- `onError(const boost::system::error_code& err)`
- `onProxyPacket(const std::shared_ptr<std::vector<uint8_t>>& packet)`
- `onPlayerPacket(const std::shared_ptr<std::vector<uint8_t>>& packet)`
- `onLocalDisconnected(boost::system::error_code ec)`
- `internalRecvHeader(uint8* buffer, uint32 size)`
- `internalRecvData(uint8* buffer, uint32 size)`
- `xteaDecrypt(const InputMessagePtr& inputMessage)`
- `xteaEncrypt(const OutputMessagePtr& outputMessage)`
# # framework/net/server.cpp

- `Server(port)`
- `ServerPtr(server)`
- `ServerPtr()`
# # framework/net/server.h

class Server
- `Server(int port)`
- `create(int port)`
- `isOpen()`
- `close()`
- `acceptNext()`
# # framework/otml/declarations.h

class OTMLNode
class OTMLDocument
class OTMLParser
class OTMLEmitter
# # framework/otml/otmldocument.cpp

- `doc(new OTMLDocument)`
- `parse(fin, source)`
- `is(data)`
- `parse(is, source)`
- `doc(new OTMLDocument)`
- `parser(doc, in)`
# # framework/otml/otmldocument.h

class OTMLDocument
- `create()`
- `parse(const std::string& fileName)`
- `parseString(const std::string& data, const std::string& source)`
- `parse(std::istream& in, const std::string& source)`
- `emit()`
- `save(const std::string& fileName)`
- `OTMLDocument()`
# # framework/otml/otmlemitter.h

class OTMLEmitter
- `emitNode(const OTMLNodePtr& node, int currentDepth = -1)`
# # framework/otml/otmlexception.h

class OTMLException
- `OTMLException(const OTMLNodePtr& node, const std::string& error)`
- `throw()`
# # framework/otml/otmlnode.cpp

- `node(new OTMLNode)`
- `node(new OTMLNode)`
- `OTMLException(asOTMLNode(), stdext::format("child node with tag '%s' not found", childTag))`
- `myClone(new OTMLNode)`
# # framework/otml/otmlnode.h

class OTMLNode
- `create(std::string tag = "", bool unique = false)`
- `create(std::string tag, std::string value)`
- `tag()`
- `size()`
- `source()`
- `rawValue()`
- `isUnique()`
- `isNull()`
- `hasTag()`
- `hasValue()`
- `hasChildren()`
- `hasChildAt(const std::string& childTag)`
- `getIndex()`
- `setTag(const std::string& tag)`
- `setValue(const std::string& value)`
- `setNull(bool null)`
- `setUnique(bool unique)`
- `setSource(const std::string& source)`
- `setIndex(size_t index)`
- `lockTag()`
- `get(const std::string& childTag)`
- `getIndex(int childIndex)`
- `at(const std::string& childTag)`
- `addChild(const OTMLNodePtr& newChild)`
- `removeChild(const OTMLNodePtr& oldChild)`
- `copy(const OTMLNodePtr& node)`
- `merge(const OTMLNodePtr& node)`
- `clear()`
- `children()`
- `clone()`
- `write(const T& v)`
- `writeAt(const std::string& childTag, const T& v)`
- `writeIn(const T& v)`
- `emit()`
- `asOTMLNode()`
- `OTMLNode() : m_unique(false), m_null(false)`
- `OTMLException(asOTMLNode(), stdext::format("failed to cast node value '%s' to type '%s'", m_value, stdext::demangle_type<T>()))`
# # framework/otml/otmlparser.cpp

- `OTMLException(doc, "cannot read from input stream")`
- `OTMLException(doc, "indentation with tabs are not allowed", currentLine)`
- `OTMLException(doc, "must indent every 2 spaces", currentLine)`
- `OTMLException(doc, "invalid indentation depth, are you indenting correctly?", currentLine)`
- `parseNode(line)`
- `tokens(tmp)`
# # framework/otml/otmlparser.h

class OTMLParser
- `OTMLParser(OTMLDocumentPtr doc, std::istream& in)`
- `parse()`
- `getNextLine()`
- `getLineDepth(const std::string& line, bool multilining = false)`
- `parseLine(std::string line)`
- `parseNode(const std::string& data)`
# # framework/platform/androidplatform.cpp

- `getpid()`
# # framework/platform/androidwindow.cpp

- `touchStartPos(0, 0)`
- `new_size(w, h)`
# # framework/platform/androidwindow.h

class AndroidWindow
- `internalInitGL()`
- `internalDestroyGL()`
- `internalCheckGL()`
- `internalChooseGL()`
- `internalCreateGLContext()`
- `internalDestroyGLContext()`
- `internalConnectGLContext()`
- `AndroidWindow()`
- `init()`
- `init(struct android_app* app)`
- `terminate()`
- `move(const Point& pos)`
- `resize(const Size& size)`
- `show()`
- `hide()`
- `minimize()`
- `maximize()`
- `poll()`
- `swapBuffers()`
- `showMouse()`
- `hideMouse()`
- `setMouseCursor(int cursorId)`
- `restoreMouseCursor()`
- `setTitle(const std::string& title)`
- `setMinimumSize(const Size& minimumSize)`
- `setFullscreen(bool fullscreen)`
- `setVerticalSync(bool enable)`
- `setIcon(const std::string& iconFile)`
- `setClipboardText(const std::string& text)`
- `getDisplaySize()`
- `getClipboardText()`
- `getPlatformType()`
- `displayFatalError(const std::string& message)`
- `showTextEditor(const std::string& title, const std::string& description, const std::string& text, int flags)`
- `handleCmd(int32_t cmd)`
- `handleInput(AInputEvent* event)`
- `updateSize()`
- `handleTextInput(std::string text)`
- `openUrl(std::string url)`
- `internalLoadMouseCursor(const ImagePtr& image, const Point& hotSpot)`
- `getClazz()`
# # framework/platform/crashhandler.h

- `installCrashHandler()`
- `uninstallCrashHandler()`
# # framework/platform/platform.h

class Platform
- `processArgs(std::vector<std::string>& args)`
- `spawnProcess(std::string process, const std::vector<std::string>& args)`
- `getProcessId()`
- `isProcessRunning(const std::string& name)`
- `killProcess(const std::string& name)`
- `getTempPath()`
- `getCurrentDir()`
- `copyFile(std::string from, std::string to)`
- `fileExists(std::string file)`
- `removeFile(std::string file)`
- `getFileModificationTime(std::string file)`
- `openUrl(std::string url, bool now = false)`
- `openDir(std::string path, bool now = false)`
- `getCPUName()`
- `getTotalSystemMemory()`
- `getMemoryUsage()`
- `getOSName()`
- `traceback(const std::string& where, int level = 1, int maxDepth = 32)`
- `getMacAddresses()`
- `getUserName()`
- `getDlls()`
- `getProcesses()`
- `getWindows()`
# # framework/platform/platformwindow.cpp

- `internalLoadMouseCursor(image, hotSpot)`
# # framework/platform/platformwindow.h

class PlatformWindow
- `displayFatalError(const std::string& message)`
- `loadMouseCursor(const std::string& file, const Point& hotSpot)`
- `hasVerticalSync()`
- `getDisplayWidth()`
- `getDisplaySize().width()`
- `getDisplayHeight()`
- `getDisplaySize().height()`
- `getUnmaximizedSize()`
- `getSize()`
- `getMinimumSize()`
- `getWidth()`
- `getHeight()`
- `getUnmaximizedPos()`
- `getPosition()`
- `getX()`
- `getY()`
- `getMousePosition()`
- `getKeyboardModifiers()`
- `isKeyPressed(Fw::Key keyCode)`
- `isMouseButtonPressed(Fw::MouseButton mouseButton)`
- `isVisible()`
- `isMaximized()`
- `isFullscreen()`
- `hasFocus()`
- `setOnClose(const std::function<void()>& onClose)`
- `setOnResize(const OnResizeCallback& onResize)`
- `setOnInputEvent(const OnInputEventCallback& onInputEvent)`
- `showTextEditor(const std::string& title, const std::string& description, const std::string& text, int flags)`
- `handleTextInput(std::string text)`
- `setScaling(float scaling)`
- `flash()`
- `updateUnmaximizedCoords()`
- `processKeyDown(Fw::Key keyCode)`
- `processKeyUp(Fw::Key keyCode)`
- `releaseAllKeys()`
- `fireKeysPress()`
# # framework/platform/sdlwindow.h

class SDLWindow
- `internalInitGL()`
- `internalDestroyGL()`
- `internalCheckGL()`
- `internalChooseGL()`
- `internalCreateGLContext()`
- `internalDestroyGLContext()`
- `internalConnectGLContext()`
- `SDLWindow()`
- `init()`
- `terminate()`
- `move(const Point& pos)`
- `resize(const Size& size)`
- `show()`
- `hide()`
- `minimize()`
- `maximize()`
- `poll()`
- `swapBuffers()`
- `showMouse()`
- `hideMouse()`
- `setMouseCursor(int cursorId)`
- `restoreMouseCursor()`
- `setTitle(const std::string& title)`
- `setMinimumSize(const Size& minimumSize)`
- `setFullscreen(bool fullscreen)`
- `setVerticalSync(bool enable)`
- `setIcon(const std::string& iconFile)`
- `setClipboardText(const std::string& text)`
- `getDisplaySize()`
- `getClipboardText()`
- `getPlatformType()`
- `displayFatalError(const std::string& message)`
- `showTextEditor(const std::string& title, const std::string& description, const std::string& text, int flags)`
- `updateSize()`
- `handleTextInput(std::string text)`
- `openUrl(std::string url)`
- `internalLoadMouseCursor(const ImagePtr& image, const Point& hotSpot)`
# # framework/platform/unixcrashhandler.cpp

- `crashHandler(int signum, siginfo_t* info, void* secret)`
- `fout(fileName.c_str(), std::ios::out | std::ios::app)`
- `installCrashHandler()`
- `sigaction(SIGSEGV, &sa, NULL)`
- `sigaction(SIGFPE, &sa, NULL)`
- `sigaction(SIGABRT, &sa, NULL)`
- `uninstallCrashHandler()`
# # framework/platform/unixplatform.cpp

- `getpid()`
- `in("/proc/cpuinfo")`
- `in("/proc/meminfo")`
- `in("/etc/issue")`
# # framework/platform/win32crashhandler.cpp

- `Stacktrace(LPEXCEPTION_POINTERS e, std::stringstream& ss)`
- `strcpy(modname, "Unknown")`
- `ExceptionHandler(PEXCEPTION_POINTERS e)`
- `SymInitialize(GetCurrentProcess(), 0, TRUE)`
- `fout(dumpFilePath, std::ios::out | std::ios::app)`
- `UnhandledExceptionFilter2(PEXCEPTION_POINTERS exception)`
- `quick_exit(0)`
- `exit(0)`
- `installCrashHandler()`
- `uninstallCrashHandler()`
# # framework/platform/win32platform.cpp

- `GetCurrentProcessId()`
- `void(WINAPI* PGNSI)(LPSYSTEM_INFO)`
- `BOOL(WINAPI* PGPI)(DWORD, DWORD, DWORD, DWORD, PDWORD)`
- `GetSystemInfo(&si)`
- `EnumWindowsProc(HWND hwnd, LPARAM lParam)`
- `window_title(title)`
# # framework/platform/win32window.cpp

- `call(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam)`
- `args(GetCommandLineA())`
- `context(error: %i, report it)", (int)eglGetError()))`
- `context(error: %i, report it)", GetLastError()))`
- `return(void*)wglGetProcAddress(ext)`
- `clientRect(pos, getClientRect().size())`
- `clientRect(getClientRect().topLeft(), size)`
- `ShowWindow(m_window, SW_SHOW)`
- `s(STATS_RENDER, "PollWindow")`
- `DefWindowProc(hWnd, uMsg, wParam, lParam)`
- `DefWindowProc(hWnd, uMsg, wParam, lParam)`
- `DefWindowProc(hWnd, uMsg, wParam, lParam)`
- `newMousePos(LOWORD(lParam), HIWORD(lParam))`
- `eglSwapBuffers(m_eglDisplay, m_eglSurface)`
- `SwapBuffers(m_deviceContext)`
- `andMask(numbytes, 0)`
- `xorMask(numbytes, 0)`
- `HSB_BIT_SET(xorMask, i)`
- `HSB_BIT_SET(andMask, i)`
- `BOOL(WINAPI* wglSwapIntervalProc)(int)`
- `iconData(n)`
- `Size(GetSystemMetrics(SM_CXSCREEN), GetSystemMetrics(SM_CYSCREEN))`
- `Rect(Point(clientRect.left, clientRect.top), Point(clientRect.right, clientRect.bottom))`
- `Rect(m_position, m_size)`
- `Rect(Point(windowRect.left, windowRect.top), Point(windowRect.right, windowRect.bottom))`
- `adjustWindowRect(getClientRect())`
# # framework/platform/win32window.h

class WIN32Window
- `internalSetupTimerAccuracy()`
- `internalCreateWindow()`
- `internalCreateGLContext()`
- `internalDestroyGLContext()`
- `internalRestoreGLContext()`
- `isExtensionSupported(const char *ext)`
- `windowProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam)`
- `dispatcherWindowProc(HWND hWnd, UINT uMsg, WPARAM wParam, LPARAM lParam)`
- `retranslateVirtualKey(WPARAM wParam, LPARAM lParam)`
- `WIN32Window()`
- `init()`
- `terminate()`
- `move(const Point& pos)`
- `resize(const Size& size)`
- `show()`
- `hide()`
- `minimize()`
- `maximize()`
- `poll()`
- `swapBuffers()`
- `showMouse()`
- `hideMouse()`
- `displayFatalError(const std::string& message)`
- `setMouseCursor(int cursorId)`
- `restoreMouseCursor()`
- `setTitle(const std::string& title)`
- `setMinimumSize(const Size& minimumSize)`
- `setFullscreen(bool fullscreen)`
- `setVerticalSync(bool enable)`
- `setIcon(const std::string& file)`
- `setClipboardText(const std::string& text)`
- `getDisplaySize()`
- `getClipboardText()`
- `getPlatformType()`
- `flash()`
- `internalLoadMouseCursor(const ImagePtr& image, const Point& hotSpot)`
- `getClientRect()`
- `getWindowRect()`
- `adjustWindowRect(const Rect& rect)`
# # framework/platform/x11window.cpp

- `updateUnmaximizedCoords()`
- `XMoveWindow(m_display, m_window, m_position.x, m_position.y)`
- `return(void *)glXGetProcAddressARB((const GLubyte*)ext)`
- `s(STATS_RENDER, "PollWindow")`
- `newSize(event.xconfigure.width, event.xconfigure.height)`
- `newPos(event.xconfigure.x, event.xconfigure.y)`
- `newMousePos(event.xbutton.x, event.xbutton.y)`
- `eglSwapBuffers(m_eglDisplay, m_eglSurface)`
- `glXSwapBuffers(m_display, m_window)`
- `mapBits(numbytes, 0)`
- `maskBits(numbytes, 0)`
- `LSB_BIT_SET(maskBits, i)`
- `LSB_BIT_SET(mapBits, i)`
- `GLint(*glSwapIntervalProc)(GLint)`
- `iconData(n + 2)`
- `Size(XDisplayWidth(m_display, m_screen), XDisplayHeight(m_display, m_screen))`
# # framework/platform/x11window.h

class X11Window
- `internalOpenDisplay()`
- `internalCreateWindow()`
- `internalSetupWindowInput()`
- `internalCheckGL()`
- `internalChooseGLVisual()`
- `internalCreateGLContext()`
- `internalDestroyGLContext()`
- `internalConnectGLContext()`
- `isExtensionSupported(const char *ext)`
- `X11Window()`
- `init()`
- `terminate()`
- `move(const Point& pos)`
- `resize(const Size& size)`
- `show()`
- `hide()`
- `minimize()`
- `maximize()`
- `poll()`
- `swapBuffers()`
- `showMouse()`
- `hideMouse()`
- `setMouseCursor(int cursorId)`
- `restoreMouseCursor()`
- `setTitle(const std::string& title)`
- `setMinimumSize(const Size& minimumSize)`
- `setFullscreen(bool fullscreen)`
- `setVerticalSync(bool enable)`
- `setIcon(const std::string& file)`
- `setClipboardText(const std::string& text)`
- `getDisplaySize()`
- `getClipboardText()`
- `getPlatformType()`
- `displayFatalError(const std::string& message)`
- `internalLoadMouseCursor(const ImagePtr& image, const Point& hotSpot)`
# # framework/proxy/proxy.h

class ProxyManager
- `ProxyManager() : m_io(), m_guard(boost::asio::make_work_guard(m_io))`
- `init()`
- `terminate()`
- `clear()`
- `setMaxActiveProxies(int value)`
- `isActive()`
- `addProxy(const std::string& host, uint16_t port, int priority)`
- `removeProxy(const std::string& host, uint16_t port)`
- `addSession(uint16_t port, std::function<void(ProxyPacketPtr)> recvCallback, std::function<void(boost::system::error_code)> disconnectCallback)`
- `removeSession(uint32_t sessionId)`
- `send(uint32_t sessionId, ProxyPacketPtr packet)`
- `getProxies()`
- `getProxiesDebugInfo()`
- `getPing()`
# # framework/proxy/proxy_client.cpp

- `self(shared_from_this())`
- `self(shared_from_this())`
- `disconnect()`
- `self(shared_from_this())`
- `disconnect()`
- `disconnect()`
- `disconnect()`
- `onPing(packetId)`
- `disconnect()`
- `self(shared_from_this())`
- `self(shared_from_this())`
- `terminate(boost::asio::error::timed_out)`
- `self(shared_from_this())`
- `terminate()`
- `readTibia12Header()`
- `terminate()`
- `terminate()`
- `terminate()`
- `self(shared_from_this())`
- `terminate()`
# # framework/proxy/proxy_client.h

class Session
class Proxy
class Session
- `start()`
- `terminate()`
- `getPing()`
- `getRealPing()`
- `getPriority()`
- `isConnected()`
- `getHost()`
- `getPort()`
- `getDebugInfo()`
- `isActive()`
- `addSession(uint32_t id, int m_port)`
- `removeSession(uint32_t id)`
- `send(const ProxyPacketPtr& packet)`
- `check(const boost::system::error_code& ec = boost::system::error_code())`
- `connect()`
- `disconnect()`
- `ping()`
- `onPing(uint32_t packetId)`
- `readHeader()`
- `onHeader(const boost::system::error_code& ec, std::size_t bytes_transferred)`
- `onPacket(const boost::system::error_code& ec, std::size_t bytes_transferred)`
- `onSent(const boost::system::error_code& ec, std::size_t bytes_transferred)`
- `getId()`
- `start(int maxConnections = 3)`
- `terminate(boost::system::error_code ec = boost::asio::error::eof)`
- `onPacket(const ProxyPacketPtr& packet)`
- `onProxyPacket(uint32_t packetId, uint32_t lastRecivedPacketId, const ProxyPacketPtr& packet)`
- `check(const boost::system::error_code& ec)`
- `selectProxies()`
- `readTibia12Header()`
- `readHeader()`
- `onHeader(const boost::system::error_code& ec, std::size_t bytes_transferred)`
- `onBody(const boost::system::error_code& ec, std::size_t bytes_transferred)`
- `onSent(const boost::system::error_code& ec, std::size_t bytes_transferred)`
# # framework/sound/combinedsoundsource.h

class CombinedSoundSource
- `CombinedSoundSource()`
- `addSource(const SoundSourcePtr& source)`
- `getSources()`
- `play()`
- `stop()`
- `isBuffering()`
- `isPlaying()`
- `setLooping(bool looping)`
- `setRelative(bool relative)`
- `setReferenceDistance(float distance)`
- `setGain(float gain)`
- `setPitch(float pitch)`
- `setPosition(const Point& pos)`
- `setVelocity(const Point& velocity)`
- `setFading(FadeState state, float fadetime)`
- `update()`
# # framework/sound/declarations.h

class SoundManager
class SoundSource
class SoundBuffer
class SoundFile
class SoundChannel
class StreamSoundSource
class CombinedSoundSource
class OggSoundFile
# # framework/sound/oggsoundfile.h

class OggSoundFile
- `OggSoundFile(const FileStreamPtr& fileStream)`
- `prepareOgg()`
- `read(void *buffer, int bufferSize)`
- `reset()`
- `cb_read(void* ptr, size_t size, size_t nmemb, void* source)`
- `cb_seek(void* source, ogg_int64_t offset, int whence)`
- `cb_close(void* source)`
- `cb_tell(void* source)`
# # framework/sound/soundbuffer.cpp

- `samples(soundFile->getSize())`
- `fillBuffer(format, samples, samples.size(), soundFile->getRate())`
# # framework/sound/soundbuffer.h

class SoundBuffer
- `SoundBuffer()`
- `fillBuffer(const SoundFilePtr& soundFile)`
- `fillBuffer(ALenum sampleFormat, const DataBuffer<char>& data, int size, int rate)`
- `getBufferId()`
# # framework/sound/soundchannel.cpp

- `g(rd())`
# # framework/sound/soundchannel.h

class SoundChannel
class SoundManager
- `SoundChannel(int id) : m_id(id), m_gain(1)`
- `play(const std::string& filename, float fadetime = 0, float gain = 1.0f)`
- `stop(float fadetime = 0)`
- `enqueue(const std::string& filename, float fadetime = 0, float gain = 1.0f)`
- `enable()`
- `disable()`
- `setGain(float gain)`
- `getGain()`
- `setEnabled(bool enable)`
- `isEnabled()`
- `getId()`
- `update()`
# # framework/sound/soundfile.cpp

- `OggSoundFile(file))`
# # framework/sound/soundfile.h

class SoundFile
- `SoundFile(const FileStreamPtr& fileStream)`
- `loadSoundFile(const std::string& filename)`
- `read(void *buffer, int bufferSize)`
- `reset()`
- `eof()`
- `getSampleFormat()`
- `getChannels()`
- `getRate()`
- `getBps()`
- `getSize()`
- `getName()`
# # framework/sound/soundmanager.cpp

- `s(STATS_MAIN, "PollSounds")`
- `SoundChannel(channel))`
- `combinedSource(new CombinedSoundSource)`
- `streamSource(new StreamSoundSource)`
# # framework/sound/soundmanager.h

class SoundManager
- `init()`
- `terminate()`
- `poll()`
- `setAudioEnabled(bool enable)`
- `isAudioEnabled()`
- `enableAudio()`
- `disableAudio()`
- `stopAll()`
- `preload(std::string filename)`
- `play(std::string filename, float fadetime = 0, float gain = 0)`
- `getChannel(int channel)`
- `resolveSoundFile(std::string file)`
- `ensureContext()`
- `createSoundSource(const std::string& filename)`
# # framework/sound/soundsource.h

class SoundSource
class SoundManager
class CombinedSoundSource
- `SoundSource(uint sourceId) : m_sourceId(sourceId)`
- `play()`
- `stop()`
- `isBuffering()`
- `isPlaying()`
- `isBuffering()`
- `setName(const std::string& name)`
- `setLooping(bool looping)`
- `setRelative(bool relative)`
- `setReferenceDistance(float distance)`
- `setGain(float gain)`
- `setPitch(float pitch)`
- `setPosition(const Point& pos)`
- `setVelocity(const Point& velocity)`
- `setFading(FadeState state, float fadetime)`
- `getName()`
- `getChannel()`
- `getGain()`
- `setBuffer(const SoundBufferPtr& buffer)`
- `setChannel(uchar channel)`
- `update()`
# # framework/sound/streamsoundsource.cpp

- `bufferData(2*STREAM_FRAGMENT_SIZE)`
- `return(bytesRead >= STREAM_FRAGMENT_SIZE && !m_eof)`
# # framework/sound/streamsoundsource.h

class StreamSoundSource
- `play()`
- `stop()`
- `isPlaying()`
- `setSoundFile(const SoundFilePtr& soundFile)`
- `downMix(DownMix downMix)`
- `update()`
- `queueBuffers()`
- `unqueueBuffers()`
- `fillBufferAndQueue(uint buffer)`
# # framework/stdext/any.h

class any
- `typeid(T)`
- `holder(held)`
- `any(const T& value) : content(new holder<T>(value))`
- `empty()`
# # framework/stdext/cast.h

class cast_exception
class T
class R
- `cast(const T& in, R& out)`
- `cast(const T& in, std::string& out)`
- `cast(const std::string& in, std::string& out)`
- `cast(const std::string& in, bool& b)`
- `cast(const std::string& in, char& c)`
- `cast(const std::string& in, long& l)`
- `cast(const std::string& in, int& i)`
- `cast(const std::string& in, double& d)`
- `cast(const std::string& in, float& f)`
- `cast(const bool& in, std::string& out)`
- `update_what()`
- `throw()`
# # framework/stdext/demangle.h

class template
- `demangle_class()`
- `demangle_name(typeid(T).name())`
- `demangle_type()`
- `demangle_name(typeid(T).name())`
# # framework/stdext/dumper.h

class T
class T
# # framework/stdext/dynamic_storage.h

class dynamic_storage
- `set(const Key& k, const T& value)`
- `remove(const Key& k)`
- `has(k) ? any_cast<T>(m_data[k]) : T()`
- `has(const Key& k)`
- `size()`
- `clear()`
# # framework/stdext/exception.h

class exception
- `exception()`
- `throw()`
- `throw_exception(const std::string& what)`
- `exception(what)`
# # framework/stdext/fastrand.h

- `fastrand()`
# # framework/stdext/format.h

class T
class T
- `print_ostream(std::ostringstream& stream, const T& last)`
- `print_ostream(std::ostringstream& stream, const T& first, const Args&... rest)`
- `print(const T&... args)`
- `sprintf_cast(const T& t)`
- `call(char *s, size_t maxlen, const char *format, const Tuple& tuple, const Args&... args)`
- `call(char *s, size_t maxlen, const char *format, const Tuple& tuple, const Args&... args)`
- `_snprintf(s, maxlen, format, args...)`
- `snprintf(s, maxlen, format, args...)`
- `snprintf(char *s, size_t maxlen, const char *format, const Args&... args)`
- `snprintf(char *s, size_t maxlen, const char *format)`
- `strlen(s)`
- `format()`
- `format(const std::string& format)`
- `format(const std::string& format, const Args&... args)`
- `buffer(n + 1, '\0')`
# # framework/stdext/math.cpp

- `adler32(const uint8_t *buffer, size_t size)`
- `random_range(long min, long max)`
- `gen(rd())`
- `dis(0, 2147483647)`
- `random_range(float min, float max)`
- `gen(rd())`
- `dis(0.0, 1.0)`
- `round(double r)`
# # framework/stdext/math.h

- `is_power_of_two(size_t v)`
- `to_power_of_two(size_t v)`
- `readULE16(const uchar *addr)`
- `readULE32(const uchar *addr)`
- `readULE64(const uchar *addr)`
- `writeULE16(uchar *addr, uint16_t value)`
- `writeULE32(uchar *addr, uint32_t value)`
- `writeULE64(uchar *addr, uint64_t value)`
- `readSLE16(const uchar *addr)`
- `readSLE32(const uchar *addr)`
- `readSLE64(const uchar *addr)`
- `writeSLE16(uchar *addr, int16_t value)`
- `writeSLE32(uchar *addr, int32_t value)`
- `writeSLE64(uchar *addr, int64_t value)`
- `adler32(const uint8_t *buffer, size_t size)`
- `random_range(long min, long max)`
- `random_range(float min, float max)`
- `round(double r)`
# # framework/stdext/net.cpp

- `ip_to_string(uint32 ip)`
- `string_to_ip(const std::string& string)`
- `listSubnetAddresses(uint32 address, uint8 mask)`
# # framework/stdext/net.h

- `ip_to_string(uint32 ip)`
- `string_to_ip(const std::string& string)`
- `listSubnetAddresses(uint32 address, uint8 mask)`
# # framework/stdext/packed_any.h

class packed_any
- `typeid(T)`
- `holder(held)`
- `empty()`
- `typeid(std::size_t)`
- `packed_any_cast(const packed_any& operand)`
- `packed_any_cast(const packed_any& operand)`
# # framework/stdext/packed_storage.h

class was
class packed_storage
- `packed_storage() : m_values(nullptr), m_size(0)`
- `set(Key id, const T& value)`
- `remove(Key id)`
- `T()`
- `has(Key id)`
- `clear()`
- `size()`
# # framework/stdext/shared_object.h

class T
class shared_object_ptr
class shared_object
class T
class shared_object_ptr
class U
class U
class T
class U
class T
class U
class T
class U
class T
class U
class T
class U
class T
class U
class T
class T
class T
class U
class T
class U
class T
class U
class T
class E
class T
class Y
class T
- `shared_object() : refs(0)`
- `add_ref()`
- `dec_ref()`
- `ref_count()`
- `static_self_cast()`
- `dynamic_self_cast()`
- `const_self_cast()`
- `shared_object_ptr(shared_object_ptr<U> const& rhs, typename std::enable_if<std::is_convertible<U*,T*>::value, U*>::type = nullptr) : px(rhs.get())`
- `reset()`
- `reset(T* rhs)`
- `swap(shared_object_ptr& rhs)`
- `use_count()`
- `is_unique()`
- `unspecified_bool_type()`
- `shared_object_ptr(shared_object_ptr&& rhs): px(rhs.px)`
- `add_ref()`
- `dec_ref()`
- `static_pointer_cast(shared_object_ptr<U> const& p)`
- `const_pointer_cast(shared_object_ptr<U> const& p)`
- `dynamic_pointer_cast(shared_object_ptr<U> const& p)`
- `make_shared_object(Args... args)`
- `T(args...))`
- `operator()(const stdext::shared_object_ptr<T>& p)`
- `swap(stdext::shared_object_ptr<T>& lhs, stdext::shared_object_ptr<T>& rhs)`
# # framework/stdext/string.cpp

- `resolve_path(const std::string& filePath, std::string sourcePath)`
- `date_time_string()`
- `timestamp_to_date(time_t tnow)`
- `dec_to_hex(uint32_t num)`
- `dec_to_hex(uint64_t num)`
- `hex_to_dec(const std::string& str)`
- `i(str)`
- `is_valid_utf8(const std::string& src)`
- `utf8_to_latin1(const std::string& src)`
- `latin1_to_utf8(const std::string& src)`
- `utf8_to_utf16(const std::string& src)`
- `utf16_to_utf8(const std::wstring& src)`
- `latin1_to_utf16(const std::string& src)`
- `utf8_to_utf16(latin1_to_utf8(src))`
- `utf16_to_latin1(const std::wstring& src)`
- `utf8_to_latin1(utf16_to_utf8(src))`
- `tolower(std::string& str)`
- `toupper(std::string& str)`
- `trim(std::string& str)`
- `upchar(char c)`
- `lochar(char c)`
- `ucwords(std::string& str)`
- `ends_with(const std::string& str, const std::string& test)`
- `starts_with(const std::string& str, const std::string& test)`
- `replace_all(std::string& str, const std::string& search, const std::string& replacement)`
- `split(const std::string& str, const std::string& separators)`
# # framework/stdext/string.h

- `to_string(const T& t)`
- `resolve_path(const std::string& filePath, std::string sourcePath)`
- `date_time_string()`
- `timestamp_to_date(time_t tnow)`
- `dec_to_hex(uint32_t num)`
- `dec_to_hex(uint64_t num)`
- `hex_to_dec(const std::string& str)`
- `tolower(std::string& str)`
- `toupper(std::string& str)`
- `trim(std::string& str)`
- `ucwords(std::string& str)`
- `upchar(char c)`
- `lochar(char c)`
- `ends_with(const std::string& str, const std::string& test)`
- `starts_with(const std::string& str, const std::string& test)`
- `replace_all(std::string& str, const std::string& search, const std::string& replacement)`
- `is_valid_utf8(const std::string& src)`
- `utf8_to_latin1(const std::string& src)`
- `latin1_to_utf8(const std::string& src)`
- `utf8_to_utf16(const std::string& src)`
- `utf16_to_utf8(const std::wstring& src)`
- `utf16_to_latin1(const std::wstring& src)`
- `latin1_to_utf16(const std::string& src)`
- `split(const std::string& str, const std::string& separators = " ")`
- `split(const std::string& str, const std::string& separators = " ")`
- `results(splitted.size())`
# # framework/stdext/time.cpp

- `time()`
- `millis()`
- `micros()`
- `millisleep(size_t ms)`
- `microsleep(size_t us)`
# # framework/stdext/time.h

- `time()`
- `millis()`
- `micros()`
- `millisleep(size_t ms)`
- `microsleep(size_t us)`
- `timer()`
- `elapsed_seconds()`
- `elapsed_millis()`
- `elapsed_micros()`
- `restart(int shift = 0)`
# # framework/stdext/traits.h

class T
class T
class T
# # framework/stdext/uri.cpp

- `parseURI(const std::string& url)`
# # framework/stdext/uri.h

- `parseURI(const std::string& url)`
# # framework/ui/declarations.h

class UIManager
class UIWidget
class UITextEdit
class UILayout
class UIBoxLayout
class UIHorizontalLayout
class UIVerticalLayout
class UIGridLayout
class UIAnchor
class UIAnchorGroup
class UIAnchorLayout
# # framework/ui/uianchorlayout.cpp

- `VALIDATE(false)`
- `anchor(new UIAnchor(anchoredEdge, hookedWidgetId, hookedEdge))`
- `update()`
# # framework/ui/uianchorlayout.h

class UIAnchor
class UIAnchorGroup
class UIAnchorLayout
- `getAnchoredEdge()`
- `getHookedEdge()`
- `getHookedWidget(const UIWidgetPtr& widget, const UIWidgetPtr& parentWidget)`
- `getHookedPoint(const UIWidgetPtr& hookedWidget, const UIWidgetPtr& parentWidget)`
- `UIAnchorGroup() : m_updated(true)`
- `addAnchor(const UIAnchorPtr& anchor)`
- `isUpdated()`
- `setUpdated(bool updated)`
- `UIAnchorLayout(UIWidgetPtr parentWidget) : UILayout(parentWidget)`
- `removeAnchors(const UIWidgetPtr& anchoredWidget)`
- `hasAnchors(const UIWidgetPtr& anchoredWidget)`
- `centerIn(const UIWidgetPtr& anchoredWidget, const std::string& hookedWidgetId)`
- `fill(const UIWidgetPtr& anchoredWidget, const std::string& hookedWidgetId)`
- `addWidget(const UIWidgetPtr& widget)`
- `removeWidget(const UIWidgetPtr& widget)`
- `isUIAnchorLayout()`
- `internalUpdate()`
- `updateWidget(const UIWidgetPtr& widget, const UIAnchorGroupPtr& anchorGroup, UIWidgetPtr first = nullptr)`
# # framework/ui/uiboxlayout.h

class UIBoxLayout
- `UIBoxLayout(UIWidgetPtr parentWidget)`
- `applyStyle(const OTMLNodePtr& styleNode)`
- `addWidget(const UIWidgetPtr& widget)`
- `removeWidget(const UIWidgetPtr& widget)`
- `setSpacing(int spacing)`
- `setFitChildren(bool fitParent)`
- `isUIBoxLayout()`
# # framework/ui/uigridlayout.h

class UIGridLayout
- `UIGridLayout(UIWidgetPtr parentWidget)`
- `applyStyle(const OTMLNodePtr& styleNode)`
- `removeWidget(const UIWidgetPtr& widget)`
- `addWidget(const UIWidgetPtr& widget)`
- `setCellSize(const Size& size)`
- `setCellWidth(int width)`
- `setCellHeight(int height)`
- `setCellSpacing(int spacing)`
- `setNumColumns(int columns)`
- `setNumLines(int lines)`
- `setAutoSpacing(bool enable)`
- `setFitChildren(bool enable)`
- `setFlow(bool enable)`
- `getCellSize()`
- `getCellSpacing()`
- `getNumColumns()`
- `getNumLines()`
- `isUIGridLayout()`
- `internalUpdate()`
# # framework/ui/uihorizontallayout.h

class UIHorizontalLayout
- `UIHorizontalLayout(UIWidgetPtr parentWidget) : UIBoxLayout(parentWidget)`
- `applyStyle(const OTMLNodePtr& styleNode)`
- `setAlignRight(bool aliginRight)`
- `isUIHorizontalLayout()`
- `internalUpdate()`
# # framework/ui/uilayout.h

class UILayout
- `UILayout(UIWidgetPtr parentWidget) : m_parentWidget(parentWidget)`
- `update()`
- `updateLater()`
- `applyStyle(const OTMLNodePtr& styleNode)`
- `addWidget(const UIWidgetPtr& widget)`
- `removeWidget(const UIWidgetPtr& widget)`
- `disableUpdates()`
- `enableUpdates()`
- `setParent(UIWidgetPtr parentWidget)`
- `getParentWidget()`
- `isUpdateDisabled()`
- `isUpdating()`
- `isUIAnchorLayout()`
- `isUIBoxLayout()`
- `isUIHorizontalLayout()`
- `isUIVerticalLayout()`
- `isUIGridLayout()`
- `internalUpdate()`
# # framework/ui/uimanager.cpp

- `updateHoveredWidget(true)`
- `s(STATS_MAIN, "UIManager::onWidgetDestroy", stdext::format("%s (%s)", widget->getId(), widget->getParent() ? widget->getParent()->getId() : ""))`
- `backupList(std::move(m_destroyedWidgets))`
- `OTMLException(styleNode, "not a valid style declaration")`
- `createWidgetFromOTML(node, parent)`
# # framework/ui/uimanager.h

class UIManager
class UIWidget
- `init()`
- `terminate()`
- `render(Fw::DrawPane drawPane)`
- `resize(const Size& size)`
- `inputEvent(const InputEvent& event)`
- `updatePressedWidget(const Fw::MouseButton button, const UIWidgetPtr& newPressedWidget, const Point& clickedPos = Point(), bool fireClicks = true)`
- `updateDraggingWidget(const UIWidgetPtr& draggingWidget, const Point& clickedPos = Point())`
- `updateHoveredWidget(bool now = false)`
- `clearStyles()`
- `importStyle(std::string file)`
- `importStyleFromString(std::string data)`
- `importStyleFromOTML(const OTMLNodePtr& styleNode)`
- `getStyle(const std::string& styleName)`
- `getStyleClass(const std::string& styleName)`
- `loadUIFromString(const std::string& data, const UIWidgetPtr& parent)`
- `loadUI(std::string file, const UIWidgetPtr& parent)`
- `displayUI(const std::string& file)`
- `loadUI(file, m_rootWidget)`
- `createWidget(const std::string& styleName, const UIWidgetPtr& parent)`
- `createWidgetFromOTML(const OTMLNodePtr& widgetNode, const UIWidgetPtr& parent)`
- `setMouseReceiver(const UIWidgetPtr& widget)`
- `setKeyboardReceiver(const UIWidgetPtr& widget)`
- `setDebugBoxesDrawing(bool enabled)`
- `resetMouseReceiver()`
- `resetKeyboardReceiver()`
- `getMouseReceiver()`
- `getKeyboardReceiver()`
- `getDraggingWidget()`
- `getHoveredWidget()`
- `getPressedWidget()`
- `getRootWidget()`
- `isMouseGrabbed()`
- `isKeyboardGrabbed()`
- `isDrawingDebugBoxes()`
- `onWidgetAppear(const UIWidgetPtr& widget)`
- `onWidgetDisappear(const UIWidgetPtr& widget)`
- `onWidgetDestroy(const UIWidgetPtr& widget)`
# # framework/ui/uitextedit.cpp

- `recacheGlyphs()`
- `virtualRect(m_textVirtualOffset, m_rect.size() - Size(m_padding.left+m_padding.right, 0))`
- `glyphRect(glyphsPositions[pos], glyphsSize[glyph])`
- `virtualRect(m_textVirtualOffset, m_rect.size() - Size(2*m_padding.left+m_padding.right, 0) )`
- `glyphRect(glyphsPositions[pos], glyphsSize[glyph])`
- `glyphScreenCoords(glyphsPositions[i], glyphsSize[glyph])`
- `removeCharacter(right)`
- `blinkCursor()`
- `clearSelection()`
- `clearSelection()`
- `moveCursorHorizontally(true)`
- `moveCursorHorizontally(false)`
- `setText(keyText)`
- `appendText(keyText)`
# # framework/ui/uitextedit.h

class UITextEdit
- `UITextEdit()`
- `drawSelf(Fw::DrawPane drawPane)`
- `update(bool focusCursor = false)`
- `setCursorPos(int pos)`
- `setSelection(int start, int end)`
- `setCursorVisible(bool enable)`
- `setTextHidden(bool hidden)`
- `setValidCharacters(const std::string validCharacters)`
- `setShiftNavigation(bool enable)`
- `setMultiline(bool enable)`
- `setMaxLength(uint maxLength)`
- `setTextVirtualOffset(const Point& offset)`
- `setEditable(bool editable)`
- `setSelectable(bool selectable)`
- `setSelectionColor(const Color& color)`
- `setSelectionBackgroundColor(const Color& color)`
- `setAutoScroll(bool autoScroll)`
- `setAutoSubmit(bool autoSubmit)`
- `setPlaceholder(std::string placeholder)`
- `setPlaceholderColor(const Color& color)`
- `setPlaceholderAlign(Fw::AlignmentFlag align)`
- `setPlaceholderFont(const std::string& fontName)`
- `moveCursorHorizontally(bool right)`
- `moveCursorVertically(bool up)`
- `appendText(std::string text)`
- `appendCharacter(char c)`
- `removeCharacter(bool right)`
- `blinkCursor()`
- `del(bool right = false)`
- `paste(const std::string& text)`
- `copy()`
- `cut()`
- `selectAll()`
- `clearSelection()`
- `wrapText()`
- `getDisplayedText()`
- `getSelection()`
- `getTextPos(Point pos)`
- `getCursorPos()`
- `getTextVirtualOffset()`
- `getTextVirtualSize()`
- `getTextTotalSize()`
- `getMaxLength()`
- `getSelectionStart()`
- `getSelectionEnd()`
- `getSelectionColor()`
- `getSelectionBackgroundColor()`
- `hasSelection()`
- `isCursorVisible()`
- `isTextHidden()`
- `isShiftNavigation()`
- `isMultiline()`
- `isEditable()`
- `isSelectable()`
- `isAutoScrolling()`
- `updateText()`
- `onStyleApply(const std::string& styleName, const OTMLNodePtr& styleNode)`
- `onGeometryChange(const Rect& oldRect, const Rect& newRect)`
- `onFocusChange(bool focused, Fw::FocusReason reason)`
- `onKeyText(const std::string& keyText)`
- `onKeyPress(uchar keyCode, int keyboardModifiers, int autoRepeatTicks)`
- `onMousePress(const Point& mousePos, Fw::MouseButton button)`
- `onMouseRelease(const Point& mousePos, Fw::MouseButton button)`
- `onMouseMove(const Point& mousePos, const Point& mouseMoved)`
- `onDoubleClick(const Point& mousePos)`
- `onTextAreaUpdate(const Point& vitualOffset, const Size& virtualSize, const Size& totalSize)`
- `disableUpdates()`
- `enableUpdates()`
- `recacheGlyphs()`
# # framework/ui/uitranslator.h

- `translateAlignment(std::string aligment)`
- `translateAnchorEdge(std::string anchorEdge)`
- `translateState(std::string state)`
- `translateAutoFocusPolicy(std::string policy)`
# # framework/ui/uiverticallayout.h

class UIVerticalLayout
- `UIVerticalLayout(UIWidgetPtr parentWidget) : UIBoxLayout(parentWidget)`
- `applyStyle(const OTMLNodePtr& styleNode)`
- `setAlignBottom(bool aliginBottom)`
- `isAlignBottom()`
- `isUIVerticalLayout()`
- `internalUpdate()`
# # framework/ui/uiwidget.cpp

- `UIAnchorLayout(static_self_cast<UIWidget>()))`
- `UIAnchorLayout(static_self_cast<UIWidget>()))`
- `VALIDATE(child->getParent() == static_self_cast<UIWidget>())`
- `rotatedChildren(m_children)`
- `rotatedChildren(m_children)`
- `updateLayout()`
- `size(%s) for %s", stdext::to_string(rect), m_id))`
- `updateLayout()`
- `updateParentLayout()`
- `applyStyle(newStateStyle)`
- `onKeyText(keyText)`
- `onKeyDown(keyCode, keyboardModifiers)`
- `onKeyPress(keyCode, keyboardModifiers, autoRepeatTicks)`
- `onKeyUp(keyCode, keyboardModifiers)`
# # framework/ui/uiwidget.h

class UIWidget
class UIManager
class UILayout
- `set(T value)`
- `UIWidget()`
- `draw(const Rect& visibleRect, Fw::DrawPane drawPane)`
- `drawSelf(Fw::DrawPane drawPane)`
- `drawChildren(const Rect& visibleRect, Fw::DrawPane drawPane)`
- `addChild(const UIWidgetPtr& child)`
- `onChildIdChange(const UIWidgetPtr& child)`
- `insertChild(int index, const UIWidgetPtr& child)`
- `removeChild(UIWidgetPtr child)`
- `focusChild(const UIWidgetPtr& child, Fw::FocusReason reason)`
- `focusNextChild(Fw::FocusReason reason, bool rotate = false)`
- `focusPreviousChild(Fw::FocusReason reason, bool rotate = false)`
- `lowerChild(UIWidgetPtr child)`
- `raiseChild(UIWidgetPtr child)`
- `moveChildToIndex(const UIWidgetPtr& child, int index)`
- `reorderChildren(const std::vector<UIWidgetPtr>& childrens)`
- `lockChild(const UIWidgetPtr& child)`
- `unlockChild(const UIWidgetPtr& child)`
- `mergeStyle(const OTMLNodePtr& styleNode)`
- `applyStyle(const OTMLNodePtr& styleNode)`
- `addAnchor(Fw::AnchorEdge anchoredEdge, const std::string& hookedWidgetId, Fw::AnchorEdge hookedEdge)`
- `removeAnchor(Fw::AnchorEdge anchoredEdge)`
- `fill(const std::string& hookedWidgetId)`
- `centerIn(const std::string& hookedWidgetId)`
- `breakAnchors()`
- `updateParentLayout()`
- `updateLayout()`
- `lock()`
- `unlock()`
- `focus()`
- `recursiveFocus(Fw::FocusReason reason)`
- `lower()`
- `raise()`
- `grabMouse()`
- `ungrabMouse()`
- `grabKeyboard()`
- `ungrabKeyboard()`
- `bindRectToParent()`
- `destroy()`
- `destroyChildren()`
- `setId(const std::string& id)`
- `setParent(const UIWidgetPtr& parent)`
- `setLayout(const UILayoutPtr& layout)`
- `setRect(const Rect& rect)`
- `setStyle(const std::string& styleName)`
- `setStyleFromNode(const OTMLNodePtr& styleNode)`
- `setEnabled(bool enabled)`
- `setVisible(bool visible)`
- `setAutoDraw(bool value)`
- `setOn(bool on)`
- `setChecked(bool checked)`
- `setFocusable(bool focusable)`
- `setPhantom(bool phantom)`
- `setDraggable(bool draggable)`
- `setFixedSize(bool fixed)`
- `setClipping(bool clipping)`
- `setLastFocusReason(Fw::FocusReason reason)`
- `setAutoFocusPolicy(Fw::AutoFocusPolicy policy)`
- `setAutoRepeatDelay(int delay)`
- `setVirtualOffset(const Point& offset)`
- `isAnchored()`
- `isChildLocked(const UIWidgetPtr& child)`
- `hasChild(const UIWidgetPtr& child)`
- `getChildIndex(const UIWidgetPtr& child)`
- `getPaddingRect()`
- `getMarginRect()`
- `getChildrenRect()`
- `getAnchoredLayout()`
- `getRootParent()`
- `getChildAfter(const UIWidgetPtr& relativeChild)`
- `getChildBefore(const UIWidgetPtr& relativeChild)`
- `getChildById(const std::string& childId)`
- `getChildByPos(const Point& childPos)`
- `getChildByIndex(int index)`
- `recursiveGetChildById(const std::string& id)`
- `recursiveGetChildByPos(const Point& childPos, bool wantsPhantom)`
- `recursiveGetChildren()`
- `recursiveGetChildrenByPos(const Point& childPos)`
- `recursiveGetChildrenByMarginPos(const Point& childPos)`
- `backwardsGetWidgetById(const std::string& id)`
- `setState(Fw::WidgetState state, bool on)`
- `hasState(Fw::WidgetState state)`
- `internalDestroy()`
- `updateState(Fw::WidgetState state)`
- `updateStates()`
- `updateChildrenIndexStates()`
- `updateStyle()`
- `onStyleApply(const std::string& styleName, const OTMLNodePtr& styleNode)`
- `onGeometryChange(const Rect& oldRect, const Rect& newRect)`
- `onLayoutUpdate()`
- `onFocusChange(bool focused, Fw::FocusReason reason)`
- `onChildFocusChange(const UIWidgetPtr& focusedChild, const UIWidgetPtr& unfocusedChild, Fw::FocusReason reason)`
- `onHoverChange(bool hovered)`
- `onVisibilityChange(bool visible)`
- `onDragEnter(const Point& mousePos)`
- `onDragLeave(UIWidgetPtr droppedWidget, const Point& mousePos)`
- `onDragMove(const Point& mousePos, const Point& mouseMoved)`
- `onDrop(UIWidgetPtr draggedWidget, const Point& mousePos)`
- `onKeyText(const std::string& keyText)`
- `onKeyDown(uchar keyCode, int keyboardModifiers)`
- `onKeyPress(uchar keyCode, int keyboardModifiers, int autoRepeatTicks)`
- `onKeyUp(uchar keyCode, int keyboardModifiers)`
- `onMousePress(const Point& mousePos, Fw::MouseButton button)`
- `onMouseRelease(const Point& mousePos, Fw::MouseButton button)`
- `onMouseMove(const Point& mousePos, const Point& mouseMoved)`
- `onMouseWheel(const Point& mousePos, Fw::MouseWheelDirection direction)`
- `onClick(const Point& mousePos)`
- `onDoubleClick(const Point& mousePos)`
- `propagateOnKeyText(const std::string& keyText)`
- `propagateOnKeyDown(uchar keyCode, int keyboardModifiers)`
- `propagateOnKeyPress(uchar keyCode, int keyboardModifiers, int autoRepeatTicks)`
- `propagateOnKeyUp(uchar keyCode, int keyboardModifiers)`
- `propagateOnMouseEvent(const Point& mousePos, UIWidgetList& widgetList)`
- `propagateOnMouseMove(const Point& mousePos, const Point& mouseMoved, UIWidgetList& widgetList)`
- `resize(int width, int height)`
- `move(int x, int y)`
- `rotate(float degrees)`
- `hide()`
- `show()`
- `disable()`
- `enable()`
- `isActive()`
- `hasState(Fw::ActiveState)`
- `isEnabled()`
- `isDisabled()`
- `hasState(Fw::DisabledState)`
- `isFocused()`
- `hasState(Fw::FocusState)`
- `isHovered()`
- `hasState(Fw::HoverState)`
- `isPressed()`
- `hasState(Fw::PressedState)`
- `isFirst()`
- `hasState(Fw::FirstState)`
- `isMiddle()`
- `hasState(Fw::MiddleState)`
- `isLast()`
- `hasState(Fw::LastState)`
- `isAlternate()`
- `hasState(Fw::AlternateState)`
- `isChecked()`
- `hasState(Fw::CheckedState)`
- `isOn()`
- `hasState(Fw::OnState)`
- `isDragging()`
- `hasState(Fw::DraggingState)`
- `isVisible()`
- `isHidden()`
- `hasState(Fw::HiddenState)`
- `isExplicitlyEnabled()`
- `isExplicitlyVisible()`
- `isAutoDraw()`
- `isFocusable()`
- `isPhantom()`
- `isDraggable()`
- `isFixedSize()`
- `isClipping()`
- `isDestroyed()`
- `hasChildren()`
- `containsMarginPoint(const Point& point)`
- `getMarginRect().contains(point)`
- `containsPaddingPoint(const Point& point)`
- `getPaddingRect().contains(point)`
- `containsPoint(const Point& point)`
- `getId()`
- `getSource()`
- `getParent()`
- `getParentId()`
- `getFocusedChild()`
- `getChildren()`
- `getFirstChild()`
- `getChildByIndex(1)`
- `getLastChild()`
- `getChildByIndex(-1)`
- `getLayout()`
- `getStyle()`
- `getChildCount()`
- `getLastFocusReason()`
- `getAutoFocusPolicy()`
- `getAutoRepeatDelay()`
- `getVirtualOffset()`
- `getStyleName()`
- `getLastClickPosition()`
- `isRootChild()`
- `setRootChild(bool v)`
- `initBaseStyle()`
- `parseBaseStyle(const OTMLNodePtr& styleNode)`
- `drawBackground(const Rect& screenCoords)`
- `drawBorder(const Rect& screenCoords)`
- `drawIcon(const Rect& screenCoords)`
- `setX(int x)`
- `setY(int y)`
- `setWidth(int width)`
- `setHeight(int height)`
- `setSize(const Size& size)`
- `setPosition(const Point& pos)`
- `setColor(const Color& color)`
- `setBackgroundColor(const Color& color)`
- `setBackgroundOffsetX(int x)`
- `setBackgroundOffsetY(int y)`
- `setBackgroundOffset(const Point& pos)`
- `setBackgroundWidth(int width)`
- `setBackgroundHeight(int height)`
- `setBackgroundSize(const Size& size)`
- `setBackgroundRect(const Rect& rect)`
- `setIcon(const std::string& iconFile)`
- `setIconColor(const Color& color)`
- `setIconOffsetX(int x)`
- `setIconOffsetY(int y)`
- `setIconOffset(const Point& pos)`
- `setIconWidth(int width)`
- `setIconHeight(int height)`
- `setIconSize(const Size& size)`
- `setIconRect(const Rect& rect)`
- `setIconClip(const Rect& rect)`
- `setIconAlign(Fw::AlignmentFlag align)`
- `setBorderWidth(int width)`
- `setBorderWidthTop(int width)`
- `setBorderWidthRight(int width)`
- `setBorderWidthBottom(int width)`
- `setBorderWidthLeft(int width)`
- `setBorderColor(const Color& color)`
- `setBorderColorTop(const Color& color)`
- `setBorderColorRight(const Color& color)`
- `setBorderColorBottom(const Color& color)`
- `setBorderColorLeft(const Color& color)`
- `setMargin(int margin)`
- `setMarginHorizontal(int margin)`
- `setMarginVertical(int margin)`
- `setMarginTop(int margin)`
- `setMarginRight(int margin)`
- `setMarginBottom(int margin)`
- `setMarginLeft(int margin)`
- `setPadding(int padding)`
- `setPaddingHorizontal(int padding)`
- `setPaddingVertical(int padding)`
- `setPaddingTop(int padding)`
- `setPaddingRight(int padding)`
- `setPaddingBottom(int padding)`
- `setPaddingLeft(int padding)`
- `setOpacity(float opacity)`
- `setRotation(float degrees)`
- `setChangeCursorImage(bool enable)`
- `setCursor(const std::string& cursor)`
- `getX()`
- `getY()`
- `getPosition()`
- `getWidth()`
- `getHeight()`
- `getSize()`
- `getRect()`
- `getColor()`
- `getBackgroundColor()`
- `getBackgroundOffsetX()`
- `getBackgroundOffsetY()`
- `getBackgroundOffset()`
- `getBackgroundWidth()`
- `getBackgroundHeight()`
- `getBackgroundSize()`
- `getBackgroundRect()`
- `getIconColor()`
- `getIconOffsetX()`
- `getIconOffsetY()`
- `getIconOffset()`
- `getIconWidth()`
- `getIconHeight()`
- `getIconSize()`
- `getIconRect()`
- `getIconClip()`
- `getIconPath()`
- `getIconAlign()`
- `getBorderTopColor()`
- `getBorderRightColor()`
- `getBorderBottomColor()`
- `getBorderLeftColor()`
- `getBorderTopWidth()`
- `getBorderRightWidth()`
- `getBorderBottomWidth()`
- `getBorderLeftWidth()`
- `getMarginTop()`
- `getMarginRight()`
- `getMarginBottom()`
- `getMarginLeft()`
- `getPaddingTop()`
- `getPaddingRight()`
- `getPaddingBottom()`
- `getPaddingLeft()`
- `getOpacity()`
- `getRotation()`
- `isChangingCursorImage()`
- `initImage()`
- `parseImageStyle(const OTMLNodePtr& styleNode)`
- `updateImageCache()`
- `configureBorderImage()`
- `drawImage(const Rect& screenCoords)`
- `setQRCode(const std::string& code, int border)`
- `setImageSource(const std::string& source)`
- `setImageSourceBase64(const std::string & data)`
- `setImageClip(const Rect& clipRect)`
- `setImageOffsetX(int x)`
- `setImageOffsetY(int y)`
- `setImageOffset(const Point& pos)`
- `setImageWidth(int width)`
- `setImageHeight(int height)`
- `setImageSize(const Size& size)`
- `setImageRect(const Rect& rect)`
- `setImageColor(const Color& color)`
- `setImageFixedRatio(bool fixedRatio)`
- `setImageRepeated(bool repeated)`
- `setImageSmooth(bool smooth)`
- `setImageAutoResize(bool autoResize)`
- `setImageBorderTop(int border)`
- `setImageBorderRight(int border)`
- `setImageBorderBottom(int border)`
- `setImageBorderLeft(int border)`
- `setImageBorder(int border)`
- `setImageShader(const std::string& str)`
- `getImageClip()`
- `getImageOffsetX()`
- `getImageOffsetY()`
- `getImageOffset()`
- `getImageWidth()`
- `getImageHeight()`
- `getImageSize()`
- `getImageRect()`
- `getImageColor()`
- `isImageFixedRatio()`
- `isImageSmooth()`
- `isImageAutoResize()`
- `getImageBorderTop()`
- `getImageBorderRight()`
- `getImageBorderBottom()`
- `getImageBorderLeft()`
- `getImageTextureWidth()`
- `getImageTextureHeight()`
- `getImageShader()`
- `initText()`
- `parseTextStyle(const OTMLNodePtr& styleNode)`
- `updateText()`
- `drawText(const Rect& screenCoords)`
- `onTextChange(const std::string& text, const std::string& oldText)`
- `onFontChange(const std::string& font)`
- `resizeToText()`
- `clearText()`
- `setText(std::string text, bool dontFireLuaCall = false)`
- `setColoredText(const std::vector<std::string>& texts, bool dontFireLuaCall = false)`
- `setTextAlign(Fw::AlignmentFlag align)`
- `setTextOffset(const Point& offset)`
- `setTextWrap(bool textWrap)`
- `setTextAutoResize(bool textAutoResize)`
- `setTextHorizontalAutoResize(bool textAutoResize)`
- `setTextVerticalAutoResize(bool textAutoResize)`
- `setTextOnlyUpperCase(bool textOnlyUpperCase)`
- `setFont(const std::string& fontName)`
- `setShadow(bool shadow)`
- `getText()`
- `getDrawText()`
- `getTextAlign()`
- `getTextOffset()`
- `getTextWrap()`
- `getFont()`
- `getTextSize()`
# # framework/ui/uiwidgetbasestyle.cpp

- `OTMLException(node, "border param must have its width followed by its color")`
- `UIHorizontalLayout(static_self_cast<UIWidget>()))`
- `UIVerticalLayout(static_self_cast<UIWidget>()))`
- `UIGridLayout(static_self_cast<UIWidget>()))`
- `UIAnchorLayout(static_self_cast<UIWidget>()))`
- `OTMLException(node, "cannot determine layout type")`
- `OTMLException(node, "cannot create anchor, there is no parent widget!")`
- `OTMLException(node, "cannot create anchor, the parent widget doesn't use anchor layout!")`
- `OTMLException(node, "invalid anchor description")`
- `OTMLException(node, "invalid anchor edge")`
- `OTMLException(node, "invalid anchor target edge")`
- `borderRect(screenCoords.topLeft(), screenCoords.width(), m_borderWidth.top)`
- `borderRect(screenCoords.topRight() - Point(m_borderWidth.right - 1, 0), m_borderWidth.right, screenCoords.height())`
- `borderRect(screenCoords.bottomLeft() - Point(0, m_borderWidth.bottom - 1), screenCoords.width(), m_borderWidth.bottom)`
- `borderRect(screenCoords.topLeft(), m_borderWidth.left, screenCoords.height())`
# # framework/ui/uiwidgetimage.cpp

- `textureClipRect(texCoordsOffset, textureClipSize)`
- `leftBorder(clip.left(), clip.top() + top, left, clip.height() - top - bottom)`
- `rightBorder(clip.right() - right + 1, clip.top() + top, right, clip.height() - top - bottom)`
- `topBorder(clip.left() + left, clip.top(), clip.width() - right - left, top)`
- `bottomBorder(clip.left() + left, clip.bottom() - bottom + 1, clip.width() - right - left, bottom)`
- `topLeftCorner(clip.left(), clip.top(), left, top)`
- `topRightCorner(clip.right() - right + 1, clip.top(), right, top)`
- `bottomLeftCorner(clip.left(), clip.bottom() - bottom + 1, left, bottom)`
- `bottomRightCorner(clip.right() - right + 1, clip.bottom() - bottom + 1, right, bottom)`
- `center(clip.left() + left, clip.top() + top, clip.width() - right - left, clip.height() - top - bottom)`
- `bordersSize(leftBorder.width() + rightBorder.width(), topBorder.height() + bottomBorder.height())`
- `DrawQueueItemImageWithShader(m_imageCoordsBuffer, m_imageTexture, m_imageColor, m_shader)`
- `Texture(Image::fromQRCode(code, border)))`
# # framework/ui/uiwidgettext.cpp

- `c(Color::white)`
# # framework/util/color.cpp

- `ss(coltext)`
- `Color(0, 0, 0)`
- `Color(loc7, loc7, loc7)`
- `Color(int(red * 255), int(green * 255), int(blue * 255))`
# # framework/util/color.h

class Color
- `Color() : m_r(1.0f), m_g(1.0f), m_b(1.0f), m_a(1.0f)`
- `a()`
- `b()`
- `g()`
- `r()`
- `aF()`
- `bF()`
- `gF()`
- `rF()`
- `setRed(int r)`
- `setGreen(int g)`
- `setBlue(int b)`
- `setAlpha(int a)`
- `setRed(float r)`
- `setGreen(float g)`
- `setBlue(float b)`
- `setAlpha(float a)`
- `setRGBA(uint8 r, uint8 g, uint8 b, uint8 a = 0xFF)`
- `setRGBA(uint32 rgba)`
- `opacity(float opacity)`
- `Color(m_r, m_g, m_b, m_a * opacity)`
- `Color(m_r + other.m_r, m_g + other.m_g, m_b + other.m_b, m_a + other.m_a)`
- `Color(m_r - other.m_r, m_g - other.m_g, m_b - other.m_b, m_a - other.m_a)`
- `Color(m_r*v, m_g*v, m_b*v, m_a*v)`
- `Color(m_r/v, m_g/v, m_b/v, m_a/v)`
- `toHex()`
- `to8bit(const Color& color)`
- `from8bit(int color)`
- `Color(0, 0, 0)`
- `Color(r, g, b)`
- `getOutfitColor(int color)`
# # framework/util/crypt.cpp

- `is_base64(unsigned char c)`
- `RSA_free(m_rsa)`
- `_encrypt(std::string(m_machineUUID.begin(), m_machineUUID.end()), false)`
- `namegen(uuid)`
- `BN_dec2bn(&m_rsa->n, n.c_str())`
- `BN_dec2bn(&m_rsa->p, p.c_str())`
- `BN_mod(m_rsa->dmp1, m_rsa->d, r1, ctx)`
- `RSA_size(m_rsa)`
# # framework/util/crypt.h

class Crypt
- `Crypt()`
- `base64Encode(const std::string& decoded_string)`
- `base64Decode(const std::string& encoded_string)`
- `xorCrypt(const std::string& buffer, const std::string& key)`
- `encrypt(const std::string& decrypted_string)`
- `_encrypt(decrypted_string, true)`
- `decrypt(const std::string& encrypted_string)`
- `_decrypt(encrypted_string, true)`
- `genUUID()`
- `setMachineUUID(std::string uuidstr)`
- `getMachineUUID()`
- `md5Encode(const std::string& decoded_string, bool upperCase)`
- `sha1Encode(const std::string& decoded_string, bool upperCase)`
- `sha256Encode(const std::string& decoded_string, bool upperCase)`
- `sha512Encode(const std::string& decoded_string, bool upperCase)`
- `crc32(const std::string& decoded_string, bool upperCase)`
- `rsaGenerateKey(int bits, int e)`
- `rsaSetPublicKey(const std::string& n, const std::string& e)`
- `rsaSetPrivateKey(const std::string &p, const std::string &q, const std::string &d)`
- `rsaCheckKey()`
- `rsaEncrypt(unsigned char *msg, int size)`
- `rsaDecrypt(unsigned char *msg, int size)`
- `rsaGetSize()`
- `bencrypt(uint8_t * buffer, int len, uint64_t k)`
- `bdecrypt(uint8_t * buffer, int len, uint64_t k)`
- `_encrypt(const std::string& decrypted_string, bool useMachineUUID)`
- `_decrypt(const std::string& encrypted_string, bool useMachineUUID)`
- `getCryptKey(bool useMachineUUID)`
# # framework/util/databuffer.h

class T
class DataBuffer
- `reset()`
- `clear()`
- `empty()`
- `size()`
- `reserve(uint n)`
- `resize(uint n, T def = T())`
- `grow(uint n, bool precise = false)`
- `add(const T& v)`
# # framework/util/extras.h

class Extras
- `DEFINE_OPTION(option, description)`
- `Extras()`
- `set(const std::string& key, bool value)`
- `get(const std::string& key)`
- `getDescription(const std::string& key)`
- `getAll()`
# # framework/util/framecounter.h

class FrameCounter
# # framework/util/matrix.h

class Matrix
- `Matrix()`
- `Matrix(const std::initializer_list<U>& values)`
- `Matrix(const U *values)`
- `setIdentity()`
- `isIdentity()`
- `fill(T value)`
- `transposed()`
- `transpose()`
- `result(1)`
- `c(1)`
- `c(a)`
- `c(a)`
- `c(a)`
# # framework/util/pngunpacker.h

class FileMetadata
class PngUnpacker
- `FileMetadata(const FileStreamPtr& file)`
- `getOffset()`
- `getFileSize()`
- `unpack(const FileStreamPtr& file)`
# # framework/util/point.h

class T
class TSize
class T
class TPoint
class T
class T
- `TPoint() : x(0), y(0)`
- `isNull()`
- `toSize()`
- `length()`
- `sqrt((float)(x*x + y*y))`
- `distanceFrom(const TPoint<T>& other)`
# # framework/util/qrcodegen.h

- `qrcodegen_isAlphanumeric(const char *text)`
- `qrcodegen_isNumeric(const char *text)`
- `qrcodegen_calcSegmentBufferSize(enum qrcodegen_Mode mode, size_t numChars)`
- `qrcodegen_makeBytes(const uint8_t data[], size_t len, uint8_t buf[])`
- `qrcodegen_makeNumeric(const char *digits, uint8_t buf[])`
- `qrcodegen_makeAlphanumeric(const char *text, uint8_t buf[])`
- `qrcodegen_makeEci(long assignVal, uint8_t buf[])`
- `qrcodegen_getSize(const uint8_t qrcode[])`
- `qrcodegen_getModule(const uint8_t qrcode[], int x, int y)`
# # framework/util/rect.h

class T
class TPoint
class T
class TSize
class T
class TRect
class T
class T
- `TRect() : x1(0), y1(0), x2(-1), y2(-1)`
- `isNull()`
- `isEmpty()`
- `isValid()`
- `topLeft()`
- `bottomRight()`
- `topRight()`
- `bottomLeft()`
- `topCenter()`
- `bottomCenter()`
- `centerLeft()`
- `centerRight()`
- `center()`
- `size()`
- `reset()`
- `clear()`
- `setLeft(T pos)`
- `setTop(T pos)`
- `setRight(T pos)`
- `setBottom(T pos)`
- `setX(T x)`
- `setY(T y)`
- `setTopLeft(const TPoint<T> &p)`
- `setBottomRight(const TPoint<T> &p)`
- `setTopRight(const TPoint<T> &p)`
- `setBottomLeft(const TPoint<T> &p)`
- `setWidth(T width)`
- `setHeight(T height)`
- `setSize(const TSize<T>& size)`
- `setRect(T x, T y, T width, T height)`
- `setCoords(int left, int top, int right, int bottom)`
- `expandLeft(T add)`
- `expandTop(T add)`
- `expandRight(T add)`
- `expandBottom(T add)`
- `expand(T top, T right, T bottom, T left)`
- `expand(T add)`
- `translate(T x, T y)`
- `translate(const TPoint<T> &p)`
- `resize(const TSize<T>& size)`
- `resize(T width, T height)`
- `move(T x, T y)`
- `move(const TPoint<T> &p)`
- `moveLeft(T pos)`
- `moveTop(T pos)`
- `moveRight(T pos)`
- `moveBottom(T pos)`
- `moveTopLeft(const TPoint<T> &p)`
- `moveBottomRight(const TPoint<T> &p)`
- `moveTopRight(const TPoint<T> &p)`
- `moveBottomLeft(const TPoint<T> &p)`
- `moveTopCenter(const TPoint<T> &p)`
- `moveBottomCenter(const TPoint<T> &p)`
- `moveCenterLeft(const TPoint<T> &p)`
- `moveCenterRight(const TPoint<T> &p)`
- `translated(int x, int y)`
- `translated(const TPoint<T> &p)`
- `expanded(T add)`
- `moveCenter(const TPoint<T> &p)`
- `moveHorizontalCenter(T x)`
- `moveVerticalCenter(T y)`
- `contains(const TPoint<T> &p, bool insideOnly = false)`
- `contains(const TRect<T> &r, bool insideOnly = false)`
- `intersects(const TRect<T> &r)`
- `united(const TRect<T> &r)`
- `intersection(const TRect<T> &r)`
- `bind(const TRect<T> &r)`
- `alignIn(const TRect<T> &r, Fw::AlignmentFlag align)`
- `translated(other)`
# # framework/util/size.h

class T
class TSize
class T
class T
- `TSize() : wd(-1), ht(-1)`
- `toPoint()`
- `isNull()`
- `isEmpty()`
- `isValid()`
- `resize(T w, T h)`
- `setWidth(T w)`
- `setHeight(T h)`
- `expandedTo(const TSize<T>& other)`
- `boundedTo(const TSize<T>& other)`
- `scale(const TSize<T>& s, Fw::AspectRatioMode mode)`
- `scale(int w, int h, Fw::AspectRatioMode mode)`
- `ratio()`
# # framework/util/stats.cpp

- `lock(m_mutex)`
- `lock(m_mutex)`
- `lock(m_mutex)`
- `lock(m_mutex)`
- `lock(m_mutex)`
- `lock(m_mutex)`
- `collectWidgets(WidgetTreeNode& node)`
- `printNode(std::stringstream& ret, WidgetTreeNode& node, int depth, int limit, bool pretty)`
# # framework/util/stats.h

class UIWidget
class Stats
class AutoStat
- `add(int type, Stat* stats)`
- `get(int type, int limit, bool pretty)`
- `clear(int type)`
- `clearAll()`
- `getSlow(int type, int limit, unsigned int minTime, bool pretty)`
- `clearSlow(int type)`
- `types()`
- `getSleepTime()`
- `resetSleepTime()`
- `addWidget(UIWidget* widget)`
- `removeWidget(UIWidget* widget)`
- `getWidgetsInfo(int limit, bool pretty)`
- `addTexture()`
- `removeTexture()`
- `addThing()`
- `removeThing()`
- `addCreature()`
- `removeCreature()`
- `Stat(0, description, extraDescription)), m_timePoint(std::chrono::high_resolution_clock::now())`
# # framework/xml/tinystr.h

class isn
class TiXmlString
class TiXmlOutStream
- `TiXmlString() : rep_(&nullrep_)`
- `TiXmlString( const TiXmlString & copy) : rep_(0)`
- `TiXmlString( const char * copy) : rep_(0)`
- `TiXmlString( const char * str, size_type len) : rep_(0)`
- `assign( copy, (size_type)strlen(copy))`
- `assign(copy.start(), copy.length())`
- `append(suffix, static_cast<size_type>( strlen(suffix) ))`
- `append(&single, 1)`
- `append(suffix.data(), suffix.length())`
- `length()`
- `size()`
- `empty()`
- `capacity()`
- `find(char lookup)`
- `find(lookup, 0)`
- `find(char tofind, size_type offset)`
- `clear()`
- `quit()`
- `reserve(size_type cap)`
- `swap(TiXmlString& other)`
- `init(size_type sz)`
- `set_size(size_type sz)`
- `init(size_type sz, size_type cap)`
- `new(sizeof(Rep) + cap))`
- `quit()`
# # framework/xml/tinyxml.cpp

- `fopen( filename, mode )`
- `sprintf( buf, "&#x%02X;", (unsigned) ( c & 0xff ) )`
- `LinkEndChild( node )`
- `FirstChild()`
- `FirstChild( val )`
- `TiXmlElement( Value() )`
- `LoadFile( Value(), encoding )`
- `SaveFile( Value() )`
- `filename( _filename )`
- `Clear()`
- `TiXmlDocument()`
- `sprintf(buf, "%d", _value)`
- `SetValue(buf)`
- `sprintf(buf, "%g", _value)`
- `SetValue(buf)`
- `atoi(value.c_str ())`
- `atof(value.c_str ())`
- `TiXmlComment()`
- `TiXmlText( "" )`
- `TiXmlDeclaration()`
- `TiXmlUnknown()`
- `VALIDATE( !Find( TIXML_STRING( addMe->Name() ) ) )`
- `VALIDATE( !Find( addMe->Name() ) )`
- `TiXmlAttribute()`
- `TiXmlAttribute()`
- `TiXmlHandle( child )`
- `TiXmlHandle( 0 )`
- `TiXmlHandle( child )`
- `TiXmlHandle( 0 )`
- `TiXmlHandle( child )`
- `TiXmlHandle( 0 )`
- `TiXmlHandle( child )`
- `TiXmlHandle( 0 )`
- `TiXmlHandle( child )`
- `TiXmlHandle( 0 )`
- `TiXmlHandle( child )`
- `TiXmlHandle( 0 )`
- `TiXmlHandle( child )`
- `TiXmlHandle( 0 )`
- `TiXmlHandle( child )`
- `TiXmlHandle( 0 )`
# # framework/xml/tinyxml.h

class TiXmlDocument
class TiXmlElement
class TiXmlComment
class TiXmlUnknown
class TiXmlAttribute
class TiXmlText
class TiXmlDeclaration
class TiXmlParsingData
class to
class TiXmlVisitor
class for
class in
class TiXmlBase
class TiXmlNode
class TiXmlElement
class TiXmlDocument
class for
class TiXmlNode
class TiXmlDocument
class TiXmlElement
class TiXmlAttribute
class TiXmlAttributeSet
class used
class TiXmlAttributeSet
class must
class TiXmlElement
class TiXmlComment
class TiXmlText
class TiXmlElement
class TiXmlDeclaration
class TiXmlUnknown
class TiXmlDocument
class that
class TiXmlHandle
class TiXmlPrinter
- `Clear()`
- `VisitEnter( const TiXmlDocument& /*doc*/ )`
- `VisitExit( const TiXmlDocument& /*doc*/ )`
- `VisitEnter( const TiXmlElement& /*element*/, const TiXmlAttribute* /*firstAttribute*/ )`
- `VisitExit( const TiXmlElement& /*element*/ )`
- `Visit( const TiXmlDeclaration& /*declaration*/ )`
- `Visit( const TiXmlText& /*text*/ )`
- `Visit( const TiXmlComment& /*comment*/ )`
- `Visit( const TiXmlUnknown& /*unknown*/ )`
- `SetCondenseWhiteSpace( bool condense )`
- `IsWhiteSpaceCondensed()`
- `Row()`
- `Column()`
- `SetUserData( void* user )`
- `EncodeString( const TIXML_STRING& str, TIXML_STRING* out )`
- `IsWhiteSpace( char c )`
- `IsWhiteSpace( int c )`
- `IsWhiteSpace( (char) c )`
- `StreamWhiteSpace( std::istream * in, TIXML_STRING * tag )`
- `StreamTo( std::istream * in, int character, TIXML_STRING * tag )`
- `GetEntity( p, _value, length, encoding )`
- `IsAlpha( unsigned char anyByte, TiXmlEncoding encoding )`
- `IsAlphaNum( unsigned char anyByte, TiXmlEncoding encoding )`
- `ToLower( int v, TiXmlEncoding encoding )`
- `tolower( v )`
- `tolower( v )`
- `ConvertUTF32ToUTF8( unsigned long input, char* output, int* length )`
- `SetValue(const char * _value)`
- `SetValue( const std::string& _value )`
- `Clear()`
- `FirstChild(_value.c_str ())`
- `FirstChild(_value.c_str ())`
- `LastChild(_value.c_str ())`
- `LastChild(_value.c_str ())`
- `IterateChildren(_value.c_str (), previous)`
- `IterateChildren(_value.c_str (), previous)`
- `RemoveChild( TiXmlNode* removeThis )`
- `PreviousSibling(_value.c_str ())`
- `PreviousSibling(_value.c_str ())`
- `NextSibling(_value.c_str ())`
- `NextSibling(_value.c_str ())`
- `NextSiblingElement(_value.c_str ())`
- `NextSiblingElement(_value.c_str ())`
- `FirstChildElement(_value.c_str ())`
- `FirstChildElement(_value.c_str ())`
- `Type()`
- `NoChildren()`
- `TiXmlNode( NodeType _type )`
- `CopyTo( TiXmlNode* target )`
- `IntValue()`
- `DoubleValue()`
- `QueryIntValue( int* _value )`
- `QueryDoubleValue( double* _value )`
- `SetName( const char* _name )`
- `SetValue( const char* _value )`
- `SetIntValue( int _value )`
- `SetDoubleValue( double _value )`
- `SetName( const std::string& _name )`
- `SetValue( const std::string& _value )`
- `Print( FILE* cfile, int depth )`
- `Print( FILE* cfile, int depth, TIXML_STRING* str )`
- `SetDocument( TiXmlDocument* doc )`
- `TiXmlAttribute( const TiXmlAttribute& )`
- `TiXmlAttributeSet()`
- `Add( TiXmlAttribute* attribute )`
- `Remove( TiXmlAttribute* attribute )`
- `TiXmlElement( const std::string& _value )`
- `T()`
- `QueryValueAttribute( const std::string& name, T* outValue )`
- `sstream( node->ValueStr() )`
- `QueryValueAttribute( const std::string& name, std::string* outValue )`
- `Attribute( const std::string& name )`
- `Attribute( const std::string& name, int* i )`
- `Attribute( const std::string& name, double* d )`
- `SetAttribute( const std::string& name, const std::string& _value )`
- `SetAttribute( const std::string& name, int _value)`
- `RemoveAttribute( const std::string& name )`
- `Print( FILE* cfile, int depth )`
- `Accept( TiXmlVisitor* visitor )`
- `CopyTo( TiXmlElement* target )`
- `ClearThis()`
- `StreamIn( std::istream * in, TIXML_STRING * tag )`
- `Print( FILE* cfile, int depth )`
- `Accept( TiXmlVisitor* visitor )`
- `CopyTo( TiXmlComment* target )`
- `StreamIn( std::istream * in, TIXML_STRING * tag )`
- `StreamOut( TIXML_OSTREAM * out )`
- `TiXmlText( const TiXmlText& copy ) : TiXmlNode( TiXmlNode::TINYXML_TEXT )`
- `Print( FILE* cfile, int depth )`
- `CDATA()`
- `SetCDATA( bool _cdata )`
- `Accept( TiXmlVisitor* content )`
- `CopyTo( TiXmlText* target )`
- `Blank()`
- `StreamIn( std::istream * in, TIXML_STRING * tag )`
- `Print( FILE* cfile, int depth, TIXML_STRING* str )`
- `Print( FILE* cfile, int depth )`
- `Accept( TiXmlVisitor* visitor )`
- `CopyTo( TiXmlDeclaration* target )`
- `StreamIn( std::istream * in, TIXML_STRING * tag )`
- `TiXmlUnknown() : TiXmlNode( TiXmlNode::TINYXML_UNKNOWN )`
- `Print( FILE* cfile, int depth )`
- `Accept( TiXmlVisitor* content )`
- `CopyTo( TiXmlUnknown* target )`
- `StreamIn( std::istream * in, TIXML_STRING * tag )`
- `TiXmlDocument( const TiXmlDocument& copy )`
- `LoadFile( TiXmlEncoding encoding = TIXML_DEFAULT_ENCODING )`
- `SaveFile()`
- `LoadFile( const char * filename, TiXmlEncoding encoding = TIXML_DEFAULT_ENCODING )`
- `SaveFile( const char * filename )`
- `LoadFile( FILE*, TiXmlEncoding encoding = TIXML_DEFAULT_ENCODING )`
- `SaveFile( FILE* )`
- `LoadFile( filename.c_str(), encoding )`
- `SaveFile( filename.c_str() )`
- `FirstChildElement()`
- `FirstChildElement()`
- `Error()`
- `ErrorId()`
- `ErrorRow()`
- `ErrorCol()`
- `SetTabSize( int _tabsize )`
- `TabSize()`
- `ClearError()`
- `Print()`
- `Print( FILE* cfile, int depth = 0 )`
- `SetError( int err, const char* errorLocation, TiXmlParsingData* prevData, TiXmlEncoding encoding )`
- `Accept( TiXmlVisitor* content )`
- `StreamIn( std::istream * in, TIXML_STRING * tag )`
- `CopyTo( TiXmlDocument* target )`
- `docHandle( &document )`
- `TiXmlHandle( const TiXmlHandle& ref )`
- `FirstChild()`
- `FirstChild( const char * value )`
- `FirstChildElement()`
- `FirstChildElement( const char * value )`
- `Child( const char* value, int index )`
- `Child( int index )`
- `ChildElement( const char* value, int index )`
- `ChildElement( int index )`
- `FirstChild( const std::string& _value )`
- `FirstChild( _value.c_str() )`
- `FirstChildElement( const std::string& _value )`
- `FirstChildElement( _value.c_str() )`
- `Child( const std::string& _value, int index )`
- `Child( _value.c_str(), index )`
- `ChildElement( const std::string& _value, int index )`
- `ChildElement( _value.c_str(), index )`
- `ToNode()`
- `ToElement()`
- `ToText()`
- `ToUnknown()`
- `VisitEnter( const TiXmlDocument& doc )`
- `VisitExit( const TiXmlDocument& doc )`
- `VisitEnter( const TiXmlElement& element, const TiXmlAttribute* firstAttribute )`
- `VisitExit( const TiXmlElement& element )`
- `Visit( const TiXmlDeclaration& declaration )`
- `Visit( const TiXmlText& text )`
- `Visit( const TiXmlComment& comment )`
- `Visit( const TiXmlUnknown& unknown )`
- `SetIndent( const char* _indent )`
- `SetLineBreak( const char* _lineBreak )`
- `SetStreamPrinting()`
- `Size()`
- `DoIndent()`
- `DoLineBreak()`
# # framework/xml/tinyxmlparser.cpp

class TiXmlParsingData
class TiXmlDocument
- `isalpha( anyByte )`
- `isalpha( anyByte )`
- `isalnum( anyByte )`
- `isalnum( anyByte )`
- `Stamp( const char* now, TiXmlEncoding encoding )`
- `data( p, TabSize(), location.row, location.col )`
- `TIXML_LOG( "XML parsing Declaration\n" )`
- `TiXmlDeclaration()`
- `TIXML_LOG( "XML parsing Comment\n" )`
- `TiXmlComment()`
- `TIXML_LOG( "XML parsing CDATA\n" )`
- `TiXmlText( "" )`
- `TIXML_LOG( "XML parsing Unknown(1)\n" )`
- `TiXmlUnknown()`
- `TIXML_LOG( "XML parsing Element\n" )`
- `TiXmlElement( "" )`
- `TIXML_LOG( "XML parsing Unknown(2)\n" )`
- `TiXmlUnknown()`
- `text( "" )`
- `endTag("</")`
- `TiXmlAttribute()`
- `TiXmlText( "" )`
