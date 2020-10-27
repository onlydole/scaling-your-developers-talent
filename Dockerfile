FROM nginx:1.19-alpine
LABEL maintainer="Taylor Dolezal <tdolezal@hashicorp.com>"

COPY index.html  /usr/share/nginx/html/
COPY app.conf /etc/nginx/conf.d/default.conf
COPY status.conf /etc/nginx/conf.d/status.conf