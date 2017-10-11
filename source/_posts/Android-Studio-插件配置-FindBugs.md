---
title: 'Android Studio 插件配置: FindBugs'
date: 2017-10-11 16:15:53
tags: 
  - 工具
  - Android Studio
categories: Android Studio
---
FindBugs 是一个静态分析工具，它检查类或者 JAR 文件，将字节码与一组缺陷模式进行对比来发现可能的问题，可以以独立的JAR包形式运行，也可以作为集成开发工具的插件形式存在。

<!-- more -->

### 安装FindBugs插件
首先需要在 Android Studio 中安装 FindBugs 的插件。在 Android Studio 中找到 Preferences/Plugins 选项，在该复选框中通过上方搜索，或将 FindBugs 插件下载到本地，使用 Install plugin from disk 进行安装。安装示意图如下所示，安装完成后需要重启 Android Studio。
{% asset_img 15060543025331.jpg %}

### 扩展优化
#### 安装 Android Code Arbiter 插件
FindBugs 插件具有着极强的可扩展性，只需要将扩展的JAR包导入 FindBugs 插件，重启，即可完成相关功能的扩展。

FindBugs 插件安装后，将会在 **Preferences/Other Settings** 中找到安装插件的选项 FindBugs-IDEA，点击中测靠左的 + 号，在弹出的选框中选择 **4.Install plugin from disk**，在弹出的选框中选择下载的Android Code Arbiter 的 jar 包，点击 OK，此时会发现插件已经安装了，点击 OK，并重启 Android Studio完成插件安装。

安装部分示意图，如下所示。
{% asset_img 15060539937693.jpg %}

#### 添加过滤
在没有进行任何过滤的情况下找到的结果可能会令人失望，它会把自动生成的代码也考虑在内。因此我们在进行 Bug 查找的时候首先需要添加过滤

下面是过滤掉 Android 自动生成的代码的配置文件 findbugs-exclude.xml

``` xml
<?xml version="1.0" encoding="UTF-8"?>
<FindBugsFilter>
    <Match>
        <!-- ignore all issues in resource generation -->
        <Class name="~.*\.R\$.*"/>
    </Match>

    <Match>
        <Class name="~.*\.Manifest\$.*"/>
    </Match>

    <!--
    <Match>
        <Or>
            <Class name="~.*\.R\$.*"/>
            <Class name="~.*\.Manifest\$.*"/>
        </Or>
    </Match>
    -->

    <!-- 测试用例警告 -->
    <Match>
        <Class name="~.*\.*Test"/>
        <Not>
            <Bug code="IJU"/> <!-- 'IJU' is the code for bugs related to JUnit test code -->
        </Not>
    </Match>
</FindBugsFilter>
```

添加过滤文件，如下示意图
{% asset_img 15060540989255.jpg %}


