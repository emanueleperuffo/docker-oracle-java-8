#!/bin/bash
set -e
source /build/buildconfig
set -x

# Accepting Oracle JDK License
echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections

## Installing Java 8 and setting it as the default
$minimal_apt_get_install oracle-java8-installer oracle-java8-set-default

## Installing sbt
$minimal_apt_get_install --force-yes sbt