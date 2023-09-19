FROM debian:12

LABEL version="1.1.27"
LABEL org.opencontainers.image.source=https://github.com/nishidemasami/markdown-docs-dockerfile
LABEL org.opencontainers.image.description="Dockerfile for honkit to convert markdown files into a PDF file"

LABEL maintainer="NISHIDE, Masami <nishidemasami@gmail.com>"

RUN apt update && \
	apt install curl gnupg -y && \
	echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
	curl -fsSL https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
	apt update -y && \
	DEBIAN_FRONTEND=noninteractive apt install calibre openjdk-17-jre-headless nodejs npm google-chrome-stable git unzip xdg-utils libegl1 libopengl0 fonts-noto graphviz fonts-noto-cjk qtbase5-dev libssl-dev libxcursor-dev libxcomposite-dev libxdamage-dev libxrandr-dev libfontconfig1-dev libxss-dev libwebp-dev libjsoncpp-dev libopus-dev libminizip-dev libavutil-dev libavformat-dev libavcodec-dev libevent-dev libvpx-dev libsnappy-dev libre2-dev libprotobuf-dev protobuf-compiler -y && \
	npm install -g honkit gitbook-plugin-mermaid-newface gitbook-plugin-uml gitbook-plugin-hide-published-with

ENV CHROMIUM_FLAGS=--no-sandbox
ENV PUPPETEER_EXECUTABLE_PATH=/usr/bin/google-chrome-stable
WORKDIR /honkit
