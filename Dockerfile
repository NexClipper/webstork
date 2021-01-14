FROM nginx:1.19.6-alpine
#FROM alpine:latest 
#alpine:3.12.3 - 2020.12.31
LABEL maintainer="NexCloud Peter <peter@nexclipper.io>"

#### Default Setting
ENV WKDIR=/data
RUN mkdir -p $WKDIR
RUN apk add --no-cache --update curl
COPY entrypoint.sh /entrypoint.sh
COPY ./services $WKDIR/services

## KubeCTL Download ##
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl && \
    chmod +x kubectl && mv kubectl /usr/bin/

## CMD
CMD ["/bin/sh", "/entrypoint.sh"]
