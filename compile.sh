#!/bin/bash

echo 'building mollyUI.js'

browserify -t [ babelify --presets [@babel/preset-env] ] ./bundle/js/1-main.js > ./bundle/minify.js
minify ./bundle/minify.js > ./bundle/bundle.js
rm -R ./bundle/minify.js

echo 'building mollyUI.css'

node ./compiler/cssBundle.js > ./bundle/minify.css
minify ./bundle/minify.css > ./bundle/bundle.css
rm -R ./bundle/minify.css
