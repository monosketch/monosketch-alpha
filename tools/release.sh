src=$1
git config user.email "tunachauict@gmail.com"
git config user.name "Tuan Chau"

mv $src/main.css .
mv $src/MonoSketch.js .
mv $src/MonoSketch.js.map .

git add -A
git commit -m "Update from $2"
git push
