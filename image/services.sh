#!/bin/bash
set -e
source /build/buildconfig
set -x

# Accepting Oracle JDK License
echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections

## Installing Postgres
$minimal_apt_get_install postgresql-${PG_MAJOR} postgresql-contrib-${PG_MAJOR} postgis-${POSTGIS_VERSION}
