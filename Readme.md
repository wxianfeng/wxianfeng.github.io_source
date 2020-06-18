https://wxianfeng.github.io Source Code
====

## Install
```bash
brew install hugo
```

## Develop
```bash
hugo server --theme=KeepIt --buildDrafts
```

Visit `http://localhost:1313/`

* create `About` page
```bash
hugo new about.md
```

* create post
```bash
hugo new posts/first.md
```

## Deploy
* generate static file
```bash
hugo --theme=KeepIt --baseUrl="https://wxianfeng.github.io/"
```
(注意，以上命令并不会生成草稿页面，如果未生成任何文章，请去掉文章头部的 draft=true 再重新生成。)

* push to github
```
cd public && git push
```

Visit https://wxianfeng.github.io

That's All, Enjoy ~

