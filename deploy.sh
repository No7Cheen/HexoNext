hexo clean
hexo generate
cp -R public/* deployHub/RogersCj.github.io
cd deployHub/RogersCj.github.io
git add .
git commit -m "update"
git push origin master
cd ..
cd ..