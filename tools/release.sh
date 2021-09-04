# ./release.sh <path-to-src> <commit comment>
src=$1
git config user.email "tunachauict@gmail.com"
git config user.name "Tuan Chau"

hash=$(git rev-parse --short HEAD)
dest="v1-$hash"

find . -name MonoSketch.js | xargs git rm --cached
find . -name MonoSketch.js.map | xargs git rm --cached
find . -name main.css | xargs git rm --cached

mkdir $dest
mv $src/main.css ./$dest/
mv $src/MonoSketch.js ./$dest/
mv $src/MonoSketch.js.map ./$dest/

sed -e  "s/scriptdir/$dest/g" template_index.html > index.html

git add -A
git commit -m "Update from $2"
git push
