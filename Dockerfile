FROM ubuntu:22.04

LABEL version="1.1.22"
LABEL org.opencontainers.image.source=https://github.com/nishidemasami/markdown-docs-dockerfile
LABEL org.opencontainers.image.description="Dockerfile for honkit to convert markdown files into a PDF file"

LABEL maintainer="NISHIDE, Masami <nishidemasami@gmail.com>"

RUN apt update -y && \
	apt install curl -y && \
	curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
	apt purge nodejs npm -y && \
	apt install openjdk-17-jre-headless nodejs gnupg -y && \
	echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
	curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
	apt update -y && \
	apt install google-chrome-stable git unzip xdg-utils libegl1 libopengl0 fonts-noto graphviz fonts-noto-cjk qtbase5-dev libssl-dev libxcursor-dev libxcomposite-dev libxdamage-dev libxrandr-dev libfontconfig1-dev libxss-dev libwebp-dev libjsoncpp-dev libopus-dev libminizip-dev libavutil-dev libavformat-dev libavcodec-dev libevent-dev libvpx-dev libsnappy-dev libre2-dev libprotobuf-dev protobuf-compiler -y && \
	wget -nv -O- https://download.calibre-ebook.com/linux-installer.sh | sh /dev/stdin && \
	groupadd -g 1000 runner && useradd -m -s /bin/bash -u 1000 -g 1000 runner && \
  gpasswd -a runner sudo

USER runner
