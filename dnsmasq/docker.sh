#!/bin/bash
docker run \
	--name dnsmasq \
	-d \
	-p 53:53/udp \
	-p 5380:8080 \
	-v $PWD/dnsmasq.conf:/etc/dnsmasq.conf \
	--log-opt "max-size=100m" \
	-e "HTTP_USER=foo" \
	-e "HTTP_PASS=bar" \
	--restart always \
	micedwards/dnsmasq-gui:arm7
