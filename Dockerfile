FROM debian:12

LABEL version="1.1.33"
LABEL org.opencontainers.image.source=https://github.com/nishidemasami/markdown-docs-dockerfile
LABEL org.opencontainers.image.description="Dockerfile for honkit to convert markdown files into a PDF file"

LABEL maintainer="NISHIDE, Masami <nishidemasami@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update -y
RUN	apt install curl gnupg -y

RUN	echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list
RUN	curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN	apt update -y
RUN	apt install calibre openjdk-17-jre-headless nodejs npm google-chrome-stable git unzip xdg-utils libegl1 libopengl0 fonts-noto graphviz fonts-noto-cjk qtbase5-dev libssl-dev libxcursor-dev libxcomposite-dev libxdamage-dev libxrandr-dev libfontconfig1-dev libxss-dev libwebp-dev libjsoncpp-dev libopus-dev libminizip-dev libavutil-dev libavformat-dev libavcodec-dev libevent-dev libvpx-dev libsnappy-dev libre2-dev libprotobuf-dev protobuf-compiler -y
RUN	groupadd -g 1000 honkit && useradd -m -d /home/honkit -s /bin/bash -u 1000 -g 1000 honkit

USER honkit
RUN mkdir ~/.npm-global && \
	npm config set prefix '~/.npm-global' && \
	echo export PATH=~/.npm-global/bin:$PATH >> ~/.profile && \
	. ~/.profile && \
	npm install -g honkit gitbook-plugin-mermaid-newface gitbook-plugin-uml gitbook-plugin-katex-pro

ENV CHROMIUM_FLAGS=--no-sandbox
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser
WORKDIR /honkit
