FROM alpine:3.20

RUN apk add --no-cache curl unzip nginx

RUN curl -L -o /tmp/xray.zip https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    && unzip /tmp/xray.zip -d /app \
    && chmod +x /app/xray \
    && rm -f /tmp/xray.zip

COPY nginx.conf /etc/nginx/nginx.conf
COPY config.json /config.json
COPY start.sh /start.sh
RUN chmod +x /start.sh

EXPOSE 10000

CMD ["/start.sh"]
