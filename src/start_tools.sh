#!/bin/bash

IMAGES="$( docker images | grep hacker | awk '{ print $1}' | xargs)"
if [[ IMAGES != "" ]];
then
				cainer_id="$(docker run -dp 4399:22  $IMAGES)";
				echo "start in container id : $cainer_id";
else
				echo "no such image build : hacker/tool-v0" 
fi
	
