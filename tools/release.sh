# ./release.sh <path-to-src> <commit comment>
src=$1
git config user.email "tunachauict@gmail.com"
git config user.name "Tuan Chau"

hash=$(git rev-parse --short HEAD)
dest="v1-$hash"

rm */app.js
rm */app.js.map
rm */app.css

mkdir $dest
mv $src/main.css ./$dest/app.css
mv $src/MonoSketch.js ./$dest/app.js
mv $src/MonoSketch.js.map ./$dest/app.js.map

sed -e  "s/scriptdir/$dest/g" template_index.html > index.html

git add -A
git commit -m "Update from $2"
git push
