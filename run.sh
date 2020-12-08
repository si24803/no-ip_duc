#!/bin/sh


if [ $INIT ] ; then
    noip2 -C -c /opt/noip2/conf/noip2.conf
else
    noip2 -c /opt/noip2/conf/noip2.conf; while pgrep noip > -; do echo "Process is running"; sleep 5; done; echo "No-ip has died"; exit 1
fi