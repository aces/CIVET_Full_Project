FROM ubuntu:18.04 as base
RUN ["apt-get", "update", "-qq"]
RUN ["apt-get", "install", "-qq", "--no-install-recommends", "perl", "imagemagick", "gnuplot-nox", "locales", "gsfonts"]

FROM base as builder
RUN ["apt-get", "install", "-qq", "git-lfs"]

RUN ["apt-get", "install", "-qq", "build-essential", "automake", "libtool", "bison"]
RUN ["apt-get", "install", "-qq", "libz-dev", "libjpeg-dev", "libpng-dev", "libtiff-dev", \
    "liblcms2-dev", "flex", "libx11-dev", "freeglut3-dev", \
    "libxmu-dev", "libxi-dev", "libqt4-dev"]

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
RUN ["bash", "job_test"]

# clean up build files to reduce image size
WORKDIR /opt/CIVET/Linux-x86_64
RUN ["rm", "-r", "SRC", "building", "info", "man"]
RUN ["chmod", "--recursive", "u+rX,g+rX,o+rX", "/opt/CIVET" ]

# multi-stage build
FROM base
RUN ["mkdir", "-p", "/opt/CIVET/Linux-x86_64"]
COPY --from=builder /opt/CIVET/Linux-x86_64/ /opt/CIVET/Linux-x86_64/

# init.sh environment variables, should be equivalent to
# printf "%s\n\n" "source /opt/CIVET/Linux-x86_64/init.sh" >> ~/.bashrc
ENV MNIBASEPATH=/opt/CIVET/Linux-x86_64 CIVET=CIVET-2.1.1
ENV PATH=$MNIBASEPATH/$CIVET:$MNIBASEPATH/$CIVET/progs:$MNIBASEPATH/bin:$PATH \
    LD_LIBRARY_PATH=$MNIBASEPATH/lib \
    MNI_DATAPATH=$MNIBASEPATH/share \
    PERL5LIB=$MNIBASEPATH/perl \
    R_LIBS=$MNIBASEPATH/R_LIBS \
    VOLUME_CACHE_THRESHOLD=-1 \
    BRAINVIEW=$MNIBASEPATH/share/brain-view \
    MINC_FORCE_V2=1 \
    MINC_COMPRESS=4 \
    CIVET_JOB_SCHEDULER=DEFAULT

CMD ["/opt/CIVET/Linux-x86_64/CIVET-2.1.1/CIVET_Processing_Pipeline", "-help"]
