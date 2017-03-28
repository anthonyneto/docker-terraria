FROM ubuntu

ENV TERRARIA_VERSION=1344

RUN apt-get update && \
  apt-get install -y wget unzip

RUN mkdir /src && \
  cd /src && \
  wget -O terraria.zip "http://terraria.org/server/terraria-server-${TERRARIA_VERSION}.zip" && \
  unzip terraria.zip 'Dedicated Server/Linux/*' && \
  chmod +x '/src/Dedicated Server/Linux/TerrariaServer.bin.x86_64'

ADD config.txt /config.txt.default
ADD run.sh /run.sh

VOLUME /data
EXPOSE 7777/tcp 7777/udp

CMD '/run.sh'
