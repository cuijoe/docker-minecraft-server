# Minecraft 1.8.8
FROM java:7
MAINTAINER wyvernnot
RUN wget -q http://shanlinfeiniao.oss-cn-qingdao.aliyuncs.com/mc.jar
RUN apt-get install unzip
RUN wget -q http://shanlinfeiniao.oss-cn-qingdao.aliyuncs.com/world.zip
RUN unzip world.zip 

RUN apt-get -y install locales && \
RUN sed -i 's/# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/' /etc/locale.gen && \
RUN locale-gen && \
RUN update-locale LC_ALL= "zh_CN.UTF-8" && \
RUN export LANGUAGE=zh_CN && \
RUN export LANG=zh_CN.UTF-8 && \
RUN locale && \
RUN sed -i '$a \
RUN * soft nproc 65536 \
RUN * hard nproc 65536  \
RUN * soft nofile 65536  \
RUN * hard nofile 65536 ' /etc/security/limits.conf && \ 
RUN echo "Asia/Shanghai" | tee /etc/timezone && dpkg-reconfigure --frontend noninteractive tzdata
# 设置时区
ENV     TZ "PRC"
COPY . /data
WORKDIR /data
EXPOSE 25565

CMD java -Xmx512m -xx512m -jar /mc.jar
