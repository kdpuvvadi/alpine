# kdpuvvadi/alpine

These are docker images based off of official Alpine images on Docker Hub.

> Based on [mbentley/alpine](https://github.com/mbentley/docker-base-alpine)

## Tags

### Supported

| Tag    | GitHub Container registry (ghcr.io)   | Latest | Docker hub              |
|--------|---------------------------------------|--------|-------------------------|
| `3.20` | `ghcr.io/kdpuvvadi/alpine:3.20`       | &check;| `kdpuvvadi/alpine:3.20` |
| `3.19` | `ghcr.io/kdpuvvadi/alpine:3.19`       |        | `kdpuvvadi/alpine:3.19` |
| `3.18` | `ghcr.io/kdpuvvadi/alpine:3.18`       |        | `kdpuvvadi/alpine:3.18` |

### End of Life

| Tag    | GitHub Container registry (ghcr.io)   | Docker hub              |
|--------|---------------------------------------|-------------------------|
| `3.17` | `ghcr.io/kdpuvvadi/alpine:3.17`       | `kdpuvvadi/alpine:3.17` |
| `3.16` | `ghcr.io/kdpuvvadi/alpine:3.16`       | `kdpuvvadi/alpine:3.16` |
| `3.15` | `ghcr.io/kdpuvvadi/alpine:3.15`       | `kdpuvvadi/alpine:3.15` |
| `3.14` | `ghcr.io/kdpuvvadi/alpine:3.14`       | `kdpuvvadi/alpine:3.14` |
| `3.13` | `ghcr.io/kdpuvvadi/alpine:3.13`       | `kdpuvvadi/alpine:3.13` |
| `3.12` | `ghcr.io/kdpuvvadi/alpine:3.12`       | `kdpuvvadi/alpine:3.12` |
| `3.11` | `ghcr.io/kdpuvvadi/alpine:3.11`       | `kdpuvvadi/alpine:3.11` |

## Additional Tools installed

- curl
- jq
- zip
- ca-certificates

## Dockerfile

```Dockerfile
ARG IMAGE_TAG="${IMAGE_TAG:-3.19}"
FROM alpine:${IMAGE_TAG} AS base
LABEL maintainer="KD Puvvadi <kd@puvvadi.me>"

# copy everything from base
FROM scratch
COPY --from=base / /

# upgrade
RUN apk --no-cache upgrade --purge
# install packages
RUN apk --no-cache add jq curl zip ca-certificates

CMD ["/bin/sh"]
```

## LICENSE
[MIT](/LICENSE)
