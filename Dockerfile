
FROM nginx:alpine

RUN apk add --no-cache python3 curl unzip bash

RUN mkdir -p /usr/local/bin /usr/local/etc/xray && \
    curl -fsSL https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip \
    -o /tmp/xray.zip && \
    unzip -o /tmp/xray.zip -d /tmp/xray && \
    install -m 755 /tmp/xray/xray /usr/local/bin/xray && \
    rm -rf /tmp/xray /tmp/xray.zip

COPY nginx.conf /etc/nginx/nginx.conf
COPY manager.py /manager.py
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/entrypoint.sh"]
