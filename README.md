# OTCv8 Developer Editon

Special version of OTCv8 allowing to edit src/client dir to help improving OTCv8. You can add whatever you want and create pull request with your changes.
Accepted pull requests will be added to official OTCv8 version, so if you want a new feature in OTCv8, just add it here and wait for approval.
If you add custom feature, make sure it's optional and can be enabled via g_game.enableFeature function, otherwise your pull request will be rejected.

This repository uses Github Actions to build and test OTCv8 automaticlly whenever you push changes to repository.

Check Actions tab to see test results or to download latest binaries. 

![Workflow status](https://github.com/OTCv8/otcv8-dev/actions/workflows/Test.yml/badge.svg)

### Quick start

1. Get and run: https://visualstudio.microsoft.com/vs/community/
2. Select "Desktop Development with C++" and click Install
3. Unpack include.7z (to include/ dir) and lib.7z (to main dir)
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

### Useful tips

- To run tests manually, unpack tests.7z and use command `otclient_debug.exe --test`
- To test mobile UI use command `otclient_debug.exe --mobile`

### Links

- Discord: https://discord.gg/feySup6
- Forum: http://otclient.net
- Email: otclient@otclient.ovh
