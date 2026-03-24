#!/bin/sh
set -e

sed "s/__PORT__/${PORT:-10000}/g" /etc/nginx/nginx.conf > /tmp/nginx.conf
mv /tmp/nginx.conf /etc/nginx/nginx.conf

/app/xray -config /config.json &
exec nginx -g 'daemon off;'
