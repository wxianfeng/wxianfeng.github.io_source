echo "\033[32mgenerate static files\033[0m"
hugo --theme=KeepIt --baseUrl="https://wxianfeng.github.io/"
echo "\033[32mgenerate static files DONE\033[0m"

echo "\033[32mstatic files push to github\033[0m"
cd public && git add . && git commit -m "update wxianfeng.com content" && git push
echo "\033[32mstatic files push to github DONE\033[0m"

# echo "\033[32msource code push to github\033[0m"
# cd ..
# git add . && git commit -m "update wxianfeng.com source code" && git push
# echo "\033[32msource code push to github DONE\033[0m"
