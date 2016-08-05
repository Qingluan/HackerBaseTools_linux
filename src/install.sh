#!/bin/bash

git clone https://github.com/Qingluan/HackerBaseTools_linux.git && cd HackerBaseTools_linux/src
docker build -t hacker/tools-v0 ./
