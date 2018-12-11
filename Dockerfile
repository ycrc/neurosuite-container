FROM ubuntu:14.04

LABEL Maintainer="Ben Evans b.evans@yale.edu"
LABEL Software=Neurosuite
LABEL Homepage=http://neurosuite.sourceforge.net/

RUN apt-get update && \
    apt-get -y install wget build-essential libqtwebkit4 libqtwebkit4 libqtwebkit4 libqt4-xml libqt4-network

RUN packages="libklustersshared_2.0.0 klusters_2.0.1 neuroscope_2.0.0 ndmanager_2.0.0" && \
    psuffix="-trusty_amd64.deb" && \
    for package in $packages; \
    do wget --quiet http://sourceforge.net/projects/neurosuite/files/ubuntu/${package}${psuffix}/download -O /tmp/${package}${psuffix} && \
        dpkg --force-depends -i /tmp/${package}${psuffix} && \
        apt-get -yf install && \
        rm /tmp/${package}${psuffix}; done

 # because naming schemes were meant to be broken!
 RUN wget --quiet http://sourceforge.net/projects/neurosuite/files/ubuntu/ndmanager-plugins_1.4.14-trusty_amd64.deb/download -O /tmp/ndmanager-plugins_1.4.14-trusty_amd64.deb && \
     dpkg --force-depends -i /tmp/ndmanager-plugins_1.4.14-trusty_amd64.deb && \
     apt-get -yf install && \
     rm /tmp/ndmanager-plugins_1.4.14-trusty_amd64.deb

 RUN wget --quiet http://sourceforge.net/projects/neurosuite/files/ubuntu/nphys-data_2.0.0-trusty_all.deb/download -O /tmp/nphys-data_2.0.0-trusty_all.deb && \
     dpkg --force-depends -i /tmp/nphys-data_2.0.0-trusty_all.deb && \
     apt-get -yf install && \
     rm /tmp/nphys-data_2.0.0-trusty_all.deb
