FROM ubuntu:latest

LABEL version="1.1.3"
LABEL org.opencontainers.image.source=https://github.com/nishidemasami/markdown-docs-dockerfile

MAINTAINER @nishidemasami

RUN apt update -y && \
  apt install nodejs npm -y && \
  npm install -g npm n && \
  n 18 && \
  apt purge nodejs npm -y && \
  npm install -g honkit gitbook-plugin-katex-pro gitbook-plugin-mermaid-newface gitbook-plugin-uml && \
  apt install wget gnupg -y && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  apt update -y && \
  apt install openjdk-17-jdk nodejs npm curl google-chrome-stable git unzip xdg-utils libegl1 libopengl0 fonts-noto graphviz fonts-noto-cjk qtbase5-dev libssl-dev libxcursor-dev libxcomposite-dev libxdamage-dev libxrandr-dev libfontconfig1-dev libxss-dev libwebp-dev libjsoncpp-dev libopus-dev libminizip-dev libavutil-dev libavformat-dev libavcodec-dev libevent-dev libvpx-dev libsnappy-dev libre2-dev libprotobuf-dev protobuf-compiler -y && \
  wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin && \
  groupadd -g 1001 buildgroup && useradd -m -s /bin/bash -u 1001 -g 1001 builduser

USER builduser
