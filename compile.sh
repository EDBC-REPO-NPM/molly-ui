#!/bin/bash

echo 'building bundle.js (UIkit)'

browserify -t [ babelify --presets [@babel/preset-env] ] ./bundle/js/1-main.js > ./bundle/minify.js
minify ./bundle/minify.js > ./bundle/bundle.js

echo 'building bundle.css (UIkit)'

for i in `ls ./bundle/css | grep -e '.css$'`; do
    cat ./bundle/css/$i >> ./bundle/concat.css
done

glunt ./bundle/concat.css > ./bundle/minify.css
minify ./bundle/minify.css > ./bundle/bundle.css

echo 'removing trash files'

rm -R ./bundle/minify.js ./bundle/minify.css ./bundle/concat.css 
