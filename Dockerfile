FROM debian:12-slim

LABEL version="1.2.1"
LABEL org.opencontainers.image.source=https://github.com/nishidemasami/markdown-docs-dockerfile
LABEL org.opencontainers.image.description="Dockerfile for honkit to convert markdown files into a PDF file"

LABEL maintainer="NISHIDE, Masami <nishidemasami@gmail.com>"

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
	apt install calibre openjdk-17-jre-headless nodejs npm graphviz fonts-noto-cjk -y && \
	groupadd -g 1000 honkit && useradd -m -d /home/honkit -s /bin/bash -u 1000 -g 1000 honkit

USER honkit
RUN mkdir ~/.npm-global && \
	npm config set prefix '~/.npm-global' && \
	echo export PATH=~/.npm-global/bin:$PATH >> ~/.profile && \
	. ~/.profile && \
	npm install -g honkit gitbook-plugin-uml gitbook-plugin-hide-published-with 

WORKDIR /honkit
