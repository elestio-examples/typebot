#!/usr/bin/env bash
sed -i '55i staticPageGenerationTimeout: 500,' apps/builder/next.config.mjs
sed -i "s~ARG SCOPE~ARG SCOPE="builder"~g" Dockerfile
#sed -i "s~RUN npm --global install turbo~RUN npm --global install turbo@1.10.9~g" Dockerfile
sed -i '22i COPY . .' Dockerfile
docker buildx build . --output type=docker,name=elestio4test/typebot-builder:latest | docker load
