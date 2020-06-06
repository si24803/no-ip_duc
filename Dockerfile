FROM alpine:latest

ENV INIT=
VOLUME [ "/opt/noip2/conf" ]
EXPOSE 8245

WORKDIR "/opt/noip2"
RUN apk add --update tar build-base && \
    wget -qO noip.tar.gz http://www.noip.com/client/linux/noip-duc-linux.tar.gz && \
    mkdir noip && tar -C noip --strip-components=1 -xvf ./noip.tar.gz && \
    cd noip && sed -i '/no-ip2/d' Makefile &&  make install && \
    rm -rf /var/cache/apk/* && rm ../noip.tar.gz && cd - && \
    mkdir -p /opt/noip2/conf/ 
ADD run.sh /opt/noip2/
RUN chmod +x /opt/noip2/run.sh

CMD /opt/noip2/run.sh