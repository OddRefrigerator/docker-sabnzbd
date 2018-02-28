FROM ubuntu:16.04

LABEL maintainer="Stephen.ancliffe@gmail.com"
LABEL ubuntu="16.04"
LABEl sabnzbd="2.3.2"
LABEL description="SABNZBD running on Ubuntu"

# set the locale
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

# install packages
RUN \
 echo "deb http://ppa.launchpad.net/jcfp/ppa/ubuntu xenial main" >> /etc/apt/sources.list.d/sabnzbd.list && \
 echo "deb-src http://ppa.launchpad.net/jcfp/ppa/ubuntu xenial main" >> /etc/apt/sources.list.d/sabnzbd.list && \
 echo "deb http://ppa.launchpad.net/jcfp/sab-addons/ubuntu xenial main" >> /etc/apt/sources.list.d/sabnzbd.list && \
 echo "deb-src http://ppa.launchpad.net/jcfp/sab-addons/ubuntu xenial main" >> /etc/apt/sources.list.d/sabnzbd.list && \
 apt-key adv --keyserver hkp://keyserver.ubuntu.com:11371 --recv-keys 0x98703123E0F52B2BE16D586EF13930B14BB9F05F && \
 apt-get update && \
 apt-get install -y \
	p7zip-full \
	par2-tbb \
	python-sabyenc \
	sabnzbdplus \
	unrar \
	curl \
	unzip && \

# cleanup
 apt-get clean && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# ports and volumes
EXPOSE 8080 9090
VOLUME /config /downloads /incomplete-downloads

# run SABNZBD
CMD sabnzbdplus --config-file /config --server 0.0.0.0:8080

# health check
HEALTHCHECK --interval=5s --timeout=3s \
  CMD curl -f http://127.0.0.1:8080/sabnzbd/api?mode=version || exit 1 