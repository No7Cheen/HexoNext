---
title: Git 命令清单
date: 2017-10-10 22:40:43
tags:
  - Git
  - 命令
categories: Git
keywords:
  - Git
  - 命令
---
> 参考
> [Pro Git](http://iissnan.com/progit/) 
> [git - 简易指南](http://www.bootcss.com/p/git-guide/)
> [阮一峰的网络日志](www.ruanyifeng.com/blog/2015/12/git-cheat-sheet.html)

我们每天都在使用 Git ，但是除了 `git push` 和 `git pull` 还有多少命令是记得住的。
下面是一些常用的 Git 命令，以供参考。

<!-- more -->

### 配置信息

``` bash
# 显示Git配置
$ git config --list

# 显示Git配置 global
$ git config --list --global

# 显示Git配置 local
$ git config --list --local

# 设置提交代码的用户信息
$ git config [--global] user.name "name"
$ git config [--global] user.email "email"

# 设置当前仓库提交代码的用户信息 local
$ git config --local user.name "name]"
$ git config --local user.email "email"
```

### 创建新仓库

``` bash
# 初始化本地git仓库（创建新仓库）
$ git init

# clone远程仓库，包括这个项目的整个代码历史
$ git clone [url]
```

### 查看信息

``` bash
# 查看当前版本状态（是否修改）
$ git status

# 显示提交日志
$ git log
$ git log -5

# 显示commit历史，以及每次commit发生变更的文件
$ git log --stat

# 搜索commit历史
$ git log -S [keyword]

# 显示某个文件的版本历史，包括文件改名
$ git log --follow [file]
$ git whatchanged [file]

# 显示指定文件相关的每一次diff
$ git log -p [file]

# 显示过去n次提交
$ git log -5 --pretty --oneline

# 显示v2.0的日志
$ git log v2.0

# 显示所有提交过的用户，按提交次数排序
$ git shortlog -sn

# 显示暂存区和工作区的差异
$ git diff

# 显示暂存区和上一个commit的差异
$ git diff --cached
$ git diff --cached [file]

# 比较与上一个版本的差异
$ git diff HEAD^

# 比较与HEAD版本lib目录的差异
$ git diff HEAD -- ./lib

# 比较远程分支master上有本地分支master上没有的
$ git diff origin/master..master

# 只显示差异的文件，不显示具体内容
$ git diff origin/master..master --stat

# 显示今天你写了多少行代码
$ git diff --shortstat "@{0 day ago}"

# 显示某个提交的详细内容(可只用commitid的前几位)
$ git show [commit]
$ git show dfb02e6e4f2f7b573337763e5c0013802e392818
$ git show dfb02

# 显示某次提交发生变化的文件
$ git show --name-only [commit]

# 显示某次提交时，某个文件的内容
$ git show [commit]:[filename]

# 显示HEAD提交日志
$ git show HEAD

# 显示HEAD的父（上一个版本）的提交日志 ^^为上两个版本 ^5为上5个版本
$ git show HEAD^

# 显示v2.0的日志及详细内容
$ git show v2.0

# 显示已存在的tag
$ git tag

# 显示当前分支的最近几次提交
$ git reflog
```

### 增加/删除

``` bash
# 添加指定文件到暂存区
$ git add [file1] [file2] ...

# 添加指定目录到暂存区，包括子目录
$ git add [dir]

# 添加当前目录的所有更改过的文件到暂存区
$ git add .

# 添加每个变化前，都会要求确认
# 对于同一个文件的多处变化，可以实现分次提交
$ git add -p

# 删除工作区文件，并且将这次删除放入暂存区
$ git rm [file1] [file2] ...

# 递归删除
$ git rm -r *

# 停止追踪指定文件，但该文件会保留在工作区
$ git rm --cached [file]

# 改名文件，并且将这个改名放入暂存区
$ git mv [file-original] [file-renamed]
```

### 代码提交

``` bash
# 提交暂存区到仓库区
$ git commit [file1] [file2] ... -m '[message]'

# 合并上一次提交（用于反复修改）
# 如果代码没有任何新变化，则用来改写上一次commit的提交信息
$ git commit --amend -m 'message'

# 将add和commit合为一步
$ git commit -am 'message' 

# 重做上一次commit，并包括指定文件的新变化
$ git commit --amend [file1] [file2] ...

# 提交时显示所有diff信息
$ git commit -v
```

### 撤销

``` bash
# 恢复暂存区的指定文件到工作区
$ git checkout [file]
$ git checkout .

# 恢复某个commit的指定文件到暂存区和工作区
$ git checkout [commit] [file]

# 重置暂存区的指定文件，与上一次commit保持一致，但工作区不变
$ git reset [file]

# 重置暂存区与工作区，与上一次commit保持一致
$ git reset --hard

# 撤销提交dfb02e6e4f2f7b573337763e5c0013802e392818
$ git revert [commit]
$ git revert dfb02e6e4f2f7b573337763e5c0013802e392818

# 暂时将未提交的变化移除，稍后再移入
$ git stash
$ git stash pop
```

### 远程同步

``` bash
# 获取所有远程分支（不更新本地分支，另需merge）
$ git fetch

# 获取所有原创分支并清除服务器上已删掉的分支
$ git fetch --prune

# 显示所有远程仓库
$ git remote -v

# 显示某个远程仓库的信息
$ git remote show [remote]

# 增加一个新的远程仓库，并命名
$ git remote add [shortname] [url]

# 获取远程分支master并merge到当前分支
$ git pull origin master

# 取回远程仓库的变化，并与本地分支合并
$ git pull [remote] [branch]
$ git pull origin dev

# 上传本地指定分支到远程仓库
$ git push [remote] [branch]
$ git push origin master
$ git push origin devV1.81
$ git push orgin devV1.81:devV1.81

# 删除远程仓库的hotfixes/BJVEP933分支
$ git push origin :hotfixes/BJVEP933

# 强行推送当前分支到远程仓库，即使有冲突
$ git push [remote] --force

# 推送所有分支到远程仓库
$ git push [remote] --all

# 把所有tag推送到远程仓库
$ git push --tags
```

### 分支

``` bash
# 显示本地分支
# 显示远程分支
# 显示所有本地和远程分支
$ git branch
$ git branch -r
$ git branch -a

# 显示包含提交50089的分支
$ git branch --contains 50089

# 显示所有已合并到当前分支的分支
$ git branch --merged

# 显示所有未合并到当前分支的分支
$ git branch --no-merged

# 新建分支，但依然停留在当前分支
$ git branch [branch-name]

# 新建分支，并切换到该分支
$ git checkout -b [branch]

# 切换到指定分支
$ git checkout [branch-name]

# 切换到上一个分支
$ git checkout -

# 合并指定分支到当前分支
$ git merge [branch]

# 合并远程master分支至当前分支
$ git merge origin/master

# 删除分支
$ git branch -d [branch-name]

# 删除远程分支
$ git push origin --delete [branch-name]
$ git branch -dr [remote/branch]

# 合并分支到master
$ git checkout master
$ git merge --no-ff branch-name
$ git push orgin master
```

### 标签

``` bash
# 列出所有tag
$ git tag

# 新建一个tag在当前commit
$ git tag [tag]

# 新建一个tag在指定commit
$ git tag [tag] [commit]

# 删除本地tag
$ git tag -d [tag]

# 删除远程tag
$ git push origin :refs/tags/[tagName]

# 查看tag信息
$ git show [tag]

# 提交指定tag
$ git push [remote] [tag]

# 提交所有tag
$ git push [remote] --tags

# 新建一个分支，指向某个tag
$ git checkout -b [branch] [tag]
```


