---
title: adb 录屏
date: 2017-10-11 17:10:53
tags:
  - Android
  - 命令
categories: Android
---
记录2个捕获屏幕的adb命令。

<!-- more -->

### 截屏
**screencap**

```bash
$ adb shell screencap -p /sdcard/screen.png
```

### 录制屏幕
**screenrecord**
录制默认分辨率，默认 4Mbps，时间为 180s 的 MP4 视频，并且保存到 sdcard 上
   
```bash
$ adb shell screenrecord /sdcard/yourFileName.mp4
$ adb pull /sdcard/yourFileName.mp4 ~/mp4File/
```

### 第三方工具
[AndroidTool](http://mac.softpedia.com/get/Utilities/AndroidTool.shtml)


