# OTCv8 Developer Editon (sources)

Ready to use binaries are available in [OTCv8/otclientv8](https://github.com/OTCv8/otclientv8) repository.

OTCv8 sources. You can add whatever you want and create pull request with your changes.
Accepted pull requests will be added to official OTCv8 version, so if you want a new feature in OTCv8, just add it here and wait for approval.
If you add custom feature, make sure it's optional and can be enabled via g_game.enableFeature function, otherwise your pull request will be rejected.

This repository uses Github Actions to build and test OTCv8 automaticlly whenever you push changes to repository.

Check Actions tab to see test results or to download latest binaries. ![Workflow status](https://github.com/OTCv8/otcv8-dev/actions/workflows/ci-cd.yml/badge.svg)

## Compilation

### Automatic

You can clone repoistory and use github action build-on-request workload.

### Windows

You need visual studio 2019 and vcpkg with commit `3b3bd424827a1f7f4813216f6b32b6c61e386b2e` ([download](https://github.com/microsoft/vcpkg/archive/3b3bd424827a1f7f4813216f6b32b6c61e386b2e.zip)).

Then you install vcpkg dependencies:
```bash
vcpkg install boost-iostreams:x86-windows-static boost-asio:x86-windows-static boost-beast:x86-windows-static boost-system:x86-windows-static boost-variant:x86-windows-static boost-lockfree:x86-windows-static boost-process:x86-windows-static boost-program-options:x86-windows-static luajit:x86-windows-static glew:x86-windows-static boost-filesystem:x86-windows-static boost-uuid:x86-windows-static physfs:x86-windows-static openal-soft:x86-windows-static libogg:x86-windows-static libvorbis:x86-windows-static zlib:x86-windows-static libzip:x86-windows-static openssl:x86-windows-static
```

and then you can compile static otcv8 version.

### Linux

on linux you need:
- vcpkg from commit `761c81d43335a5d5ccc2ec8ad90bd7e2cbba734e`
- boost >=1.67 and libzip-dev, physfs >= 3
- gcc >=9

Then just run mkdir build && cd build && cmake .. && make -j8

### Android

To compile on android you need to create C:\android with
- android-ndk-r21b https://dl.google.com/android/repository/android-ndk-r21d-windows-x86_64.zip
- libs from android_libs.7z

Also install android extension for visual studio
In visual studio go to options -> cross platform -> c++ and set Android NDK to C:\android\android-ndk-r21b
Right click on otclientv8 -> proporties -> general and change target api level to android-25

Put data.zip in android/otclientv8/assets
You can use powershell script create_android_assets.ps1 to create them automaticly (won't be encrypted)

## Useful tips

- To run tests manually, unpack tests.7z and use command `otclient_debug.exe --test`
- To test mobile UI use command `otclient_debug.exe --mobile`

## Links

- Discord: https://discord.gg/feySup6
- Forum: http://otclient.net
- Email: otclient@otclient.ovh
