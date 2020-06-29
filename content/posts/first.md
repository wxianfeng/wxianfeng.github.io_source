---
title: "使用 Hugo + Github Pages 搭建静态网站"
date: 2020-03-04T00:44:35+08:00
---

## 缘起
之前有个 Blog，网址为 http://blog.wxianfeng.com ，是在 2010 年基于 Typo(Ruby On Rails) 搭建的，有个后台 admin 写文章，体验非常之不好，Markdown 支持的不好，写作体验也没有本地写起来舒服，一直想换个静态 Blog，本地写，push 到 github 上，利用 2020 新冠肺炎宅在家的时间，搭建了这个 Blog，此刻正在使用 Vscode 本地写这篇文章，体感很棒，哈哈。

## 静态博客选型
刚开始静态 Blog 选型的时候，调研了下，主要在 Ruby 写的 Jekyll，NodeJS 的 Hexo，和 Golang 的 Hugo 三个中作选择。   
最后选择的 Hugo，主要判断依赖为 Hugo 的 star 数最多，其次在 17 年学习过 Golang，一直没用在实际项目中，借此也可熟悉下练练手

## Hugo 主题选型
Hugo 还有一大优势就是主题特别多，经过比较筛选，个人想要首页是一个主页型页面，不是直接看到 Post，看到了 [KeepIt](https://github.com/Fastbyte01/KeepIt) 这个主题非常简洁美观，直接使用这个主题即可，后面如果自己有新增需求，可以给作者提 issue，或者 Fork 下来进行修改即可

## Hugo 搭建步骤
### 安装 Hugo
```bash
brew install hugo
```

我使用的版本 `v0.72.0`

### 生成站点
```bash
hugo new site /path/to/wxianfeng.github.io
```

## 安装主题
```bash
cd themes
git clone https://github.com/Fastbyte01/KeepIt.git
```

set ` config.toml` theme to KeepIt
```bash
theme = "KeepIt"
```

### 本地写文章
创建一个 About 页面
```bash
hugo new about.md
```

创建第一篇文章
```bash
hugo new posts/first.md
```

本地启动服务预览
```bash
hugo server --theme=KeepIt --buildDrafts
```

Visit `http://localhost:1313/`

本地服务是热加载的，文章修改后，不用重启，实时生效，非常方便

### 部署到 Github Pages
1. 生成静态文件
```bash
hugo --theme=KeepIt --baseUrl="https://wxianfeng.github.io/"
```

注意，以上命令不会生成草稿页面，如果未生成任何文章，请去掉文章头部的 draft=true 再重新生成，建议不要加 draft=true 

2. 在 github 建个 repo, 把 public 作为工程根目录，push 到 github ，push 后，访问 https://wxianfeng.github.io 即可

### 使用自己的域名
1. Github Repo 的 Settings 中有 Github Pages 的设置，设置好你的域名
2. 在你的域名 DNS 管理处添加 CNAME 解析到 wxianfeng.github.io

至此，你的静态 Blog 已经搭建完成，Enjoy it ~ 

> PS:  
> 本文随着该 Blog 的功能迭代升级会持续更新
