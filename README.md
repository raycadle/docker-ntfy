![ntfy](https://github.com/binwiederhier/ntfy/raw/main/web/public/static/images/ntfy.png)

# ntfy.sh | Send push notifications to your phone or desktop via PUT/POST

**[ntfy](https://ntfy.sh/)** (pronounced *"notify"*) is a simple HTTP-based pub-sub notification service.

This is an unofficial Docker image built using the [LinuxServer](https://www.linuxserver.io/) team's [Alpine base-image](https://github.com/linuxserver/docker-baseimage-alpine).

## Notice
Although using both [binwiederhier's](https://github.com/binwiederhier) and [LinuxServer's](https://www.linuxserver.io/) respective works at its core, this image is not associated with — nor endorsed by — either developers in any way, shape, or form. It is simply a project for me to learn container architecture, which I chose to make public in the spirit of [FOSS](https://en.wikipedia.org/wiki/Free_and_open-source_software). All rights belong to their respective owners.

The official ntfy Docker image can be found [here](https://hub.docker.com/r/binwiederhier/ntfy) and you can support its developer [here](https://github.com/sponsors/binwiederhier) and [here](https://en.liberapay.com/ntfy/), or contribute to its development [here](https://github.com/binwiederhier/ntfy).

## Usage
To use this image, simply run the following command:
```shell
docker run -p 8080:8080 ghcr.io/raycadle/ntfy:latest
```
or
```shell
podman run -p 8080:8080 ghcr.io/raycadle/ntfy:latest
```

## Build
If you wish to build this image locally, you can do so by running the commands below.

### Clone Repo
```shell
git clone https://github.com/raycadle/docker-ntfy.git && cd docker-ntfy
```
### Build & Run
```shell
docker build --build-arg BUILD_DATE="$(date +%d/%m/%y)" --build-arg VERSION="$(date +%R:%S)" --tag ntfy:latest . && \
docker run \
  --name=ntfy \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Belize \
  -p 8080:8080 \
  -v /path/to/data:/config \
  --restart unless-stopped \
  ntfy:latest
```
