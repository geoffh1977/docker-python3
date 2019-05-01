# Build Python 3 Container
ARG IMAGE_USER=geoffh1977
ARG IMAGE_NAME=alpine
ARG IMAGE_VERSION=latest

FROM ${IMAGE_USER}/${IMAGE_NAME}:${IMAGE_VERSION}
LABEL maintainer="geoffh1977 <geoffh1977@gmail.com>"
USER root

# Install Python 3 And Upgrade Pip 3
# hadolint ignore=DL3013,DL3018
RUN apk -U --no-cache add python3 && \
    pip3 install --upgrade --no-cache-dir pip && \
    ln -s "$(readlink -f /usr/bin/python3)" /usr/bin/python
    
USER ${ALPINE_USER}
