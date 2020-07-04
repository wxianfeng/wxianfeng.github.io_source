http://wxianfeng.com Source Code
====
http://wxianfeng.com is CNAME to https://wxianfeng.github.io

## Install Hugo
```bash
brew install hugo
```

## Start Local Blog
```bash
hugo server --theme=KeepIt --buildDrafts
```

## Deploy to Github Pages
* generate static file
```bash
hugo --theme=KeepIt --baseUrl="https://wxianfeng.github.io/"
```

* push to github
```
cd public && git add . && git commit -m "update" && git push
```

Visit https://wxianfeng.github.io

或者使用封装好的脚本

```bash
./bin/deploy.sh
```

That's All, Enjoy ~

## 其他 tips
* 如果你想了解本站点是如何建出来的，请参考如下文章
   - [使用 Hugo + Github Pages 搭建静态网站](http://wxianfeng.com/2020/hugo-github-page/)
   - [Readme_Hugo](https://github.com/wxianfeng/wxianfeng.github.io_source/blob/master/Readme_Hugo.md)
