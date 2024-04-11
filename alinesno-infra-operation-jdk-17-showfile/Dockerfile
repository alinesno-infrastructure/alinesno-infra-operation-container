FROM ubuntu:20.04

MAINTAINER luoxiaodong "luoandon@gmail.com"

# 内置一些常用的中文字体，避免普遍性乱码
COPY fonts/* /usr/share/fonts/chinese/

RUN apt-get clean && apt-get update
RUN	sed -i 's/http:\/\/archive.ubuntu.com/https:\/\/mirrors.aliyun.com/g' /etc/apt/sources.list
RUN	sed -i 's/# deb/deb/g' /etc/apt/sources.list
RUN	apt-get install -y --reinstall ca-certificates
RUN	apt-get clean && apt-get update
RUN	apt-get install -y locales language-pack-zh-hans
RUN	localedef -i zh_CN -c -f UTF-8 -A /usr/share/locale/locale.alias zh_CN.UTF-8 && locale-gen zh_CN.UTF-8

RUN export DEBIAN_FRONTEND=noninteractive
RUN	apt-get install -y tzdata && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN	apt-get install -y fontconfig ttf-mscorefonts-installer ttf-wqy-microhei ttf-wqy-zenhei xfonts-wqy
RUN	apt-get install -y wget
RUN cd /tmp
RUN	wget -P /tmp https://mirrors.huaweicloud.com/openjdk/17/openjdk-17_linux-x64_bin.tar.gz
RUN	tar -zxvf /tmp/openjdk-17_linux-x64_bin.tar.gz -C /tmp  && mv /tmp/jdk-17 /usr/local/

# 安装 libreoffice
RUN apt-get install -y libxrender1 libxinerama1 libxt6 libxext-dev libfreetype6-dev libcairo2 libcups2 libx11-xcb1 libnss3

RUN cd /tmp && wget https://downloadarchive.documentfoundation.org/libreoffice/old/7.5.3.2/deb/x86_64/LibreOffice_7.5.3.2_Linux_x86-64_deb.tar.gz
RUN cd /tmp/ && tar -zxvf LibreOffice_7.5.3.2_Linux_x86-64_deb.tar.gz && cd /tmp/LibreOffice_7.5.3.2_Linux_x86-64_deb/DEBS && dpkg -i *.deb

#  清理临时文件
RUN	rm -rf /tmp/* && rm -rf /var/lib/apt/lists/*
RUN cd /usr/share/fonts/chinese
RUN mkfontscale
RUN mkfontdir
RUN fc-cache -fv

ENV JAVA_HOME /usr/local/jdk-17
ENV CLASSPATH $JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
ENV PATH $PATH:$JAVA_HOME/bin
ENV LANG zh_CN.UTF-8
ENV LC_ALL zh_CN.UTF-8
CMD ["/bin/bash"]
