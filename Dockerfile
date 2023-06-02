FROM debian:bullseye-slim

LABEL version="1.1.8"
LABEL org.opencontainers.image.source=https://github.com/nishidemasami/markdown-docs-dockerfile
LABEL org.opencontainers.image.description="convert markdown files into a pdf file"

MAINTAINER @nishidemasami

RUN apt update -y && \
  apt install curl -y && \
  curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
  apt purge nodejs npm -y && \
  apt install nodejs -y &&  \
  apt update -y && \
  apt install gnupg -y && \
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
  curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
  apt update -y && \
  apt install openjdk-17-jdk google-chrome-stable git unzip xdg-utils libegl1 libopengl0 fonts-noto graphviz fonts-noto-cjk qtbase5-dev libssl-dev libxcursor-dev libxcomposite-dev libxdamage-dev libxrandr-dev libfontconfig1-dev libxss-dev libwebp-dev libjsoncpp-dev libopus-dev libminizip-dev libavutil-dev libavformat-dev libavcodec-dev libevent-dev libvpx-dev libsnappy-dev libre2-dev libprotobuf-dev protobuf-compiler -y && \
  npm install -g honkit && \
  wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin
