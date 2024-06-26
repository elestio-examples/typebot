#!/usr/bin/env bash

sed -i "s~ARG SCOPE~ARG SCOPE="viewer"~g" Dockerfile
sed -i "s~openssl ~openssl python3 build-essential ~g" Dockerfile
# sed -i "s~5.8.0~5.12.1~g" Dockerfile
# sed -i "s~5.12.1-37.0a83d8541752d7582de2ebc1ece46519ce72a848~5.12.0-21.473ed3124229e22d881cb7addf559799debae1ab~g" Dockerfile
# sed -i "s~RUN npm --global install pnpm~RUN npm --global install pnpm@v8.15.4~g" Dockerfile
# sed -i "s~RUN npm --global install turbo~RUN npm --global install turbo@1.10.9~g" Dockerfile
docker buildx build . --output type=docker,name=elestio4test/typebot-viewer:latest | docker load
