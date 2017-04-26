#!/usr/bin/env bash

npm install hexo -g
npm install
npm remove hexo-generator-index
hexo generate
hexo deploy
