## README

> 交流学习用，如出现任何违法乱纪事情，后果自负

> 中间大部分工具直接食用自 
>> https://github.com/zardus/ctf-tools.git

## Install

* start-direct

```sh
# download and clone project
~ git clone https://github.com/Qingluan/HackerBaseTools_linux.git && cd HackerBaseTools_linux/src 
# generate your own pub key
~ ssh-keygen -t rsa -P ''  && cp ~/.ssh/id_rsa.pub ./user.pub

~ docker build -t images_name ./
# run is very easy just

~ docker run -dp 4399:22 images_name 
# this will startup a container in background.
# then you  just can run a ssh connection

~ ssh -p 4399 root@xxx.xxx.xx

```

* use my script

```sh
#install
~ ./install.sh
#start 
~ ./start_tools.sh
#stop 
~ ./stop.sh
```


