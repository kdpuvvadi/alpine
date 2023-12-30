ARG IMAGE_TAG="${IMAGE_TAG:-3.19}"
FROM alpine:${IMAGE_TAG} AS base
LABEL maintainer="KD Puvvadi <kd@puvvadi.me>"

# copy everything from base
FROM scratch
COPY --from=base / /

# upgrade
RUN apk --no-cache upgrade --purge
# install packages
RUN apk --no-cache add jq curl

CMD ["/bin/sh"]
