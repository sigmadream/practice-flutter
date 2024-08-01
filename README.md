# food_sns

> Flutter project를 기반으로 한 위치 기반 공유 SNS 서비스 입니다. 실행은 가능하면, 기기에서 진행하세요.

## 주요 라이브러리

- supabase_flutter
- image_picker
- flutter_naver_map
- geolocator
- http
- daum_postcode_search
- flutter_inappwebview,
- intl

## {Ubuntu, macOS}에서 Flutter 개발 환경 구성 하는 방법

### Ubuntu

#### JDK 설치

```bash
sudo apt install default-jdk
```

#### Android Studio 설치

- `JetBrains Toolbox` 설치
  - [이전 영상](https://youtu.be/oZaWZ8dTjaQ?t=407)에 해당 설치 방법을 소개

- `Android Studio` 설치 > 관련 SDK 설치(API v34)
  - `SDK Tools` > Android SDk command-line Tools 설치
  - `Virtual Device Configuration` > 에뮬레이터 설치(API v34)
  - 간단하게 App 하나 만들어서 실행 확인

#### Flutter SDK 설치

- Flutter SDK 설치
  - snap 명령어

    ```bash
    sudo snap install flutter --classic
    ```

  - App Center를 이용
    - `flutter` 검색 후 설치

- flutter doctor를 사용해서 환경 구성 확인

```bash
$ flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.22.1, on Ubuntu 24.04 LTS 6.8.0-31-generic, locale en_US.UTF-8)
[!] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
    ! Some Android licenses not accepted. To resolve this, run: flutter doctor --android-licenses
[✓] Chrome - develop for the web
[✓] Linux toolchain - develop for Linux desktop
[✓] Android Studio (version 2023.3)
[✓] VS Code (version 1.89.1)
[✓] Connected device (2 available)
[✓] Network resources

! Doctor found issues in 1 category.

$ flutter doctor --android-licenses
- 라이센스 동의에 'Y'

$ flutter doctor                   
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.22.1, on Ubuntu 24.04 LTS 6.8.0-31-generic, locale en_US.UTF-8)
[✓] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
[✓] Chrome - develop for the web
[✓] Linux toolchain - develop for Linux desktop
[✓] Android Studio (version 2023.3)
[✓] VS Code (version 1.89.1)
[✓] Connected device (2 available)
[✓] Network resources

• No issues found!
```

#### VSCode에 Flutter 플러그인 설치

- VS 확장 > Flutter 검색 > 설치
- Command Palette > flutter: New Project
- Command Palette > flutter: Select Device
  - Android, Linux, macOS, iOS 등을 선택해서 실행 확인

#### Android 기기 연결을 위한 설정

- `adb`를 터미널에서 사용할 수 있도록, 관련 경로를 PATH에 추가해주세요.

```bash
$ vi .zshrc

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

$ source .zshrc
$ adb --version
Android Debug Bridge version 1.0.41
Version 35.0.1-11580240
Installed as /home/sd/Android/Sdk/platform-tools/adb
Running on Linux 6.8.0-31-generic (x86_64)
```

- udev에 등록하기 위해서 사용하는 기기의 고유값(id)를 확인하세요

```bash
$ lsusb
...
Bus 003 Device 011: ID 18d1:4ee7 Google Inc. Nexus/Pixel Device (charging + debug)
...
```

- 편집기를 사용해서 udev의 rule을 추가하세요.

```bash
$ sudo vi /etc/51-android.rules

SUBSYSTEM=="usb", ATTR{idVendor}=="18d1", ATTR{idProduct}=="4ee7", MODE="0666", GROUP="plugdev"

$ sudo udevadm control --reload-rules
```

- 기기를 다시 연결하시고, 확인하세요.

```bash
$ adb devices
List of devices attached
HVA0X8X0 device
```

### macOS

#### Apple Silcon 사용자는 아래 명령어를 사용해서 로제타2를 활성화

```bash
sudo softwareupdate --install-rosetta --agree-to-license
```

#### flutter sdk 설치

```bash
brew update 
brew upgrade
brew install git flutter
```

#### android studio

- [android studio를 다운로드](https://developer.android.com/studio) 받으시고, 설치
- 초기 설정화면에서 `android sdk manaer` 등을 설치
- project > more action > sdk manager 에서 아래 도구가 설치되어 있는지 확인(미설치된 도구는 설치할 것)
  - Android SDK Platform, API 34.0.5
  - Android SDK Command-line Tools
  - Android SDK Build-Tools
  - Android SDK Platform-Tools
  - Android Emulator

- project > virtual device
  - AVD 다운로드 및 에뮬레이터 생성

- flutter doctor를 사용해서 점검
  - 초기 설정시 flutter의 android license 동의가 필요하다는 문구가 나온다면 `flutter doctor --android-licenses`를 사용해서 라이센스 동의할 것

```bash
$ flutter doctor
flutter doctor
Doctor summary (to see all details, run flutter doctor -v):
[✓] Flutter (Channel stable, 3.22.1, on macOS 14.5 23F79 darwin-arm64, locale en-KR)
[✓] Android toolchain - develop for Android devices (Android SDK version 34.0.0)
[!] Xcode - develop for iOS and macOS (Xcode 15.4)
    ✗ CocoaPods not installed.
        CocoaPods is used to retrieve the iOS and macOS platform side's plugin code that responds to your plugin usage on the Dart side.
        Without CocoaPods, plugins will not work on iOS or macOS.
        For more info, see https://flutter.dev/platform-plugins
      To install see https://guides.cocoapods.org/using/getting-started.html#installation for instructions.
[✓] Chrome - develop for the web
[✓] Android Studio (version 2023.3)
[✓] IntelliJ IDEA Community Edition (version 2024.1.1)
[✓] VS Code (version 1.89.1)
[✓] Connected device (3 available)
[✓] Network resources
```

#### 프로젝트 생성 후 실행 확인

- VSCode에서 Flutter 플러그인 설치
- Flutter 프로젝트 생성 후 > 디바이스 선택(macOS 추천) > Run > Run without Debugger
- 실행 확인

#### iOS 설정

```bash
$ brew install rbenv
$ rbenv install 3.3.1
$ rbenv global 3.3.1
$ ruby --version
ruby 3.3.1 (2024-04-23 revision c56cd86388) [arm64-darwin23]
$ gem install cocoapods
```
