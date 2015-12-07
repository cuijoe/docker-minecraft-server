# Minecraft 1.8.8
FROM java:7
MAINTAINER wyvernnot
RUN wget -q http://shanlinfeiniao.oss-cn-qingdao.aliyuncs.com/mc.jar
RUN apt-get install unzip
RUN wget -q http://shanlinfeiniao.oss-cn-qingdao.aliyuncs.com/world.zip
RUN unzip world.zip 
COPY . /data
WORKDIR /data
EXPOSE 25565
RUN     apt-get -y install locales && \
        sed -i 's/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/' /etc/locale.gen && \
        locale-gen && \
        update-locale LC_ALL= "zh_CN.UTF-8" && \
        export LANGUAGE=zh_CN && \
        export LANG=zh_CN.UTF-8 && \
        locale && \
        sed -i '$a \
        * soft nproc 65536 \
        * hard nproc 65536  \
        * soft nofile 65536  \
        * hard nofile 65536 ' /etc/security/limits.conf && \ 
        echo "Asia/Shanghai" | tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata
# 设置时区
ENV     TZ "PRC"

CMD java -Xmx512m -xx512m -jar /mc.jar
