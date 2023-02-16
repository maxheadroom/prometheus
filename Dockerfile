FROM docker.io/bitnami/prometheus

ARG TARGETARCH

LABEL org.opencontainers.image.authors="https://falko.zurell.de/contact" \
	  org.opencontainers.image.description="Application packaged by Falko Zurell" \
	  org.opencontainers.image.licenses="Apache-2.0" \
	  org.opencontainers.image.source="https://github.com/maxheadroom/prometheus" \
	  org.opencontainers.image.title="prometheus" \
	  org.opencontainers.image.version="2.42.0"
USER root
RUN mkdir -p /var/lib/apt/lists/partial
RUN mkdir -p /var/cache/apt/archives
RUN apt-get update 
RUN apt-get upgrade -y 
RUN apt-get install -y curl 
RUN apt-get clean 
RUN rm -rf /var/lib/apt/lists /var/cache/apt/archives

HEALTHCHECK CMD curl -f http://localhost:9090/