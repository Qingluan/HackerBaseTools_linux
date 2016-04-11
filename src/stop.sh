#!/bin/bash

docker ps -a | grep "hacker/tool-v0" | awk '{print $3}'| xargs docker rm -f 
