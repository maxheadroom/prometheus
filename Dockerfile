FROM docker.io/bitnami/prometheus

ARG TARGETARCH

LABEL org.opencontainers.image.authors="https://falko.zurell.de/contact" \
	  org.opencontainers.image.description="Application packaged by Falko Zurell" \
	  org.opencontainers.image.licenses="Apache-2.0" \
	  org.opencontainers.image.source="https://github.com/maxheadroom/prometheus" \
	  org.opencontainers.image.title="prometheus" \
	  org.opencontainers.image.version="2.42.0"


RUN apt-get update && apt-get upgrade -y && apt-get install -y curl && \
apt-get clean && rm -rf /var/lib/apt/lists /var/cache/apt/archives

HEALTHCHECK [OPTIONS] CMD curl -f http://localhost:9090/