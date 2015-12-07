# Minecraft 1.8.8
FROM java:7
MAINTAINER wyvernnot
RUN wget -q http://shanlinfeiniao.oss-cn-qingdao.aliyuncs.com/mc.jar
RUN wget -q http://shanlinfeiniao.oss-cn-qingdao.aliyuncs.com/world.zip
unzip world.zip 
COPY . /data
WORKDIR /data
EXPOSE 25565
CMD java -jar /mc.jar
