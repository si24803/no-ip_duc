FROM alpine:latest

RUN apk add --update tar build-base && \
    wget -qO noip.tar.gz http://www.noip.com/client/linux/noip-duc-linux.tar.gz && \
    mkdir noip && tar -C noip --strip-components=1 -xvf ./noip.tar.gz && \
    cd noip && sed -i '/no-ip2/d' Makefile &&  make install && \
    rm -rf /var/cache/apk/* && rm ../noip.tar.gz && \
    mkdir -p /opt/noip2/conf/

VOLUME [ "/opt/noip2/conf" ]
EXPOSE 8245

CMD noip2 -c /opt/noip2/conf/noip2.conf; while pgrep noip > -; do echo "Process is running"; sleep 5; done; echo "No-ip has died"; exit 1