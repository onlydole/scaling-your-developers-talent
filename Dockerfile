FROM nginx:1.19-alpine@sha256:5aa44b407756b274a600c7399418bdfb1d02c33317ae27fd5e8a333afb115db1
LABEL maintainer="Taylor Dolezal <tdolezal@hashicorp.com>"

COPY index.html  /usr/share/nginx/html/
COPY app.conf /etc/nginx/conf.d/default.conf
COPY status.conf /etc/nginx/conf.d/status.conf