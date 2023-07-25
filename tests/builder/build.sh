#!/usr/bin/env bash
sed -i "s~ARG SCOPE~ARG SCOPE="builder"~g" Dockerfile
sed -i "s~RUN npm --global install turbo~RUN npm --global install turbo@1.10.9~g" Dockerfile
docker buildx build . --output type=docker,name=elestio4test/typebot-builder:latest | docker load
