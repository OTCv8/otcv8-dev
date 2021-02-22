# OTCv8 Developer Editon

Special version of OTC v8 allowing to edit src/client dir to conduct some tests and help create pull requests.

### Quick start

1. Get and run: https://visualstudio.microsoft.com/vs/community/
2. Select "Desktop Development with C++" and click Install
3. Unpack lib.7z and include.7z (to include/ dir)
4. Open vc16/otclient.sln
5. Select Build -> Build otclient
6. It should generate otclient_debug.exe
7. Run otclient_debug.exe

### Limitations of Developer Edition

- It can be build only as Debug, optimizations are disabled
- Limited to 60 fps
- Doesn't support encryption and updater
- Executable has limited uptime, can work max. 1h
- There's no access to framework .cpp files
- Only DirectX is supported
