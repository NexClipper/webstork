FROM nginx:1.19.6-alpine
LABEL maintainer="NexCloud Peter <peter@nexclipper.io>"

ENV WKDIR=/data
#RUN rm -rf /etc/nginx
RUN apk add --no-cache --update curl apache2-utils
COPY ./nginx /etc/nginx
#CMD ["nginx", "-g", "daemon off;"]
