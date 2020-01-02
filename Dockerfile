FROM ubuntu:18.04

RUN ["apt-get", "update", "-qq"]
RUN ["apt-get", "install", "-qq", "git-lfs", "perl"]

RUN ["apt-get", "install", "-qq", "build-essential", "automake", "libtool", "bison"]
RUN ["apt-get", "install", "-qq", "libz-dev", "libjpeg-dev", "libpng-dev", "libtiff-dev", \
    "liblcms2-dev", "flex", "libx11-dev", "freeglut3-dev", \
    "libxmu-dev", "libxi-dev", "libqt4-dev", "imagemagick", "gnuplot"]

RUN ["rm", "/bin/sh"]
RUN ["ln", "-s", "/bin/bash", "/bin/sh"]

# use HTTPS instead of SSH for git clone
RUN ["git", "config", "--global", "url.https://github.com/.insteadOf", "git@github.com:"]

COPY . /opt/CIVET
WORKDIR /opt/CIVET
RUN ["git", "lfs", "pull"]

# copy configuration so installation can be non-interactive
RUN ["mkdir", "-p", "Linux-x86_64/SRC/"]
RUN ["tar", "-zxf", "TGZ/netpbm-10.35.94.tgz", "-C", "Linux-x86_64/SRC/"]
COPY provision/netpbm/Makefile.config Linux-x86_64/SRC/netpbm-10.35.94

RUN ["bash", "install.sh"]
