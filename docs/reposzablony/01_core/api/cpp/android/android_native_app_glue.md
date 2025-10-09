---
doc_id: "cpp-api-2a3e45b2b8c8"
source_path: "android/android_native_app_glue.h"
source_sha: "3ead5ec"
last_sync_iso: "2025-10-09T10:28:07Z"
doc_class: "api"
language: "pl"
title: "API: android_native_app_glue.h"
summary: "Dokumentacja API C++ dla android/android_native_app_glue.h"
tags: ["cpp", "api", "otclient"]
---

# android/android_native_app_glue.h

## Overview

Plik nagłówkowy C++ zawierający definicje dla modułu android_native_app_glue.

## Classes/Structs

### Struktura: `android_app`

The native activity interface provided by <android/native_activity.h> * is based on a set of application-provided callbacks that will be called * by the Activity's main thread when certain events occur. * * This means that each one of this callbacks _should_ _not_ block, or they * risk having the system force-close the application. This programming * model is direct, lightweight, but constraining. * * The 'threaded_native_app' static library is used to provide a different * execution model where the application can implement its own main event * loop in a different thread instead. Here's how it works: * * 1/ The application must provide a function named "android_main()" that *    will be called when the activity is created, in a new thread that is *    distinct from the activity's main thread. * * 2/ android_main() receives a pointer to a valid "android_app" structure *    that contains references to other important objects, e.g. the *    ANativeActivity obejct instance the application is running in. * * 3/ the "android_app" object holds an ALooper instance that already *    listens to two important things: * *      - activity lifecycle events (e.g. "pause", "resume"). See APP_CMD_XXX *        declarations below. * *      - input events coming from the AInputQueue attached to the activity. * *    Each of these correspond to an ALooper identifier returned by *    ALooper_pollOnce with values of LOOPER_ID_MAIN and LOOPER_ID_INPUT, *    respectively. * *    Your application can use the same ALooper to listen to additional *    file-descriptors.  They can either be callback based, or with return *    identifiers starting with LOOPER_ID_USER. * * 4/ Whenever you receive a LOOPER_ID_MAIN or LOOPER_ID_INPUT event, *    the returned data will point to an android_poll_source structure.  You *    can call the process() function on it, and fill in android_app->onAppCmd *    and android_app->onInputEvent to be called for your own processing *    of the event. * *    Alternatively, you can call the low-level functions to read and process *    the data directly...  look at the process_cmd() and process_input() *    implementations in the glue to see how to do this. * * See the sample named "native-activity" that comes with the NDK with a * full usage example.  Also look at the JavaDoc of NativeActivity.

### Struktura: `android_poll_source`

Data associated with an ALooper fd that will be returned as the "outData" * when that source has data ready.

### Struktura: `android_app`

### Struktura: `android_app`

This is the interface for the standard glue code of a threaded * application.  In this model, the application's code is running * in its own thread separate from the main thread of the process. * It is not required that this thread be associated with the Java * VM, although it will need to be in order to make JNI calls any * Java objects.

### Struktura: `android_poll_source`

### Struktura: `android_poll_source`

## Functions

### `android_app_read_cmd`

Call when ALooper_pollAll() returns LOOPER_ID_MAIN, reading the next * app command message.

**Sygnatura:** `int8_t android_app_read_cmd(struct android_app* android_app)`

### `android_app_pre_exec_cmd`

Call with the command returned by android_app_read_cmd() to do the * initial pre-processing of the given command.  You can perform your own * actions for the command after calling this function.

**Sygnatura:** `void android_app_pre_exec_cmd(struct android_app* android_app, int8_t cmd)`

### `android_app_post_exec_cmd`

Call with the command returned by android_app_read_cmd() to do the * final post-processing of the given command.  You must have done your own * actions for the command before calling this function.

**Sygnatura:** `void android_app_post_exec_cmd(struct android_app* android_app, int8_t cmd)`

## Class Diagram

Zobacz: [../diagrams/android_native_app_glue.mmd](../diagrams/android_native_app_glue.mmd)
