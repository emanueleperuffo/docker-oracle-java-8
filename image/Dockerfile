FROM emanueleperuffo/baseimage-debian:latest
MAINTAINER Emanuele Peruffo <info@emanueleperuffo.com>

ENV HOME /root
ADD . /build

RUN /build/prepare.sh && \
	/build/services.sh && \
	/build/cleanup.sh

CMD ["/sbin/my_init"]