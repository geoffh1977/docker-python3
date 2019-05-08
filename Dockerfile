# Build Python 3 Container
FROM geoffh1977/alpine:latest
LABEL maintainer="geoffh1977 <geoffh1977@gmail.com>"
USER root

# Install Python 3 And Upgrade Pip 3
# hadolint ignore=DL3013,DL3018
RUN apk -U --no-cache add python3 && \
    pip3 install --upgrade --no-cache-dir pip && \
    ln -s "$(readlink -f /usr/bin/python3)" /usr/bin/python
    
USER ${ALPINE_USER}
