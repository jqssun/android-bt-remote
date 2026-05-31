# Bluetooth HID Remote for Android

[![Stars](https://img.shields.io/github/stars/jqssun/android-bt-remote?label=stars&logo=GitHub)](https://github.com/jqssun/android-bt-remote)
[![GitHub](https://img.shields.io/github/downloads/jqssun/android-bt-remote/total?label=GitHub&logo=GitHub)](https://github.com/jqssun/android-bt-remote/releases)
[![license](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE)
[![build](https://img.shields.io/github/actions/workflow/status/jqssun/android-bt-remote/apk.yml?label=build)](https://github.com/jqssun/android-bt-remote/actions/workflows/apk.yml)
[![release](https://img.shields.io/github/v/release/jqssun/android-bt-remote)](https://github.com/jqssun/android-bt-remote/releases)

**Remote** turns any Android device into a Bluetooth (Classic) HID keyboard, mouse, and trackpad designed for all platforms that accept generic Bluetooth input. 

It is built on top of the original [BT Remote designed for Android TV](https://gitlab.com/Atharok/BtRemote) but instead made to work with macOS, iOS (+ iPadOS), Windows, Android, ChromeOS, Linux (+ SteamOS) as well as all other platforms that support Bluetooth input devices.

Unlike network remote-control tools, this does not require a companion application on the target. The Android device presents itself as a generic Bluetooth Human Interface Device (HID) and sends HID-compliant keyboard reports, media controls, and mouse input directly over Bluetooth.

<video loop src='https://github.com/user-attachments/assets/0ea7c954-c50a-4e64-9d49-910abbab7b7e' alt="demo" width="1200" style="display: block; margin: auto;"></video>

## Compatibility

- HID device (controller): Android 9.0+ with Bluetooth
- HID host (target): 
    - Android 4 and later
    - Android TV, Google TV, and Fire OS
    - ChromeOS
    - iOS 13 (iPadOS 13) and later
    - iOS 4 and later (keyboard only)
    - tvOS 9.2 and later
    - Mac OS X 10.3 and later
    - Linux kernel 2.6 and later
    - SteamOS
    - Windows XP Service Pack 2 and later

## Implementation

**Remote** registers with Android's `BluetoothHidDevice` profile and sends HID reports for keyboard, mouse, and remote control actions. This build uses the upstream project as a submodule in [`src`](src) with additional modifications in [`patches`](patches).

```shell
git submodule update --init --recursive
./build.sh
cd src
./gradlew assembleDefaultDebug
```

Check out the [CI](.github/workflows/apk.yml) for more details on reproducible builds.

## Credits

- [Atharok](https://gitlab.com/Atharok/BtRemote) for the original BT Remote
