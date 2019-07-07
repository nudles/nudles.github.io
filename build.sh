#!/usr/bin/env bash

npm install hexo -g
npm install
npm remove hexo-generator-index
npm install hexo-deployer-rsync --save
hexo generate
hexo deploy
