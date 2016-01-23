FROM debian:sid

RUN apt-get update \
 && apt-get install -y git build-essential wget \
 && apt-get clean

COPY loader /loader

ENTRYPOINT ["/loader"]
