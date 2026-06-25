FROM debian:13-slim

# --- Metadata ---
LABEL org.opencontainers.image.title="honkit-docs"
LABEL org.opencontainers.image.version="1.2.3"
LABEL org.opencontainers.image.source="https://github.com/nishidemasami/markdown-docs-dockerfile"

# --- Environment ---
ENV DEBIAN_FRONTEND=noninteractive \
	NPM_CONFIG_PREFIX=/usr/local \
	PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
	PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

# --- System dependencies ---
RUN apt-get update \
	&& apt-get install -y --no-install-recommends \
	calibre \
	nodejs npm \
	chromium \
	git unzip xdg-utils \
	libegl1 libopengl0 \
	&& rm -rf /var/lib/apt/lists/*

WORKDIR /honkit

# --- Install global packages ---
RUN npm install -g \
	honkit \
	gitbook-plugin-uml \
	gitbook-plugin-katex-pro \
	honkit-plugin-prism \
	highlight.js \
	gitbook-plugin-hide-published-with \
	gitbook-plugin-intopic-toc \
	gitbook-plugin-sunlight-highlighter \
	gitbook-plugin-hints \
	gitbook-plugin-atoc \
	gitbook-plugin-advanced-emoji \
	gitbook-plugin-collapsible-chapters \
	honkit-plugin-plantuml-server && \
	npm cache clean --force && \
	chmod 1777 /usr/local/lib/node_modules/honkit/node_modules/flat-cache/
