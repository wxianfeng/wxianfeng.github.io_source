echo "generate static files\n"
hugo --theme=KeepIt --baseUrl="https://wxianfeng.github.io/"
echo "generate static files DONE\n"

echo "static files push to github\n"
cd public && git add . && git commit -m "update wxianfeng.com content" && git push
echo "static files push to github DONE\n"

echo "source code push to github\n"
cd ..
git add . && git commit -m "update wxianfeng.com source code" && git push
echo "source code push to github DONE\n"
