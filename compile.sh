#!/bin/bash

echo 'building mollyUI.js'

node ./compiler/jsBundle.js > ./bundle/compiled.js
browserify -t [ babelify ] ./bundle/compiled.js > ./bundle/minify.js
minify ./bundle/minify.js > ./bundle/bundle.js
rm -R ./bundle/minify.js ./bundle/compiled.js

echo 'building mollyUI.css'

node ./compiler/cssBundle.js > ./bundle/minify.css
minify ./bundle/minify.css > ./bundle/bundle.css
rm -R ./bundle/minify.css
