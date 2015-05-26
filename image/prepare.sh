#!/bin/bash
set -e
source /build/buildconfig
set -x

## Temporarily disable dpkg fsync to make building faster.
if [[ ! -e /etc/dpkg/dpkg.cfg.d/docker-apt-speedup ]]; then
	echo force-unsafe-io > /etc/dpkg/dpkg.cfg.d/docker-apt-speedup
fi

export INITRD=no

# Adding oracle JDK from Ubuntu repositories
echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" >> /etc/apt/sources.list
apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886

# Adding sbt repository
echo "deb http://dl.bintray.com/sbt/debian /" >> /etc/apt/sources.list

# Update repos
apt-get update

## Upgrade all packages.
apt-get dist-upgrade -y --no-install-recommends

if [ -d /build/runit ]; then
	chmod +x /build/runit/*
fi

if [ -d /build/bin ]; then
	chmod +x /build/bin/*
fi

chmod +x /build/*.sh