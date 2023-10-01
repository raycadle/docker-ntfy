# Docker Ntfy

[Ntfy](https://ntfy.sh/) A free and open source notification service.

This is a Ntfy Docker image built on top of linuxserver.io's `baseimage-alpine:3.18` image, but is not supported by linuxserver.io.

## The official docker image can be found at https://hub.docker.com/r/binwiederhier/ntfy

## Usage

This image must be built and ran with the docker/podman cli.

### Docker CLI
```
docker build -t ntfy:latest . && \
docker create \
  --name=ntfy \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Europe/London \
  -p 8080:8080 \
  -v path_to_data:/config \
  --restart unless-stopped \
  ntfy:latest
```
