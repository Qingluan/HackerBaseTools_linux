FROM ubuntu
MAINTAINER qingluan

RUN cd /etc/apt && mkdir -p ./sources.list.bak && mv sources.list ./sources.list.bak/
COPY sources.list /etc/apt/
RUN apt-get update 
 
RUN apt-get install -y curl
RUN apt-get install -y zsh
RUN apt-get install -y zip
RUN apt-get install -y ssh
RUN apt-get install -y sudo
RUN apt-get install -y language-pack-en
RUN apt-get install -y less
RUN apt-get install -y git
RUN apt-get install -y virtualenvwrapper


### setting a normal user ######
RUN mkdir -p /var/run/sshd
 
RUN echo "setting your passwd  "
RUN useradd -s /bin/zsh moriaty -p "Moriaty" -g root -G sudo -d /home/moriaty  -m
COPY passwd.ini /var/startup/init_run/passwd.ini
RUN chpasswd < /var/startup/init_run/passwd.ini

RUN mkdir -p /root/.ssh
RUN touch /root/.ssh/authorized_keys
COPY user.pub /root/.ssh/id_rsa.pub
RUN cat /root/.ssh/id_rsa.pub >> /root/.ssh/authorized_keys
RUN chsh -s /bin/zsh
 
 
RUN touch /var/startup/init_run/entry.sh 
RUN echo "#!/bin/bash" >> /var/startup/init_run/entry.sh 
RUN echo "/usr/sbin/sshd  -D   ;" >> /var/startup/init_run/entry.sh
RUN echo "tail -f /var/log/dmesg " >> /var/startup/init_run/entry.sh
RUN chmod +x /var/startup/init_run/entry.sh
 
USER moriaty

RUN mkdir -p /home/moriaty/.ssh
RUN touch /home/moriaty/.ssh/known_hosts
RUN touch /home/moriaty/.ssh/authorized_keys
COPY user.pub /home/moriaty/.ssh/id_rsa.pub
RUN cat /home/moriaty/.ssh/id_rsa.pub >> /home/moriaty/.ssh/authorized_keys
RUN chmod 755 /home/moriaty/.ssh/authorized_keys

USER root
COPY zsh.zip /root/
COPY columns /usr/local/bin/
RUN cd /root/ && unzip zsh.zip


### install Hacker Tools from ctf-tools 
# this is a github object , i use from yans@yancomm.net's project
# github address : https://github.com/zardus/ctf-tools


WORKDIR /home/moriaty/tools
RUN git clone https://github.com/Qingluan/ctf-tools.git 
WORKDIR ./ctf-tools
RUN git checkout .
RUN bin/manage-tools -s setup
 
WORKDIR /home/moriaty
RUN bash -c "source /etc/bash_completion.d/virtualenvwrapper && mkvirtualenv ctf"
RUN echo "workon ctf" >> /home/moriaty/.zshrc
RUN echo "workon ctf" >> /home/moriaty/.bashrc

EXPOSE 8080
EXPOSE 22
ENTRYPOINT /var/startup/init_run/entry.sh 
