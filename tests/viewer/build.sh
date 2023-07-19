#!/usr/bin/env bash

sed -i "s~ARG SCOPE~ARG SCOPE="viewer"~g" Dockerfile
docker buildx build . --output type=docker,name=elestio4test/typebot-viewer:latest | docker load
