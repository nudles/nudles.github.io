---
title: Effective Multi-modal Retrieval based on Stacked Auto-Encoders
date: 2015-05-03 15:03:58
tags: [code]
alias: 
  - code/index.html
  - code/msae/index.html
---

# Introduction

Multi-modal retrieval is emerging as a new search paradigm that enables seamless information retrieval from various types of media. For example, users can simply snap a movie poster to sear ch relevant reviews and trailers.  To solve the problem, a set of map- ping functions are learned to project high-dimensional features extracted from data of different media types into a common low- dimensional space so that metric distance measures can be ap plied.  In this paper, we propose an effective mapping mechanism bas ed on deep learning (i.e., stacked auto-encoders) for multi-modal retrieval. Mapping functions are learned by optimizing a new objective function, which captures both intra-modal and inter-modal semantic relationships of data from heterogeneous sources effectively. Compared with previous works which require a substantial amount of prior knowledge such as similarity matrices o f intra- modal data and ranking examples, our method requires little prior knowledge. Given a large training dataset, we split it into mini-batches and continually adjust the mapping functions for ea ch batch of input. Hence, our method is memory efficient with respect to the data volume. Experiments on three real datasets illustrate that our proposed method achieves significant improvement in search accuracy over the state-of-the-art methods.

# Code and Dataset

Our code is written in Python. Download it [here](https://github.com/nudles/msae)

We provide a dataset extracted from NUS-WIDE. Download it [here](/~wangwei/download/nuswide.tar.bz2)

# Training Visualization

|alpha=0 epoch 1-30 | alpha=0.01 epoch 1-30 |
|:---|:---|
|<img src="alpha000.gif"  width="200px"/> | <img src="alpha01.gif" width="200px"/> |


| alpha=0 beta=0.01 epoch 1-60 |alpha=0 beta=0.1 epoch 1-60|
|:---|:---|
| <img src="beta001.gif"  width="200px"/> | <img src="beta01.gif"  width="200px"/>|
