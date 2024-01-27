FROM ghcr.io/linuxserver/baseimage-alpine:3.18

ARG BUILD_DATE
ARG VERSION
ARG NTFY_RELEASE
ARG NTFY_ARCH
LABEL build_version="Linuxserver.io version:- ${VERSION} Build-date:- ${BUILD_DATE}"
LABEL maintainer="N3WK1D"

# Install Dependencies
RUN \
  echo "**** install runtime packages ****" && \
  apk add --no-cache --upgrade \
    curl && \
  echo "**** install ntfy ****" && \
	mkdir -p /tmp/ntfy && \
	if [ -z ${NTFY_RELEASE+x} ]; then \
    NTFY_RELEASE=$(curl -sX GET "https://api.github.com/repos/binwiederhier/ntfy/releases/latest" | awk '/tag_name/{print $4;exit}' FS='[""]'); \
  fi && \
	if [ -z ${NTFY_ARCH+x} ]; then \
    NTFY_ARCH="ntfy_${NTFY_RELEASE/v/}_linux_amd64"; \
  fi && \
  curl -o \
    /tmp/ntfy.tar.gz -L \
    "https://github.com/binwiederhier/ntfy/releases/download/${NTFY_RELEASE}/${NTFY_ARCH}.tar.gz" && \
  tar -zxf \
    /tmp/ntfy.tar.gz -C /tmp/ntfy && \
  cp -a /tmp/ntfy/"${NTFY_ARCH}"/ntfy /usr/bin/ntfy && \
  echo "**** clean up ****" && \
  rm -rf \
	  /tmp/* && \
  echo "**** installation completed ****"

# Copy local files
COPY root/ /

# Ports and Volumes
EXPOSE 80
VOLUME /config
