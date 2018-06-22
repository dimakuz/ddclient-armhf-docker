FROM arm32v7/debian:9-slim

LABEL image=dimakuz/ddclient-armhf
MAINTAINER Dima Kuznetsov "dmitrykuzn@gmail.com"

RUN \
	apt clean && \
	apt update && \
	DEBIAN_FRONTEND=noninteractive apt install -y ddclient cron && \
	rm -rf /var/lib/apt/lists/* 

ADD docker-entrypoint.sh /
ADD ddclient-sched /etc/cron.d/
ADD ddclient.conf /etc/
ENTRYPOINT /docker-entrypoint.sh
