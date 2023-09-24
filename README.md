# markdown-docs-dockerfile
The docker container for build pdf from Honkit files.

You can pull container from `ghcr.io/nishidemasami/markdown-docs:v1.2.1` or you can choose `nishidemasami/markdown-docs:v1.2.1` if you want to use Docker Hub.

# Install from the command line
```
docker pull ghcr.io/nishidemasami/markdown-docs:v1.2.1
```

# How to build PDF file
```bash
docker run --rm -v .:/honkit ghcr.io/nishidemasami/markdown-docs:v1.2.1 npx honkit pdf ./ ./output.pdf
```

# How to build PDF file and HTML files
```bash
docker run --rm -v .:/honkit ghcr.io/nishidemasami/markdown-docs:v1.2.1 /bin/sh -c "npx honkit build && npx honkit pdf ./ ./output.pdf"
```

# If you want to install npm modules yourself
```bash
docker run --rm -v .:/honkit ghcr.io/nishidemasami/markdown-docs:v1.2.1 /bin/sh -c "npm install && npx honkit pdf ./ ./output.pdf"
```
