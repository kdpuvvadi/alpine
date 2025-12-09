ARG IMAGE_TAG="${IMAGE_TAG:-3.23}"
FROM alpine:${IMAGE_TAG} AS base

# upgrade
RUN apk --no-cache upgrade --purge
# install packages
RUN apk --no-cache add jq curl zip ca-certificates
RUN update-ca-certificates
# copy everything from base
FROM scratch
COPY --from=base / /

# labels
LABEL org.opencontainers.image.title="alpine"
LABEL org.opencontainers.image.authors="KD Puvvadi <kd@puvvadi.me>"
LABEL org.opencontainers.image.source="https://github.com/kdpuvvadi/alpine"
LABEL org.opencontainers.image.description="Alpine Linux docker images based off of official Alpine images on Docker Hub"
LABEL org.opencontainers.image.licenses="MIT"
LABEL org.opencontainers.image.version=${IMAGE_TAG}

CMD ["/bin/sh"]
