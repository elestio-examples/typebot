#!/usr/bin/env bash
docker buildx build . --output type=docker,name=elestio4test/typebot-builder:latest | docker load
docker buildx build . --output type=docker,name=elestio4test/typebot-viewer:latest | docker load
