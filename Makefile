
SHELL=/bin/sh

BUILDER_VERSION= $(shell sed -e '/Id/!d'  -e 's/[^0-9.]*\([0-9.]*\).*/\1/'  -e q   Makefile )
version:
	#     +-------------------------------------+
	#     |  QUARANTINE BUILDER VERSION:  ${BUILDER_VERSION}  |
	#     +-------------------------------------+
	@echo 
	@echo "Syntax: make [option]"
	@echo "Useful options are:"
	@echo "  untar      - get packages from web and untar"
	@echo "  utils      - util libs (perl, PMP, etc)"
	@echo "  mnilibs    - internal BIC libs (bicpl, EBTKS, etc)"
	@echo "  main       - core codes (pve, clasp, surfreg, etc)"
	@echo "  civet      - CIVET pipeline (internal, development)"
	@echo "  visual     - BIC viewers (Display, register, brainview)"
	@echo "  clean      - clean-up (incomplete)"
	@echo "  imagemagick - from ftp://ftp.imagemagick.org/pub/"
	@echo 
	@echo "If some modules fail to compile, you may have to install"
	@echo "the following packages on your Linux Debian/Ubuntu system:"
	@echo "  sudo apt-get install build-essential "
	@echo "       libx11-dev freeglut3-dev libgmp3-dev libgnome-perl"
	@echo "       gawk zlib1g-dev m4 libgnome2-dev libgnome-dev xlibs-dev"
	@echo "       r-base r-base-core r-base-dev"
	@echo "For verify images, adding the following:"
	@echo "       imagemagick"
	@echo "or install it from sources at ftp://ftp.imagemagick.org/pub/"
	@echo 
	@echo "On CentOS, modules to install are:"
	@echo "  sudo yum groupinstall 'Development Tools'"
	@echo "  sudo yum install zlib-devel"
	@echo "  sudo yum install libjpeg-devel"
	@echo "  sudo yum install libpng-devel"
	@echo "  sudo yum install libtiff-devel"
	@echo "  sudo yum install lcms2-devel"
	@echo "  sudo yum install which"
	@echo "  sudo yum install cpan"
	@echo "  cpan install ExtUtils::MakeMaker"
	@echo "  sudo yum install libX11-devel"
	@echo "  sudo yum install freeglut-devel"
	@echo "  sudo yum install perl-Env"
	@echo "  sudo yum install perl-Perl4-CoreLibs"
	@echo "  sudo yum install gnuplot"
	@echo 
	@echo "For Ubuntu 16.0/18.0:"
	@echo "  sudo apt-get install libz-dev libjpeg-dev libpng-dev "
	@echo "       libtiff-dev liblcms2-dev flex libx11-dev freeglut3-dev "
	@echo "       libxmu-dev libxi-dev libqt4-dev "
	@echo "  sudo apt-get install libfreetype6-dev "
	@echo "    for fonts on png before compiling ImageMagick"
	@echo 
	@echo "Copyright Alan C. Evans"
	@echo "Professor of Neurology"
	@echo "McGill University"
	@echo 

packages:
	@echo 
	@echo "Creating civet$(CIVET_VERS)-cdrom.tar.gz from TGZ..."
	@echo 
	mkdir -p dist
	mkdir -p dist/TGZ
	@cp -f -p Makefile dist/
	@cp -f -p mk_environment.pl dist/
	@cp -f -p install.sh dist/
	@cp -f -p LICENSE dist/
	@cp -f -p $(ADNI_TAR) dist/TGZ/
	@cp -f -p $(ARGS_TAR) dist/TGZ/
	@cp -f -p $(AUTOREG_TAR) dist/TGZ/
	@cp -f -p $(AVG305_TAR) dist/TGZ/
	@cp -f -p $(BET_TAR) dist/TGZ/
	@cp -f -p $(BICINVENTOR_TAR) dist/TGZ/
	@cp -f -p $(BOOST_TAR) dist/TGZ/
	@cp -f -p $(BICPL_TAR) dist/TGZ/
	@cp -f -p $(BRAINVIEW_TAR) dist/TGZ/
	@cp -f -p $(CAREA_TAR) dist/TGZ/
	@cp -f -p $(NETCDF_TAR) dist/TGZ/
	@cp -f -p $(CGAL_TAR) dist/TGZ/
	@cp -f -p $(CIVET_TAR) dist/TGZ/
	@cp -f -p $(CLASP_TAR) dist/TGZ/
	@cp -f -p $(CLASSIFY_TAR) dist/TGZ/
	@cp -f -p $(COIN_TAR) dist/TGZ/
	@cp -f -p $(COLIN27_TAR) dist/TGZ/
	@cp -f -p $(CONGLOMERATE_TAR) dist/TGZ/
	@cp -f -p $(CSURFACE_TAR) dist/TGZ/
	@cp -f -p $(DISPLAY_TAR) dist/TGZ/
	@cp -f -p $(EBTKS_TAR) dist/TGZ/
	@cp -f -p $(GETOPT_TAR) dist/TGZ/
	@cp -f -p $(GGS_TAR) dist/TGZ/
	@cp -f -p $(GSL_TAR) dist/TGZ/
	@cp -f -p $(HDF_TAR) dist/TGZ/
	@cp -f -p $(ICBM152_TAR) dist/TGZ/
	@cp -f -p $(ICBM152NL_TAR) dist/TGZ/
	@cp -f -p $(ICBM152NL09_TAR) dist/TGZ/
	@cp -f -p $(ICBMTEMP_TAR) dist/TGZ/
	@cp -f -p $(ILT_TAR) dist/TGZ/
	@cp -f -p $(IMAGEMAGICK_TAR) dist/TGZ/
	@cp -f -p $(INORM_TAR) dist/TGZ/
	@cp -f -p $(LOBESEG_TAR) dist/TGZ/
	@cp -f -p $(LAPLACE_TAR) dist/TGZ/
	@cp -f -p $(M4_TAR) dist/TGZ/
	@cp -f -p $(MINC_TAR) dist/TGZ/
	@cp -f -p $(MRISIM_TAR) dist/TGZ/
	@cp -f -p $(N3_TAR) dist/TGZ/
	@cp -f -p $(NETPBM_TAR) dist/TGZ/
	@cp -f -p $(OOBICPL_TAR) dist/TGZ/
	@cp -f -p $(PCREPP_TAR) dist/TGZ/
	@cp -f -p $(PCRE_TAR) dist/TGZ/
	@cp -f -p $(PERLLIB_TAR) dist/TGZ/
	@cp -f -p $(PMP_TAR) dist/TGZ/
	@cp -f -p $(PVE_TAR) dist/TGZ/
	@cp -f -p $(RAY_TRACE_TAR) dist/TGZ/
	@cp -f -p $(REGISTER_TAR) dist/TGZ/
	@cp -f -p $(SIMAGE_TAR) dist/TGZ/
	@cp -f -p $(SOQT_TAR) dist/TGZ/
	@cp -f -p $(STXSEG_TAR) dist/TGZ/
	@cp -f -p $(SURFREG_TAR) dist/TGZ/
	@cp -f -p $(TRUEFONT_TAR) dist/TGZ/
	mkdir -p dist/Test
	@cp -f -p Test/mni_icbm_00100_t1.mnc dist/Test/
	cd dist; \
	tar cvf civet$(CIVET_VERS)-cdrom.tar * ; \
	gzip civet$(CIVET_VERS)-cdrom.tar ; \
	mv civet$(CIVET_VERS)-cdrom.tar.gz .. ; \
	cd ..; \
	rm -rf dist
	@echo 
	@echo "...done"
	@echo 

source_packages:
	@echo
	@echo "Creating civet$(CIVET_VERS)-cdrom.tar.gz from sources..."
	@echo
	mkdir -p dist
	mkdir -p dist/TGZ
	@cp -f -p Makefile dist/
	@cp -f -p mk_environment.pl dist/
	@cp -f -p install.sh dist/
	@cp -f -p LICENSE dist/
	for pkg in      ${ADNI_PACKAGE} \
			${ARGS_PACKAGE} \
			${AUTOREG_PACKAGE} \
			${AVG305_PACKAGE} \
			${BET_PACKAGE} \
			${BICPL_PACKAGE} \
			${CAREA_PACKAGE} \
			${CIVET_PACKAGE} \
			${CLASP_PACKAGE} \
			${CLASSIFY_PACKAGE} \
			${COLIN27_PACKAGE} \
			${CONGLOMERATE_PACKAGE} \
			${CSURFACE_PACKAGE} \
			${EBTKS_PACKAGE} \
			${GETOPT_PACKAGE} \
			${ICBM152_PACKAGE} \
			${ICBM152NL_PACKAGE} \
			${ICBM152NL09_PACKAGE} \
			${ICBMTEMP_PACKAGE} \
			${ILT_PACKAGE} \
			${INORM_PACKAGE} \
			${LAPLACE_PACKAGE} \
			${MINC_PACKAGE} \
			${N3_PACKAGE} \
			${OOBICPL_PACKAGE} \
			${PERLLIB_PACKAGE} \
			${PMP_PACKAGE} \
			${SURFREG_PACKAGE} \
			${RAY_TRACE_PACKAGE} ; do \
		cd ${SOURCE_DIR}/$$pkg/ ; \
		make dist ; cd - ; \
		mv -f ${SOURCE_DIR}/$$pkg/$$pkg.tar.gz dist/TGZ/ ; \
	done
	if [ ! -e ${SOURCE_DIR}/${PVE_PACKAGE}/configure ] ; then \
	  cd ${SOURCE_DIR}/${PVE_PACKAGE}/src ; \
	  make dist ; cd - ; \
	  mv -f ${SOURCE_DIR}/${PVE_PACKAGE}/src/${PVE_PACKAGE}.tar.gz dist/TGZ/ ; \
	else \
	  cd ${SOURCE_DIR}/${PVE_PACKAGE}/ ; \
	  make dist ; cd - ; \
	  mv -f ${SOURCE_DIR}/${PVE_PACKAGE}/${PVE_PACKAGE}.tar.gz dist/TGZ/ ; \
	fi
	cd ${SOURCE_DIR}/ ; \
	tar --exclude='*/.git' --exclude='*/CVS' -cvf ${M4_PACKAGE}.tar m4 ; \
	gzip ${M4_PACKAGE}.tar ; \
	cd - ; \
	mv -f ${SOURCE_DIR}/${M4_PACKAGE}.tar.gz dist/TGZ/
	for pkg in      ${BOOST_TAR} \
			${NETCDF_TAR} \
			${CGAL_TAR} \
			${GSL_TAR} \
			${HDF_TAR} \
			${NETPBM_TAR} \
			${PCREPP_TAR} \
			${PCRE_TAR} ; do \
		cp -f -p $$pkg dist/TGZ/ ; \
	done
	mkdir -p dist/Test
	@cp -f -p Test/mni_icbm_00100_t1.mnc dist/Test/
	cd dist; \
	tar cvf civet$(CIVET_VERS)-cdrom.tar * ; \
	gzip civet$(CIVET_VERS)-cdrom.tar ; \
	mv civet$(CIVET_VERS)-cdrom.tar.gz .. ; \
	cd ..; \
	rm -rf dist
	@echo
	@echo "...done"
	@echo

binaries:
	@echo 
	@echo "Packaging binaries for civet$(CIVET_VERS)-binaries.tar.gz..."
	@echo 
	tar --exclude='$(UNAME)/share/hdf5_examples' \
	        -cvf civet$(CIVET_VERS)-binaries.tar $(UNAME)/bin \
	        $(UNAME)/CIVET$(CIVET_VERS) $(UNAME)/doc \
	        $(UNAME)/etc $(UNAME)/lib $(UNAME)/perl \
	        $(UNAME)/init.* $(UNAME)/share \
	        job_test Test/mni_icbm_00100_t1.mnc \
	        LICENSE
	gzip civet$(CIVET_VERS)-binaries.tar
	@echo 
	@echo "...done"
	@echo 

.PHONY: clean clean_dist

#     +-------------------------+
#     |  SET SOME DEFAULTS      |
#     +-------------------------+

GTAR=tar
GTAR_FLAGS=-xzf
ABI = 64
DEBUG = 0
STATIC = 0
UNAME = $(shell uname)-$(shell uname -m | sed 's/ /_/g')
SOURCE_DIR  = $(PWD)/$(UNAME)/SRC
PREFIX_PATH = $(PWD)/$(UNAME)
BUILD_PATH  = $(PREFIX_PATH)
R_LIBS = $(PREFIX_PATH)/R_LIBS
MATLAB_ROOT = /usr/local/matlab
ANIMAL = no
MRI_SIM = no
MAGICK = no
USE_CVS = no
USE_GIT = no

QUARANTINE_FLAG = $(PWD)/$(UNAME)/.quarantine_created

LDFLAGS    := -L$(PREFIX_PATH)/lib
PATH       := $(PREFIX_PATH)/bin:$(PATH)
LD_LIBRARY_PATH := $(PREFIX_PATH)/lib:$(LD_LIBRARY_PATH)

OPT_OPTIONS :=

#     +---------------------------------------------------+
#     |  STATIC OR DYNAMIC COMPILATION FOR BIC LIBRARIES  |
#     +---------------------------------------------------+
### fix LIB_EXT for cygwin and os-x (dll, dylib, whatever)
ifeq ($(STATIC),1)
  BIC_STATIC = --enable-shared=no --enable-static=yes
  LIB_EXT = a
else
  BIC_STATIC = --enable-shared=yes --enable-static=no
  LIB_EXT = so
  ifneq ($(findstring Darwin,$(shell uname)),)
    LIB_EXT = dylib
  endif
endif

#     +-------------------------------------+
#     |  OPTIMIZATION LEVEL (defaut opt)    |
#     +-------------------------------------+
ifeq ($(DEBUG),1)
  OPT_OPTIONS += -g
else
  ifneq ($(findstring IRIX,$(shell uname)),)
    OPT_OPTIONS += -g -O2
  else
    ifneq ($(findstring Linux,$(shell uname)),)
      ifneq ($(findstring ia64,$(shell uname -m)),)
        OPT_OPTIONS += -g -O1
      else
        OPT_OPTIONS += -g -O2
      endif
    else
      OPT_OPTIONS += -g -O2
    endif
  endif
endif
# These options are needed to compile with new gcc compilers (like 4.6 and above)

# (See http://www.amigacoding.de/index.php?topic=301.0).
GCCVERSIONSTRING=$(shell gcc -dumpversion)
empty:=
space:= $(empty) $(empty)
GCCVERSION := $(shell expr `echo $(GCCVERSIONSTRING)` | cut -f1 -d.)
GCCVERSION += $(shell expr `echo $(GCCVERSIONSTRING)` | cut -f2 -d.)
GCCVERSION += $(shell expr `echo $(GCCVERSIONSTRING)` | cut -f3 -d.)
# Make sure the version number has at least 3 decimals
GCCVERSION += 00
# Remove spaces from the version number
GCCVERSION := $(subst $(space),$(empty),$(GCCVERSION))
# Crop the version number to 3 decimals.
GCCVERSION := $(shell expr `echo $(GCCVERSION)` | cut -b1-3)

ifeq ($(shell expr `echo $(GCCVERSION)` \>= 460), 1)
  $(info new compiler $(GCCVERSION))
  OPT_OPTIONS += -D_GNU_SOURCE
  CFLAGS=${OPT_OPTIONS} -std=c99
  CPPFLAGS=${OPT_OPTIONS}
  CXXFLAGS=${OPT_OPTIONS} -Wno-comment -Wno-write-strings
  ifeq ($(shell expr `echo $(GCCVERSION)` \>= 470), 1)
    CXXFLAGS+= -Wno-unused-local-typedefs
  endif
  ### LDFLAGS:='-Wl,--no-as-needed ${LDFLAGS}'
  LDFLAGS :='-Wl,--no-as-needed ${LDFLAGS}'
  BRAINVIEWLDFLAGS :='-Wl,--no-as-needed -L$(PREFIX_PATH)/lib -L/usr/lib64/ -lQt3Support'
else
  $(info old compiler $(GCCVERSION))
  CFLAGS=${OPT_OPTIONS}
  CPPFLAGS=${OPT_OPTIONS}
  CXXFLAGS=${OPT_OPTIONS}
endif

#     +----------------------------------+
#     |  SET ARCH and OS specific bits   |
#     +----------------------------------+

#     +---------- IRIX64 ----------------+
ifneq ($(findstring IRIX,$(shell uname)),)
  JAMARCH=bin.irixmips
  BICPL_BUILD_SWITCH=--with-image-sgi
  CPPFLAGS+=-I$(PREFIX_PATH)/include -I$(PREFIX_PATH)/include/volume_io -I/usr/include/gl
  
  # THESE ARE BIC SPECIFIC THINGS
  PERL=$(shell which /usr/local/perl5.8/bin/perl5.8.5)
  GTAR:=gtar
else
  PERL=$(shell which perl)
endif

#     +----------  Linux  ----------------+
ifneq ($(findstring Linux,$(shell uname)),)
  BICPL_BUILD_SWITCH=--with-image-netpbm
  ifneq ($(findstring x86_64,$(shell uname -m)),)
    JAMARCH=bin.linuxx86_64
    # some silliness for RMINC-0.4 on Linux 64 bits
    CFLAGS+=-fpic
    CPPFLAGS+=-fpic
    CXXFLAGS+=-fpic
    MEX_EXT=mexa64
  else
    JAMARCH=bin.linuxx86
    MEX_EXT=mexglx
  endif
  ifneq ($(findstring ia64,$(shell uname -m)),)
    JAMARCH=bin.linuxia64
  endif
endif

#     +-----------  Darwin ----------------+
ifneq ($(findstring Darwin,$(shell uname)),)
  BICPL_BUILD_SWITCH=--with-image-netpbm
  ifneq ($(findstring i386,$(shell uname -m)),)
    JAMARCH=bin.macosxx86
  else
    JAMARCH=bin.macosxppc
  endif
  BUILD_PATH := $(BUILD_PATH)/:/sw
  DYLD_LIBRARY_PATH=$(PREFIX_PATH)/lib
  VIEWER_OPTS='--with-apple-opengl-framework'
  ## add dylib for MAC to avoid recycle
  VIEWER_LDFLAGS=${LDFLAGS} -L/Applications/MNI/Darwin-i386//lib -dylib_file \
                 /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGL.dylib:\
                 /System/Library/Frameworks/OpenGL.framework/Versions/A/Libraries/libGL.dylib
else
  VIEWER_OPTS='--with-x'
  VIEWER_LDFLAGS=-L$(PREFIX_PATH)/lib
endif

CFG_COMP_FLAGS=CFLAGS='${CFLAGS}' CPPFLAGS='${CPPFLAGS}' CXXFLAGS='${CXXFLAGS}'

#     +-----------------------------------------------+
#     |        SET MINC BASE VERSION (MUST BE 2)      |
#     +-----------------------------------------------+

MINC_BASE=2
MINC_COMPRESS=4
MINC_FORCE_V2=1
MINC_EXTRA = $(BIC_STATIC) --enable-acr-nema --enable-minc2
MINC_FLAG = --with-minc2

#     +-------------------------------------------+
#     |  SET VERSION NUMBERS, PACKAGE NAMES, ETC  |
#     +-------------------------------------------+

ADNI_VERS=-1.2
ADNI_PACKAGE=mni-models_adni_nl${ADNI_VERS}
ADNI_GIT=git@github.com:aces/mni-models_adni_nl.git
ADNI_GIT_TAG=mni_adni_nl_1-2
ADNI_CVS=mni-models/adni-nl
ADNI_CVS_TAG=mni_adni_nl_1-2

ARGS_VERS=-0.2.1
ARGS_PACKAGE=arguments${ARGS_VERS}
ARGS_GIT=git@github.com:aces/arguments.git
ARGS_GIT_TAG=arguments_0-2-1
ARGS_CVS=libraries/arguments
ARGS_CVS_TAG=arguments_0-2-1

AUTOREG_VERS=-0.99.7
AUTOREG_PACKAGE=mni_autoreg${AUTOREG_VERS}
AUTOREG_GIT=git@github.com:aces/mni_autoreg.git
AUTOREG_GIT_TAG=mni-autoreg_0_99_7
AUTOREG_CVS=registration/mni_autoreg
AUTOREG_CVS_TAG=autoreg-0-99-7

AVG305_VERS=-1.1
AVG305_PACKAGE=mni-models_average305-lin${AVG305_VERS}
AVG305_GIT=git@github.com:aces/mni-models_average305-lin.git
AVG305_GIT_TAG=average305-lin-1-1
AVG305_CVS=mni-models/average305-lin
AVG305_CVS_TAG=average305-lin-1-1

BET_VERS=-1.3.7
BET_PACKAGE=mincbet${BET_VERS}
BET_GIT=git@github.com:aces/mincbet.git
BET_GIT_TAG=bet-1-3-7
BET_CVS=minc_dev/mincbet
BET_CVS_TAG=bet-1-3-7

BICINVENTOR_VERS=-0.3.1
BICINVENTOR_PACKAGE=bicInventor${BICINVENTOR_VERS}
BICINVENTOR_GIT=
BICINVENTOR_GIT_TAG=
BICINVENTOR_CVS=libraries/bicInventor
BICINVENTOR_CVS_TAG=bicinventor_0-3-1

BOOST_VERS=_1_64_0
BOOST_PACKAGE=boost${BOOST_VERS}
BOOST_GIT=
BOOST_GIT_TAG=
BOOST_CVS=
BOOST_CVS_TAG=

BICPL_VERS=-1.4.8
BICPL_PACKAGE=bicpl${BICPL_VERS}
BICPL_GIT=git@github.com:aces/bicpl.git
BICPL_GIT_TAG=bicpl-1_4_8
BICPL_CVS=libraries/bicpl
BICPL_CVS_TAG=bicpl-1_4_8

BRAINVIEW_VERS=-0.8.2
BRAINVIEW_PACKAGE=brain-view${BRAINVIEW_VERS}
BRAINVIEW_GIT=
BRAINVIEW_GIT_TAG=
BRAINVIEW_CVS=visualization/brain-view
BRAINVIEW_CVS_TAG=bv_0_8_2

CAREA_VERS=-1.3.0
CAREA_PACKAGE=cortex_area${CAREA_VERS}
CAREA_GIT=git@github.com:aces/cortex_area.git
CAREA_GIT_TAG=v1-3-0
CAREA_CVS=statistics/cortex_area
CAREA_CVS_TAG=v1-3-0

CGAL_VERS=-3.3.1
CGAL_PACKAGE=CGAL${CGAL_VERS}
CGAL_GIT=
CGAL_GIT_TAG=
CGAL_CVS=
CGAL_CVS_TAG=

CIVET_VERS=-2.1.1
CIVET_PACKAGE=civet${CIVET_VERS}
CIVET_GIT=git@github.com:aces/CIVET.git
CIVET_GIT_TAG=CIVET_2_1_1
CIVET_CVS=pipelines/CIVET
CIVET_CVS_TAG=CIVET_2_1_1

CLASP_VERS=-3.0.3
ifeq ($(CLASP_VERS),-2.1)
  CLASP_PACKAGE=CLASP${CLASP_VERS}
else
  CLASP_PACKAGE=surface-extraction${CLASP_VERS}
endif
CLASP_GIT=git@github.com:aces/surface-extraction.git
CLASP_GIT_TAG=clasp_3-0-3
CLASP_CVS=surface/surface-extraction
CLASP_CVS_TAG=clasp_3-0-3

CLASSIFY_VERS=-1.1.1
CLASSIFY_PACKAGE=classify${CLASSIFY_VERS}
CLASSIFY_GIT=git@github.com:aces/classify.git
CLASSIFY_GIT_TAG=release-1.1.10
CLASSIFY_CVS=INSECT/classify
CLASSIFY_CVS_TAG=classify-1-1-1

COIN_VERS=-3.1.3
# COIN_VERS=-4.0.0a
COIN_PACKAGE=Coin${COIN_VERS}
COIN_GIT=
COIN_GIT_TAG=
COIN_CVS=
COIN_CVS_TAG=

COLIN27_VERS=-1.2
COLIN27_PACKAGE=mni-models_colin27-lin${COLIN27_VERS}
COLIN27_GIT=git@github.com:aces/mni-models_colin27-lin.git
COLIN27_GIT_TAG=colin27-lin-1-2
COLIN27_CVS=mni-models/colin27-lin
COLIN27_CVS_TAG=colin27-lin-1-2

CONGLOMERATE_VERS=-1.6.9
CONGLOMERATE_PACKAGE=conglomerate${CONGLOMERATE_VERS}
CONGLOMERATE_GIT=git@github.com:aces/conglomerate.git
CONGLOMERATE_GIT_TAG=conglomerate_1-6-9
CONGLOMERATE_CVS=libraries/conglomerate
CONGLOMERATE_CVS_TAG=conglomerate_1-6-9

CSURFACE_VERS=-1.2.2
CSURFACE_PACKAGE=cortical_surface${CSURFACE_VERS}
CSURFACE_GIT=git@github.com:aces/cortical_surface.git
CSURFACE_GIT_TAG=cortical-surface-1-2-2
CSURFACE_CVS=surface/cortical_surface
CSURFACE_CVS_TAG=cortical-surface-1-2-2

DISPLAY_VERS=-1.6.0
DISPLAY_PACKAGE=Display${DISPLAY_VERS}
DISPLAY_GIT=
DISPLAY_GIT_TAG=
DISPLAY_CVS=
DISPLAY_CVS_TAG=

EBTKS_VERS=-1.6.6
ifeq ($(EBTKS_VERS),-1.4)
  EBTKS_PACKAGE=EBTKS${EBTKS_VERS}
else
  EBTKS_PACKAGE=ebtks${EBTKS_VERS}
endif
EBTKS_GIT=git@github.com:aces/EBTKS.git
EBTKS_GIT_TAG=ebtks-1_6_6
EBTKS_CVS=libraries/EBTKS
EBTKS_CVS_TAG=ebtks-1-6-6

EMMA_VERS=-1.0.0
EMMA_PACKAGE=emma${EMMA_VERS}
EMMA_GIT=
EMMA_GIT_TAG=
EMMA_CVS=
EMMA_CVS_TAG=

GETOPT_VERS=-0.3
GETOPT_PACKAGE=Getopt-Tabular${GETOPT_VERS}
GETOPT_GIT=git@github.com:aces/Getopt-Tabular.git
GETOPT_GIT_TAG=getopt_0-3
GETOPT_CVS=libraries/Getopt-Tabular
GETOPT_CVS_TAG=getopt_0-3

GGS_VERS=-9.22
GGS_PACKAGE=ghostscript${GGS_VERS}
GGS_GIT=
GGS_GIT_TAG=
GGS_CVS=
GGS_CVS_TAG=

GLIM_VERS=-1.2
GLIM_PACKAGE=glim_image${GLIM_VERS}
GLIM_GIT=
GLIM_GIT_TAG=
GLIM_CVS=
GLIM_CVS_TAG=

GSL_VERS=-1.8
GSL_PACKAGE=gsl${GSL_VERS}
GSL_GIT=
GSL_GIT_TAG=
GSL_CVS=
GSL_CVS_TAG=

HDF_VERS=5-1.8.8
HDF_PACKAGE=hdf${HDF_VERS}
HDF_GIT=
HDF_GIT_TAG=
HDF_CVS=
HDF_CVS_TAG=

ICBM152_VERS=-1.1
ICBM152_PACKAGE=mni-models_icbm152-lin${ICBM152_VERS}
ICBM152_GIT=git@github.com:aces/mni-models_icbm152-lin.git
ICBM152_GIT_TAG=mni_icbm_lin_1-1
ICBM152_CVS=mni-models/icbm152-lin
ICBM152_CVS_TAG=release_1-1

ICBM152NL_VERS=-1.1
ICBM152NL_PACKAGE=mni-models_icbm152-nl${ICBM152NL_VERS}
ICBM152NL_GIT=git@github.com:aces/mni-models_icbm152-nl.git
ICBM152NL_GIT_TAG=mni_icbm_nl_1-1
ICBM152NL_CVS=mni-models/icbm152-nl
ICBM152NL_CVS_TAG=mni_icbm_nl_1-1

ICBM152NL09_VERS=-1.1
ICBM152NL09_PACKAGE=mni-models_icbm152-nl-2009${ICBM152NL09_VERS}
ICBM152NL09_GIT=git@github.com:aces/mni-models_icbm152-nl-2009.git
ICBM152NL09_GIT_TAG=mni_icbm_nl_09a_1-1
ICBM152NL09_CVS=mni-models/icbm152-nl-2009
ICBM152NL09_CVS_TAG=mni_icbm_nl_09a_1-1

ICBMTEMP_VERS=-1.0
ICBMTEMP_PACKAGE=mni-templates${ICBMTEMP_VERS}
ICBMTEMP_GIT=git@github.com:aces/mni-templates.git
ICBMTEMP_GIT_TAG=mni_templates_1-0
ICBMTEMP_CVS=mni-models/mni-templates
ICBMTEMP_CVS_TAG=mni_templates_1-0

ILT_VERS=-1.2.5
ILT_PACKAGE=ILT${ILT_VERS}
ILT_GIT=git@github.com:aces/ILT.git
ILT_GIT_TAG=ILT-1_2_5
ILT_CVS=libraries/ILT
ILT_CVS_TAG=ILT-1_2_5

IMAGEMAGICK_VERS=-7.0.1-8
IMAGEMAGICK_PACKAGE=ImageMagick${IMAGEMAGICK_VERS}
IMAGEMAGICK_GIT=
IMAGEMAGICK_GIT_TAG=
IMAGEMAGICK_CVS=
IMAGEMAGICK_CVS_TAG=

INORM_VERS=-1.0.4
INORM_PACKAGE=inormalize${INORM_VERS}
INORM_GIT=git@github.com:aces/inormalize.git
INORM_GIT_TAG=inormalize_1-0-4
INORM_CVS=INSECT/inormalize
INORM_CVS_TAG=inormalize_1-0-4

LOBESEG_VERS=-1.1
LOBESEG_PACKAGE=mni_lobe_segment${LOBESEG_VERS}
LOBESEG_GIT=
LOBESEG_GIT_TAG=
LOBESEG_CVS=INSECT/mni_lobe_segment
LOBESEG_CVS_TAG=lobe_segment_1-1

LAPLACE_VERS=-1.3.0
LAPLACE_PACKAGE=laplacian_thickness${LAPLACE_VERS}
LAPLACE_GIT=git@github.com:aces/laplacian_thickness.git
LAPLACE_GIT_TAG=laplace-1-3-0
LAPLACE_CVS=surface/laplacian_thickness/
LAPLACE_CVS_TAG=laplace-1-3-0

M4_VERS=-1.0
M4_PACKAGE=m4
M4_GIT=git@github.com:aces/m4.git
M4_GIT_TAG=civet-2.1.0
M4_CVS=libraries/mni-acmacros
M4_CVS_TAG=m4_1-0

MINC_VERS=-2.1.02
MINC_PACKAGE=minc${MINC_VERS}
MINC_GIT=git@github.com:aces/minc.git
MINC_GIT_TAG=minc-2-1-02
MINC_CVS=libraries/minc
MINC_CVS_TAG=minc2-1-02

MRISIM_VERS=-1.0.3
MRISIM_PACKAGE=mrisim${MRISIM_VERS}
MRISIM_GIT=
MRISIM_GIT_TAG=
MRISIM_CVS=simulation/mrisim
MRISIM_CVS_TAG=mrisim-1-0-3

N3_VERS=-1.12.3
N3_PACKAGE=N3${N3_VERS}
N3_GIT=git@github.com:aces/N3.git
N3_GIT_TAG=N3-1_12_3
N3_CVS=INSECT/N3
N3_CVS_TAG=N3-1_12_3

NETCDF_VERS=-3.6.1
NETCDF_PACKAGE=netcdf${NETCDF_VERS}
NETCDF_GIT=
NETCDF_GIT_TAG=
NETCDF_CVS=
NETCDF_CVS_TAG=

NETPBM_VERS=-10.35.94
NETPBM_PACKAGE=netpbm${NETPBM_VERS}
NETPBM_GIT=
NETPBM_GIT_TAG=
NETPBM_CVS=
NETPBM_CVS_TAG=

OOBICPL_VERS=-0.4.9
OOBICPL_PACKAGE=oobicpl${OOBICPL_VERS}
OOBICPL_GIT=git@github.com:aces/oobicpl.git
OOBICPL_GIT_TAG=oobicpl-0-4-9
OOBICPL_CVS=libraries/oobicpl
OOBICPL_CVS_TAG=oobicpl-0-4-9

PCREPP_VERS=-0.9.5
PCREPP_PACKAGE=pcre++${PCREPP_VERS}
PCREPP_GIT=
PCREPP_GIT_TAG=
PCREPP_CVS=
PCREPP_CVS_TAG=

PCRE_VERS=-7.8
PCRE_PACKAGE=pcre${PCRE_VERS}
PCRE_GIT=
PCRE_GIT_TAG=
PCRE_CVS=
PCRE_CVS_TAG=

PERLLIB_VERS=-0.09
PERLLIB_PACKAGE=mni_perllib${PERLLIB_VERS}
PERLLIB_GIT=git@github.com:aces/mni-perllib.git
PERLLIB_GIT_TAG=mni_perllib_v0_09
PERLLIB_CVS=libraries/mni-perllib
PERLLIB_CVS_TAG=mni_perllib_v0_09

PMP_VERS=-0.8.3
PMP_PACKAGE=PMP${PMP_VERS}
PMP_GIT=git@github.com:aces/PMP.git
PMP_GIT_TAG=ver-0-8-3
PMP_CVS=libraries/PMP
PMP_CVS_TAG=ver-0-8-3

PVE_VERS=-1.4.3
PVE_PACKAGE=pve${PVE_VERS}
PVE_GIT=git@github.com:aces/pve.git
PVE_GIT_TAG=ver-1_4_3
PVE_CVS=INSECT/pve
PVE_CVS_TAG=ver-1_4_3

QVAL_VERS=_1.38.0
QVAL_PACKAGE=qvalue${QVAL_VERS}
QVAL_GIT=
QVAL_GIT_TAG=
QVAL_CVS=
QVAL_CVS_TAG=

RAY_TRACE_VERS=-1.0.4
RAY_TRACE_PACKAGE=ray_trace${RAY_TRACE_VERS}
RAY_TRACE_GIT=git@github.com:aces/ray_trace.git
RAY_TRACE_GIT_TAG=ray-trace-1-0-4
RAY_TRACE_CVS=visualization/ray_trace
RAY_TRACE_CVS_TAG=ray-trace-1-0-4

REGISTER_VERS=-1.4.0
REGISTER_PACKAGE=Register${REGISTER_VERS}
REGISTER_GIT=
REGISTER_GIT_TAG=
REGISTER_CVS=
REGISTER_CVS_TAG=

RMINC_VERS=_0.5.1
RMINC_PACKAGE=RMINC${RMINC_VERS}
RMINC_GIT=
RMINC_GIT_TAG=
RMINC_CVS=
RMINC_CVS_TAG=

RSTAT_VERS=-0.9.4
RSTAT_PACKAGE=mni_cortical_statistics${RSTAT_VERS}
RSTAT_GIT=
RSTAT_GIT_TAG=
RSTAT_CVS=
RSTAT_CVS_TAG=

SIMAGE_VERS=-1.7.0
SIMAGE_PACKAGE=simage${SIMAGE_VERS}
SIMAGE_GIT=
SIMAGE_GIT_TAG=
SIMAGE_CVS=
SIMAGE_CVS_TAG=

# SOQT_VERS=-1.4.2a

SOQT_VERS=-1.5.0
SOQT_PACKAGE=SoQt${SOQT_VERS}
SOQT_GIT=
SOQT_GIT_TAG=
SOQT_CVS=
SOQT_CVS_TAG=

STXSEG_VERS=-1.0
STXSEG_PACKAGE=mni_stx_segment${STXSEG_VERS}
STXSEG_GIT=
STXSEG_GIT_TAG=
STXSEG_CVS=INSECT/mni_stx_segment
STXSEG_CVS_TAG=stx_segment_1-0

SURFREG_VERS=-0.6.4
ifeq ($(SURFREG_VERS),-0.4)
  SURFREG_PACKAGE=mni-surfreg${SURFREG_VERS}
else
  SURFREG_PACKAGE=mni_surfreg${SURFREG_VERS}
endif
SURFREG_GIT=git@github.com:aces/mni_surfreg.git
SURFREG_GIT_TAG=mni-surfreg-0-6-4
SURFREG_CVS=registration/mni_surfreg
SURFREG_CVS_TAG=mni-surfreg-0-6-4

TRUEFONT_VERS=-2.0
TRUEFONT_PACKAGE=urw-fonts${TRUEFONT_VERS}
TRUEFONT_GIT=
TRUEFONT_GIT_TAG=
TRUEFONT_CVS=
TRUEFONT_CVS_TAG=

#     +---------------------+
#     |  NAMES OF PACKAGES  |
#     +---------------------+

TGZ_FLAG=${PWD}/TGZ/.tgz_created
TGZ_DIR=${PWD}/TGZ

#     +---------------+
#     |  BOOST STUFF  |
#     +---------------+

ifeq ($(BOOST_VERS),_1_48_0)
  BJAM := ${SOURCE_DIR}/${BOOST_PACKAGE}/tools/build/v2/engine/${JAMARCH}
endif
ifeq ($(BOOST_VERS),_1_64_0)
  BJAM := ${SOURCE_DIR}/${BOOST_PACKAGE}
endif
BOOSTTMP := /tmp

#     +--------------------------------------------------+
#     |  DEFINE THE VARIABLES FOR THE NAME OF PACKAGES.  |
#     |  MOST PACKAGES ARE .tar.gz, EXCEPT A FEW         |
#     |  EXCEPTIONS.                                     |
#     +--------------------------------------------------+

LIST_EXTRA = BICINVENTOR BRAINVIEW COIN DISPLAY EMMA GLIM \
             QVAL REGISTER RMINC RSTAT SIMAGE SOQT TRUEFONT

LIST_TAR = ADNI ARGS AUTOREG AVG305 BET BOOST BICPL CAREA NETCDF \
           CGAL CIVET CLASP CLASSIFY COLIN27 CONGLOMERATE CSURFACE EBTKS \
           GETOPT GSL HDF ICBM152 ICBM152NL ICBM152NL09 ICBMTEMP ILT \
           INORM LAPLACE M4 MINC N3 OOBICPL PCREPP PCRE PERLLIB PMP PVE \
           RAY_TRACE SURFREG

ifeq ($(MAGICK),yes)
  LIST_TAR += IMAGEMAGICK
endif
ifeq ($(ANIMAL),yes)
  LIST_TAR += LOBESEG STXSEG
endif
ifeq ($(MRI_SIM),yes)
  LIST_TAR += MRISIM
endif

LIST_TGZ = NETPBM

ifeq ($(GGS_VERS),-8.71.1)
  LIST_BZ2 = GGS
endif
ifeq ($(GGS_VERS),-9.22)
  LIST_BZ2 =
  LIST_TAR += GGS
endif

define make-variables
  $1_TAR = ${TGZ_DIR}/${$1_PACKAGE}.$2
  $1_DIR = ${SOURCE_DIR}/${$1_PACKAGE}
  $1_UNTAR = ${SOURCE_DIR}/${$1_PACKAGE}/.$1_created
endef

$(foreach element,$(LIST_TAR),$(eval $(call make-variables,$(element),tar.gz)))
$(foreach element,$(LIST_TGZ),$(eval $(call make-variables,$(element),tgz)))
$(foreach element,$(LIST_BZ2),$(eval $(call make-variables,$(element),tar.bz2)))

# Special case to redefine M4 without version tag.

M4_DIR = ${SOURCE_DIR}/m4

####################################################################################

#     +---------------+
#     |  MAKE TGZ DIR |
#     +---------------+

${TGZ_FLAG}:
	mkdir -p ${TGZ_DIR}
	@if [ ! -f $@ ] ;  then \
	  echo 1 > $@ ; \
	fi

#     +-----------------------+
#     |  MAKE QUARANTINE DIRS |
#     +-----------------------+

$(QUARANTINE_FLAG):
	mkdir -p ${SOURCE_DIR}
	mkdir -p $(PREFIX_PATH)/lib $(PREFIX_PATH)/include $(PREFIX_PATH)/man/man1 $(PREFIX_PATH)/man/man2 $(PREFIX_PATH)/man/man3  $(PREFIX_PATH)/man/man4  $(PREFIX_PATH)/man/man5  $(PREFIX_PATH)/man/man6  $(PREFIX_PATH)/man/man7  $(PREFIX_PATH)/man/man8  $(PREFIX_PATH)/man/man9 $(PREFIX_PATH)/perl
	@if [ ! -f $@ ] ;  then \
	  echo 1 > $@ ; \
	fi
	@echo "#  +-------------------------------------------------+" 
	@echo "#  |    SRC      = ${SOURCE_PATH}" 
	@echo "#  |    PREFIX   = ${PREFIX_PATH}" 
	@echo "#  |    CFLAGS   = $(CFLAGS)" 
	@echo "#  |    CPPFLAGS = $(CPPFLAGS)" 
	@echo "#  |    CXXFLAGS = $(CXXFLAGS)" 
	@echo "#  |    LDFLAGS  = $(LDFLAGS)" 
	@echo "#  +-------------------------------------------------+"

#     +-----------------------+
#     |  OBTAIN THE SOURCES:  |
#     |  - FROM PACKAGE       |
#     |  - FROM GIT           |
#     |  - FROM CVS           |
#     +-----------------------+

define make-untar-target
  $($1_UNTAR): ${QUARANTINE_FLAG}
	@if [ ! -d ${$1_DIR} ] ;  then \
	  if [ -e ${$1_TAR} ] ; then \
	    if [[ "${$1_TAR}" =~ "tgz" ]] || [[ "${$1_TAR}" =~ "tar.gz" ]] ; then \
	      ${GTAR} -zxf ${$1_TAR} --directory=${SOURCE_DIR} ; \
	    else \
	      if [[ "${$1_TAR}" =~ "bz2" ]] ; then \
	        ${GTAR} -xjf ${$1_TAR} --directory=${SOURCE_DIR} ; \
	      fi ; \
	    fi ; \
	  else \
	    if [ "$(USE_CVS)" == "yes" ] ; then \
	      cvs co -P -r ${$1_CVS_TAG} -d ${$1_DIR} ${$1_CVS} ; \
	    else \
	      if [ "$(USE_GIT)" == "yes" ] ; then \
	        git lfs clone --recurse-submodules --branch ${$1_GIT_TAG} ${$1_GIT} ${$1_DIR}; \
	        if [ ! -e ${$1_DIR}/.git ] ; then \
	          echo "Fail to clone source codes from ${$1_GIT}"; \
	          exit 1; \
	        fi ; \
	        cd ${$1_DIR}; \
	        if [[ "`git describe --tags`" != "${$1_GIT_TAG}" ]] ; then \
	          echo "Fail to checkout tag to ${$1_GIT_TAG}"; \
	          exit 1; \
	        fi ; \
	        cd -; \
	      fi ; \
	    fi ; \
	  fi ; \
	  if [ -d ${$1_DIR} ] ; then \
	    touch ${$1_UNTAR} ; \
	  fi ; \
	fi
endef

LIST_ALL = ${LIST_TAR} ${LIST_TGZ} ${LIST_BZ2}

$(foreach element,$(LIST_ALL),$(eval $(call make-untar-target,$(element))))

#     +------------------------------------+
#     |  MAIN LIBRARIES AND CORE PROGRAMS  |
#     +------------------------------------+
ADNI         = $(PREFIX_PATH)/share/mni-models/mni_adni_t1w_tal_nlin_asym.mnc
LIBARGS      = $(PREFIX_PATH)/lib/libarguments.a
AVG305VBM    = $(PREFIX_PATH)/share/avg305/average_305_mask_1mm.mnc
AUTOREG      = $(PREFIX_PATH)/bin/make_model
AVG305       = $(PREFIX_PATH)/share/mni-models/average305_t1_tal_lin.mnc
BRAINVIEW    = $(PREFIX_PATH)/bin/brain-view
CAREA        = $(PREFIX_PATH)/bin/cortex_area
CIVET        = $(PREFIX_PATH)/CIVET$(CIVET_VERS)/CIVET_Processing_Pipeline
CLASP        = $(PREFIX_PATH)/bin/expand_from_white
CLASSIFY     = $(PREFIX_PATH)/bin/classify
LIBCOIN      = $(PREFIX_PATH)/lib/libCoin.$(LIB_EXT)
COLIN27      = $(PREFIX_PATH)/share/mni-models/colin27_t1_tal_lin.mnc
CONGLOMERATE = $(PREFIX_PATH)/bin/volume_object_evaluate
CORTICAL     = $(PREFIX_PATH)/bin/deform_surface
MNIDISPLAY   = $(PREFIX_PATH)/bin/Display
GGS          = $(PREFIX_PATH)/bin/gs
GLIM         = $(PREFIX_PATH)/bin/glim_image
ICBM152      = $(PREFIX_PATH)/share/mni-models/icbm_avg_152_pd_tal_lin.mnc
ICBM152NL    = $(PREFIX_PATH)/share/mni-models/icbm_avg_152_t1_tal_nlin_symmetric_VI.mnc
ICBM152NL09  = $(PREFIX_PATH)/share/mni-models/mni_icbm152_pd_tal_nlin_asym_09a.mnc
ICBMTEMP     = $(PREFIX_PATH)/share/ICBM/icbm_template_1.00mm.mnc
IMAGEMAGICK  = $(PREFIX_PATH)/bin/convert
INORM        = $(PREFIX_PATH)/bin/headmask
LAPLACE      = $(PREFIX_PATH)/bin/laplacian_thickness $(PREFIX_PATH)/bin/normal_thickness
LIBBICINVENTOR = $(PREFIX_PATH)/lib/libbicInventor.a
LIBBICPL     = $(PREFIX_PATH)/lib/libbicpl.$(LIB_EXT)
LIBEBTKS     = $(PREFIX_PATH)/lib/libEBTKS.a
EMMA         = $(PREFIX_PATH)/emma/mireadvar.$(MEX_EXT) $(PREFIX_PATH)/bin/micreateimage
LIBGSL       = $(PREFIX_PATH)/lib/libgsl.a
LIBHDF       = $(PREFIX_PATH)/lib/libhdf5.a
LIBMINC      = $(PREFIX_PATH)/lib/libminc2.$(LIB_EXT)
LIBNETCDF    = $(PREFIX_PATH)/lib/libnetcdf.a
LIBNETPBM    = $(PREFIX_PATH)/lib/libnetpbm.a
LIBOOBICPL   = $(PREFIX_PATH)/lib/liboobicpl.$(LIB_EXT)
LIBPCRE      = $(PREFIX_PATH)/lib/libpcre.a
LIBPCREPP    = $(PREFIX_PATH)/lib/libpcre++.a
LOBESEG      = $(PREFIX_PATH)/bin/lobe_segment
M4 	     = ${SOURCE_DIR}/m4/mni_REQUIRE_LIB.m4
MINCBET      = $(PREFIX_PATH)/bin/mincbet
MRISIM       = $(PREFIX_PATH)/bin/mrisim
N3           = $(PREFIX_PATH)/bin/nu_correct
PVE          = $(PREFIX_PATH)/bin/pve
QVAL         = $(R_LIBS)/qvalue/R/qvalue
RAY_TRACE    = $(PREFIX_PATH)/bin/ray_trace
REGISTER     = $(PREFIX_PATH)/bin/register
RMINC        = $(R_LIBS)/RMINC/libs/RMINC.so
RSTAT        = $(R_LIBS)/mni.cortical.statistics/R/mni.cortical.statistics
SIMAGE       = $(PREFIX_PATH)/lib/libsimage.$(LIB_EXT)
SOQT         = $(PREFIX_PATH)/lib/libSoQt.$(LIB_EXT)
STXSEG       = $(PREFIX_PATH)/share/ANIMAL_INSECT/icbm152-symmetric-v1.0/atlas.mnc
SURFREG      = $(PREFIX_PATH)/bin/surftracc

LIBBOOST     = $(PREFIX_PATH)/lib/libboost_serialization.a
LIBCGAL      = ${PREFIX_PATH}/lib/libCGAL.a
ENV_FILES    = ${PREFIX_PATH}/init.sh

PERL_PRIV    = $(PREFIX_PATH)/perl
PL_LIB       = $(PERL_PRIV)/MNI/TagSet.pm
PMP          = $(PERL_PRIV)/PMP/sge.pod
GETOPT       = $(PERL_PRIV)/Getopt/Tabular.pm
ILT          = $(PERL_PRIV)/ILT/SceneObject/VolumeObject.pm

#     +-------------------------+
#     | Execution begins here.  |
#     +-------------------------+

#   +----------------------------------------------+
#   |   Core BIC internal packages and libraries   |
#   +----------------------------------------------+

$(ADNI):       $(ADNI_UNTAR) $(AUTOREG) $(GETOPT)
	cd ${SOURCE_DIR}/${ADNI_PACKAGE}/ ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) ; \
	fi ; \
	PERL5LIB=${PERL_PRIV} ; export PERL5LIB  ; \
	MINC_COMPRESS=${MINC_COMPRESS} ; export MINC_COMPRESS ; \
	MINC_FORCE_V2=${MINC_FORCE_V2} ; export MINC_FORCE_V2 ; \
	${MAKE}; ${MAKE} install

$(LIBARGS):      $(ARGS_UNTAR)   $(M4_UNTAR)
	cd ${SOURCE_DIR}/${ARGS_PACKAGE} ;\
	if [ ! -d m4 ] ; then ln -fs ../m4 ./m4 ;fi ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) ${CFG_COMP_FLAGS} ; \
	fi ; \
	${MAKE}; ${MAKE} install

# patch for VBM
# ln -sf $(PREFIX_PATH)/share/mni-models/icbm_avg_152_t1_tal_nlin_symmetric_VI_mask.mnc $(PREFIX_PATH)/share/avg305/average_305_mask_1mm.mnc
# make path relative so that quarantine can be relocated without an absolute path.

$(AVG305VBM):	$(ICBM152NL)
	mkdir -p $(PREFIX_PATH)/share/avg305/ ;\
	cd $(PREFIX_PATH)/share/avg305/ ;\
	ln -sf ../mni-models/icbm_avg_152_t1_tal_nlin_symmetric_VI_mask.mnc $(PREFIX_PATH)/share/avg305/average_305_mask_1mm.mnc

$(AUTOREG):      $(AUTOREG_UNTAR)   $(M4_UNTAR)  $(LIBMINC)
	cd ${SOURCE_DIR}/${AUTOREG_PACKAGE} ;\
	if [ ! -d m4 ] ; then ln -fs ../m4 ./m4 ;fi ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure $(MINC_FLAG) --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) PERL=${PERL} ${CFG_COMP_FLAGS} ; \
	fi ; \
	MINC_COMPRESS=${MINC_COMPRESS} ; export MINC_COMPRESS ; \
	MINC_FORCE_V2=${MINC_FORCE_V2} ; export MINC_FORCE_V2 ; \
	${MAKE}; ${MAKE} install

$(AVG305):       $(AVG305_UNTAR) $(AUTOREG) $(GETOPT)
	cd ${SOURCE_DIR}/${AVG305_PACKAGE}/ ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) ; \
	fi ; \
	PERL5LIB=${PERL_PRIV} ; export PERL5LIB  ; \
	MINC_COMPRESS=${MINC_COMPRESS} ; export MINC_COMPRESS ; \
	MINC_FORCE_V2=${MINC_FORCE_V2} ; export MINC_FORCE_V2 ; \
	${MAKE}; ${MAKE} install

$(CAREA):        $(CAREA_UNTAR)    $(M4_UNTAR)    $(LIBBICPL)
	cd ${SOURCE_DIR}/${CAREA_PACKAGE}/ ; \
	if [ ! -d m4 ] ; then ln -fs ../m4 ./m4 ;fi ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	   ./configure $(MINC_FLAG) --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) ${CFG_COMP_FLAGS} ; \
	fi ; \
	${MAKE}; ${MAKE} install

# Ugly fix for civet mask for ADNI. Another tmp fix for IBIS.
### ./configure --prefix=$(PREFIX_PATH) PERL=${PERL} --enable-animal=$(ANIMAL); \
##

$(CIVET):        $(CIVET_UNTAR)    $(GETOPT)    $(PMP)  $(ADNI)
	cd ${SOURCE_DIR}/${CIVET_PACKAGE}/ ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure --prefix=$(PREFIX_PATH) PERL=${PERL} --enable-animal=$(ANIMAL); \
	fi ; \
	${MAKE}; ${MAKE} install ; \
	cd $(PREFIX_PATH)/CIVET$(CIVET_VERS)/models ; \
	ln -sf ../../share/mni-models/Cerebellum_Ventricles_SubCortical_Mask-colin.mnc $(PREFIX_PATH)/CIVET$(CIVET_VERS)/models/; \
	# ln -sf ../../share/mni-models/Cerebellum_Ventricles_SubCortical_Mask-lin.mnc $(PREFIX_PATH)/CIVET$(CIVET_VERS)/models/; \
	# ln -sf ../../share/mni-models/Cerebellum_Ventricles_SubCortical_Mask-VI.mnc $(PREFIX_PATH)/CIVET$(CIVET_VERS)/models/; \
	# ln -sf ../../share/mni-models/Cerebellum_Ventricles_SubCortical_Mask-2009s.mnc $(PREFIX_PATH)/CIVET$(CIVET_VERS)/models/; \
	# ln -sf ../../share/mni-models/Cerebellum_Ventricles_SubCortical_Mask-ADNI.mnc $(PREFIX_PATH)/CIVET$(CIVET_VERS)/models/; \
	# ln -sf ../../share/mni-models/Cerebellum_Ventricles_SubCortical_Mask-ADNIhi.mnc $(PREFIX_PATH)/CIVET$(CIVET_VERS)/models/; \
	cd $(PREFIX_PATH)/share; \
	mkdir -p classify-IBIS

$(CLASP):        $(CLASP_UNTAR) $(M4_UNTAR) $(LIBBICPL)   $(GETOPT)
	cd ${SOURCE_DIR}/${CLASP_PACKAGE}/ ; \
	if [ ! -d m4 ] ; then ln -fs ../m4 ./m4 ;fi ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure $(MINC_FLAG) --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) PERL=${PERL} ${CFG_COMP_FLAGS} ; \
	fi ; \
	${MAKE}; ${MAKE} install

$(CLASSIFY):     $(CLASSIFY_UNTAR) $(M4_UNTAR) $(LIBMINC) $(LIBEBTKS)
	cd ${SOURCE_DIR}/${CLASSIFY_PACKAGE}/ ; \
	if [ ! -d m4 ] ; then ln -fs ../m4 ./m4 ;fi ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure $(MINC_FLAG) --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) LDFLAGS=${LDFLAGS} PERL=${PERL} ${CFG_COMP_FLAGS} ; \
	fi ; \
	${MAKE}; ${MAKE} install

$(COLIN27):       $(COLIN27_UNTAR) $(AUTOREG) $(GETOPT)
	cd ${SOURCE_DIR}/${COLIN27_PACKAGE}/ ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) ; \
	fi ; \
	PERL5LIB=${PERL_PRIV} ; export PERL5LIB  ; \
	MINC_COMPRESS=${MINC_COMPRESS} ; export MINC_COMPRESS ; \
	MINC_FORCE_V2=${MINC_FORCE_V2} ; export MINC_FORCE_V2 ; \
	${MAKE}; ${MAKE} install

$(CONGLOMERATE): $(CONGLOMERATE_UNTAR) $(M4_UNTAR) $(LIBBICPL)
	cd ${SOURCE_DIR}/${CONGLOMERATE_PACKAGE}/; \
	rm -rf m4 ; \
	if [ ! -d m4 ] ; then ln -fs ../m4 ./m4 ;fi ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure $(MINC_FLAG) --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) PERL=${PERL} ${CFG_COMP_FLAGS} ; \
	fi ; \
	${MAKE}; ${MAKE} install

$(CORTICAL):     $(CSURFACE_UNTAR) $(M4_UNTAR) $(LIBBICPL)
	cd ${SOURCE_DIR}/${CSURFACE_PACKAGE}/; \
	if [ ! -d m4 ] ; then ln -fs ../m4 ./m4 ;fi ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure $(MINC_FLAG) --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) PERL=${PERL} ${CFG_COMP_FLAGS} ; \
	fi ; \
	${MAKE}; ${MAKE} install

$(ICBM152):       $(ICBM152_UNTAR) $(AUTOREG) $(GETOPT)
	cd ${SOURCE_DIR}/${ICBM152_PACKAGE}/ ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) ; \
	fi ; \
	PERL5LIB=${PERL_PRIV} ; export PERL5LIB  ; \
	MINC_COMPRESS=${MINC_COMPRESS} ; export MINC_COMPRESS ; \
	MINC_FORCE_V2=${MINC_FORCE_V2} ; export MINC_FORCE_V2 ; \
	${MAKE}; ${MAKE} install

$(ICBM152NL):       $(ICBM152NL_UNTAR) $(AUTOREG) $(GETOPT)
	cd ${SOURCE_DIR}/${ICBM152NL_PACKAGE}/ ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) ; \
	fi ; \
	PERL5LIB=${PERL_PRIV} ; export PERL5LIB  ; \
	MINC_COMPRESS=${MINC_COMPRESS} ; export MINC_COMPRESS ; \
	MINC_FORCE_V2=${MINC_FORCE_V2} ; export MINC_FORCE_V2 ; \
	${MAKE}; ${MAKE} install

$(ICBM152NL09):       $(ICBM152NL09_UNTAR) $(AUTOREG) $(GETOPT)
	cd ${SOURCE_DIR}/${ICBM152NL09_PACKAGE}/ ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) ; \
	fi ; \
	PERL5LIB=${PERL_PRIV} ; export PERL5LIB  ; \
	MINC_COMPRESS=${MINC_COMPRESS} ; export MINC_COMPRESS ; \
	MINC_FORCE_V2=${MINC_FORCE_V2} ; export MINC_FORCE_V2 ; \
	${MAKE}; ${MAKE} install

$(ICBMTEMP):       $(ICBMTEMP_UNTAR)
	cd ${SOURCE_DIR}/${ICBMTEMP_PACKAGE}/ ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) ${CFG_COMP_FLAGS} ; \
	fi ; \
	PERL5LIB=${PERL_PRIV} ; export PERL5LIB  ; \
	MINC_COMPRESS=${MINC_COMPRESS} ; export MINC_COMPRESS ; \
	MINC_FORCE_V2=${MINC_FORCE_V2} ; export MINC_FORCE_V2 ; \
	${MAKE}; ${MAKE} install

$(INORM):        ${INORM_UNTAR} ${M4_UNTAR}  ${LIBMINC}  ${LIBEBTKS}
	cd ${SOURCE_DIR}/${INORM_PACKAGE}/ ; \
	if [ ! -d m4 ] ; then ln -fs ../m4 ./m4 ;fi ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure $(MINC_FLAG) --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) PERL=${PERL} ${CFG_COMP_FLAGS} ; \
	fi ; \
	${MAKE}; ${MAKE} install

$(LAPLACE):      $(LAPLACE_UNTAR) $(M4_UNTAR)  $(LIBOOBICPL)   $(GETOPT)
	cd ${SOURCE_DIR}/${LAPLACE_PACKAGE}/ ; \
	if [ ! -d m4 ] ; then ln -fs ../m4 ./m4 ;fi ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure $(MINC_FLAG) --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) PERL=${PERL} ${CFG_COMP_FLAGS} ; \
	fi ; \
	${MAKE}; ${MAKE} install

$(LIBBICPL):     $(BICPL_UNTAR) $(M4_UNTAR)  $(LIBNETPBM)   $(LIBMINC)
	cd ${SOURCE_DIR}/${BICPL_PACKAGE}/ ; \
	if [ ! -d m4 ] ; then ln -fs ../m4 ./m4 ;fi ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure $(MINC_FLAG) $(BIC_STATIC) --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH):$(PREFIX_PATH)  ${BICPL_BUILD_SWITCH} ${CFG_COMP_FLAGS} ; \
	fi ; \
	${MAKE}; ${MAKE} install

# somehow, cannot create dynamic library that will link with N3, so make it static. CL.
#      $(LIBNETCDF) no need for this

$(LIBEBTKS):     $(EBTKS_UNTAR)    $(M4_UNTAR)   $(PL_LIB)
	cd ${SOURCE_DIR}/${EBTKS_PACKAGE}/ ; \
	if [ ! -d m4 ] ; then ln -fs ../m4 ./m4 ;fi ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) ${CFG_COMP_FLAGS}; \
	fi ; \
	${MAKE}; ${MAKE} install

$(LIBMINC):      $(MINC_UNTAR) $(LIBNETCDF) $(LIBHDF)
	cd ${SOURCE_DIR}/${MINC_PACKAGE}/ ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure $(MINC_FLAG) $(MINC_EXTRA) --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) PERL=${PERL} ${CFG_COMP_FLAGS} ; \
	fi ; \
	${MAKE}; ${MAKE} install

$(LIBOOBICPL):     $(OOBICPL_UNTAR) $(M4_UNTAR) $(LIBBICPL)   $(LIBPCREPP)   $(LIBARGS)
	cd ${SOURCE_DIR}/${OOBICPL_PACKAGE}/ ; \
	if [ ! -d m4 ] ; then ln -fs ../m4 ./m4 ;fi ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure $(MINC_FLAG) $(BIC_STATIC) --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) ${CFG_COMP_FLAGS} ; \
	fi ; \
	${MAKE}; ${MAKE} install

$(MINCBET):   $(BET_UNTAR)    $(M4_UNTAR)    $(LIBMINC)
	cd ${SOURCE_DIR}/${BET_PACKAGE}/ ; \
	if [ ! -d m4 ] ; then ln -fs ../m4 ./m4 ;fi ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	   ./configure $(MINC_FLAG) --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) ${CFG_COMP_FLAGS} ; \
	fi ; \
	${MAKE}; ${MAKE} install

$(N3):        ${N3_UNTAR} $(M4_UNTAR) $(LIBMINC) $(LIBEBTKS)
	cd ${SOURCE_DIR}/${N3_PACKAGE}/ ; \
	if [ ! -d m4 ] ; then ln -fs ../m4 ./m4 ;fi ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure $(MINC_FLAG) --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) PERL=${PERL} ${CFG_COMP_FLAGS}; \
	fi ; \
	${MAKE}; ${MAKE} install

# This is messy. (Needs restructuring in CVS.)

$(PVE):  $(PVE_UNTAR) $(M4_UNTAR) $(LIBMINC)   $(GETOPT)
	cd ${SOURCE_DIR}/${PVE_PACKAGE}/ ; \
	if [ ! -e configure ] && [ -e src/autogen.sh ] ; then \
	  cd src ; \
	  if [ ! -d m4 ] ; then ln -fs ../../m4 ./m4 ;fi ; \
	 ./autogen.sh ; \
	else \
	  if [ ! -d m4 ] ; then ln -fs ../m4 ./m4 ;fi ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure $(MINC_FLAG) --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) PERL=${PERL} ${CFG_COMP_FLAGS} ; \
	fi ; \
	${MAKE}; ${MAKE} install

$(RAY_TRACE):    ${RAY_TRACE_UNTAR} $(M4_UNTAR) $(LIBBICPL)  
	cd ${SOURCE_DIR}/${RAY_TRACE_PACKAGE}/ ; \
	if [ ! -d m4 ] ; then ln -fs ../m4 ./m4 ;fi ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	 ./configure $(MINC_FLAG) --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) LDFLAGS='${VIEWER_LDFLAGS}' ${VIEWER_OPTS} ${CFG_COMP_FLAGS}; \
	fi ; \
	${MAKE}; ${MAKE} install

# Must compile surfreg with C++ flag -fpermissive in order to
# interact with CGAL which has templates using functions without
# prior definition. See https://gcc.gnu.org/gcc-4.7/porting_to.html.

$(SURFREG):  $(SURFREG_UNTAR) $(M4_UNTAR) $(LIBBICPL) $(LIBGSL) $(LIBCGAL) $(LIBBOOST)
	cd ${SOURCE_DIR}/${SURFREG_PACKAGE}/ ; \
	if [ ! -d m4 ] ; then ln -fs ../m4 ./m4 ;fi ; \
	if [ ! -e configure ] && [ -e autogen.sh ] ; then \
	  export ACLOCAL_PATH=$(PREFIX_PATH)/share/aclocal ; \
	 ./autogen.sh ; \
	fi ; \
	if [ ! -e Makefile ] ; then \
	  [ "`uname`"m == "IRIX64"m ] && [ "`domainname`"m == "bic"m ] && [ -f /usr/local/gnu/bin/ar ] && export PATH=/usr/local/gnu/bin:${PATH} ; \
	CGAL_MAKEFILE=${SOURCE_DIR}/${CGAL_PACKAGE}/make/`ls -1 ${SOURCE_DIR}/${CGAL_PACKAGE}/make | grep makefile_ | grep '[0-9]$$'`; \
	export GSL_CONFIG=$(PREFIX_PATH)/bin/gsl-config ; \
	 ./configure $(MINC_FLAG) --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) --with-cgal-makefile=$$CGAL_MAKEFILE PERL=${PERL} CFLAGS='${CFLAGS}' CPPFLAGS='${CPPFLAGS}' CXXFLAGS='${CXXFLAGS} -fpermissive'; \
	fi ; \
	${MAKE}; ${MAKE} install

#   +---------------+
#   |   PERL LIBS   |
#   +---------------+

$(PL_LIB):       $(PERLLIB_UNTAR)
	@if [ ! -e $(PL_LIB) ] ; then \
	  cd ${SOURCE_DIR}/${PERLLIB_PACKAGE}/ ; \
	  echo $(PREFIX_PATH)>yes  ; \
	  ${PERL} ./Makefile.PL PREFIX=$(PREFIX_PATH) INSTALLDIRS=site INSTALLSITELIB=$(PERL_PRIV) INSTALLSITEARCH=$(PERL_PRIV) INSTALLMAN1DIR=$(PREFIX_PATH) INSTALLMAN3DIR=$(PREFIX_PATH) < yes ; \
	  rm -f yes ; \
	  ${MAKE}; ${MAKE} install; \
	  touch $(PL_LIB) ; \
	fi

$(GETOPT):       $(GETOPT_UNTAR)
	@if [ ! -e $(GETOPT) ] ; then \
	  cd ${SOURCE_DIR}/${GETOPT_PACKAGE}/ ; \
	  ${PERL} ./Makefile.PL PREFIX=$(PREFIX_PATH) INSTALLDIRS=site INSTALLSITELIB=$(PERL_PRIV) INSTALLSITEARCH=$(PERL_PRIV) INSTALLMAN1DIR=$(PREFIX_PATH) INSTALLMAN3DIR=$(PREFIX_PATH) ; \
	  ${MAKE}; ${MAKE} install; \
	  touch $(GETOPT) ; \
	fi

$(PMP):          ${PMP_UNTAR}      ${PL_LIB}
	@if [ ! -e $(PMP) ] ; then \
	  cd ${SOURCE_DIR}/${PMP_PACKAGE}/ ; \
	  echo $(PREFIX_PATH)>yes  ; \
	  ${PERL} ./Makefile.PL PREFIX=$(PREFIX_PATH) INSTALLDIRS=site INSTALLSITELIB=$(PERL_PRIV) INSTALLSITEARCH=$(PERL_PRIV) INSTALLMAN1DIR=$(PREFIX_PATH) INSTALLMAN3DIR=$(PREFIX_PATH) < yes ; \
	  rm -f yes ; \
	  ${MAKE}; ${MAKE} install; \
	  touch $(PMP) ; \
	fi

$(ILT):          ${ILT_UNTAR}
	@if [ ! -e $(ILT) ] ; then \
	  cd ${SOURCE_DIR}/${ILT_PACKAGE}/ ; \
	  echo $(PREFIX_PATH)>yes  ; \
	  ${PERL} ./Makefile.PL PREFIX=$(PREFIX_PATH) INSTALLDIRS=site INSTALLSITELIB=$(PERL_PRIV) INSTALLSITEARCH=$(PERL_PRIV) INSTALLMAN1DIR=$(PREFIX_PATH) INSTALLMAN3DIR=$(PREFIX_PATH) < yes ; \
	  rm -f yes ; \
	  ${MAKE}; ${MAKE} install; \
	  mkdir -p $(PREFIX_PATH)/share/ILT; cp Documentation/Data/*.map $(PREFIX_PATH)/share/ILT; \
	  touch $(ILT) ; \
	fi

#   +-----------------------------------------------+
#   |   Extra BIC internal packages and libraries   |
#   +-----------------------------------------------+

# 
# Use this for the new brain-view-0.7.0 with Qt3.
#   	./configure $(MINC_FLAG) --disable-shared --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) ${CFG_COMP_FLAGS}; \
#
# Use this for the new brain-view-0.8.0 with Qt4.
#
#	   ./configure $(MINC_FLAG) --disable-shared --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) CFLAGS='${CFLAGS} -DQT3_SUPPORT' CPPFLAGS='${CPPFLAGS} -DQT3_SUPPORT' CXXFLAGS='${CXXFLAGS} -DQT3_SUPPORT' LDFLAGS='${LDFLAGS} -lQt3Support'; \
#

$(BRAINVIEW):	$(BRAINVIEW_UNTAR) $(M4_UNTAR) $(LIBBICINVENTOR) $(SOQT) $(SIMAGE)
	cd ${SOURCE_DIR}/${BRAINVIEW_PACKAGE}/ ; \
	export PATH=/usr/lib64/qt4/bin:${PATH} ; \
	if [ ! -d m4 ] ; then ln -fs ../m4 ./m4 ;fi ; \
	if [ ! -e Makefile ] ; then \
	   rm -rf textures/brain-view-config ; \
	   rm -rf src/brainEnvironment.cc ; \
	   rm -rf src/*.moc.cpp src/.deps/*.moc.* ; \
	   ./configure $(MINC_FLAG) --disable-shared --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) CFLAGS='${CFLAGS} -DQT3_SUPPORT -I/usr/include' CPPFLAGS='${CPPFLAGS} -DQT3_SUPPORT -I/usr/include' CXXFLAGS='${CXXFLAGS} -DQT3_SUPPORT -I/usr/include' LDFLAGS=${BRAINVIEWLDFLAGS}; \
	fi ; \
	${MAKE}; ${MAKE} install ; \
	echo Texturedir: '$$'BRAINVIEW > $(BUILD_PATH)/share/brain-view/brain-view-config ; \
	echo Texture: spectral.rgb >> $(BUILD_PATH)/share/brain-view/brain-view-config ;

$(MNIDISPLAY):      $(DISPLAY_UNTAR)  $(LIBBICPL)
	cd ${SOURCE_DIR}/${DISPLAY_PACKAGE}/ ; \
	if [ ! -e Makefile ] ; then \
	 ./configure $(MINC_FLAG) --prefix=$(PREFIX_PATH) LDFLAGS='${VIEWER_LDFLAGS}' ${VIEWER_OPTS} CFLAGS='${CFLAGS}' CPPFLAGS='${CPPFLAGS} -I${BUILD_PATH}/include' CXXFLAGS='${CXXFLAGS}'; \
	fi ; \
	${MAKE}; ${MAKE} install

$(GLIM):         ${GLIM_UNTAR}     ${LIBMINC}
	cd ${SOURCE_DIR}/${GLIM_PACKAGE}/ ; \
	if [ ! -e Makefile ] ; then \
	 ./configure $(MINC_FLAG) --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) ${CFG_COMP_FLAGS} ; \
	fi ; \
	${MAKE}; ${MAKE} install

$(EMMA):     $(EMMA_UNTAR)    $(LIBMINC)
	cd ${SOURCE_DIR}/${EMMA_PACKAGE}/ ; \
	${MAKE} MATLAB_ROOT=$(MATLAB_ROOT) MINCLIBPATH=-L$(PREFIX_PATH)/lib MINCINCPATH=-I$(PREFIX_PATH)/include MINC_BASE=$(MINC_BASE) CC=gcc ; \
	${MAKE} MATLAB_ROOT=$(MATLAB_ROOT) MATLAB_INSTALL_DIR=$(PREFIX_PATH)/emma BIN_INSTALL_DIR=$(PREFIX_PATH)/bin DOC_INSTALL_DIR=$(PREFIX_PATH)/doc/emma install

$(LIBBICINVENTOR):     $(BICINVENTOR_UNTAR)    $(LIBBICPL)   $(LIBPCREPP)  $(LIBOOBICPL) $(LIBCOIN)
	cd ${SOURCE_DIR}/${BICINVENTOR_PACKAGE}/ ; \
	if [ ! -e Makefile ] ; then \
	 ./configure $(MINC_FLAG) --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) --disable-debug ${CFG_COMP_FLAGS} ; \
	fi ; \
	${MAKE}; ${MAKE} install

$(LOBESEG):       $(LOBESEG_UNTAR)
	@if [ "$(ANIMAL)" == "yes" ] ; then \
	  cd ${SOURCE_DIR}/${LOBESEG_PACKAGE}/ ; \
	  if [ ! -e Makefile ] ; then \
	   ./configure --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH); \
	  fi ; \
	  PERL5LIB=${PERL_PRIV} ; export PERL5LIB  ; \
	  MINC_COMPRESS=${MINC_COMPRESS} ; export MINC_COMPRESS ; \
	  MINC_FORCE_V2=${MINC_FORCE_V2} ; export MINC_FORCE_V2 ; \
	  ${MAKE}; ${MAKE} install ; \
        fi
  
$(MRISIM):       $(MRISIM_UNTAR)   $(LIBMINC)
	@if [ "$(MRI_SIM)" == "yes" ] ; then \
	  cd ${SOURCE_DIR}/${MRISIM_PACKAGE}/ ; \
	  if [ ! -e Makefile ] ; then \
	   ./configure $(MINC_FLAG) --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) ${CFG_COMP_FLAGS} ; \
	  fi ; \
	  ${MAKE}; ${MAKE} install ;\
	fi

$(QVAL):	$(QVAL_UNTAR)
	cd ${SOURCE_DIR}/ ; \
	mkdir -p $(R_LIBS) ; \
	R CMD INSTALL -l $(R_LIBS) qvalue

$(REGISTER):     $(REGISTER_UNTAR) $(LIBBICPL)
	cd ${SOURCE_DIR}/${REGISTER_PACKAGE}/ ; \
	if [ ! -e Makefile ] ; then \
	  ./configure $(MINC_FLAG) --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) LDFLAGS='${VIEWER_LDFLAGS}' ${VIEWER_OPTS} ${CFG_COMP_FLAGS}; \
	fi ; \
	${MAKE}; ${MAKE} install

$(RMINC):     $(RMINC_UNTAR) $(LIBMINC) $(QVAL)
	cd ${SOURCE_DIR}/ ; \
	mkdir -p $(R_LIBS) ; \
	R CMD INSTALL --configure-args='--with-build-path=$(BUILD_PATH)' -l $(R_LIBS) ${RMINC_PACKAGE}

# to build RMINC package.tar.gz, but it doesn't really work:
#export LDFLAGS=-L$(BUILD_PATH)/lib ;\
#export CPPFLAGS=-I$(BUILD_PATH)/include ;\
#R CMD build --no-vignettes ${RMINC_PACKAGE}

$(RSTAT):     $(RSTAT_UNTAR)
	cd ${SOURCE_DIR}/ ; \
	mkdir -p $(R_LIBS) ; \
	R CMD INSTALL --configure-args='--with-build-path=$(BUILD_PATH)' -l $(R_LIBS) ${RSTAT_PACKAGE}

$(STXSEG):       $(STXSEG_UNTAR)
	if [ "$(ANIMAL)" == "yes" ] ; then \
	  cd ${SOURCE_DIR}/${STXSEG_PACKAGE}/ ; \
	  if [ ! -e Makefile ] ; then \
	   ./configure --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH); \
	  fi ; \
	  PERL5LIB=${PERL_PRIV} ; export PERL5LIB  ; \
	  ${MAKE}; ${MAKE} install
	fi

#   +-----------------------------------------+
#   |   SPECIAL CASE BUILDS OF EXTERNAL LIBS  |
#   |   Make external libs static             |
#   +-----------------------------------------+

$(GGS): $(GGS_UNTAR)
	cd ${SOURCE_DIR}/${GGS_PACKAGE}/ ; \
	if [ ! -e Makefile ] ; then \
	  ./configure --prefix=$(PREFIX_PATH) ${CFG_COMP_FLAGS} CFLAGS='${CFLAGS} -DHAVE_SYS_TIME_H=1'; \
	fi ; \
	${MAKE}; ${MAKE} install

$(LIBBOOST):     $(BOOST_UNTAR)
	cd ${SOURCE_DIR}/${BOOST_PACKAGE} ; \
	echo If compilation aborts in BOOST, simply restart make. This is normal. ; \
	./bootstrap.sh ; \
	./bjam link=static threading=single --prefix=$(PREFIX_PATH) --builddir=$(BOOSTTMP) --with-serialization install ; \
	if [ -f ${LIBBOOST} ] ; then \
	  touch ${LIBBOOST} ; \
	fi ;

$(LIBCGAL):      $(CGAL_UNTAR) $(LIBBOOST)
	cd ${SOURCE_DIR}/${CGAL_PACKAGE} ; \
	./install_cgal --non-interactive --CXX g++ --disable-shared --without-autofind --with-BOOST --BOOST_INCL_DIR ${SOURCE_DIR}/${BOOST_PACKAGE}; \
	CGAL_OS_COMPILER=`ls -1 ${SOURCE_DIR}/${CGAL_PACKAGE}/make | grep makefile_ | grep '[0-9]$$' | sed -e 's/makefile_//'`; \
	cp -f ${SOURCE_DIR}/${CGAL_PACKAGE}/lib/$$CGAL_OS_COMPILER/libCGAL.a ${PREFIX_PATH}/lib/libCGAL.a ; \
	if [ -f  ${SOURCE_DIR}/${CGAL_PACKAGE}/lib/$$CGAL_OS_COMPILER/libCGAL.so ] ; then \
	  cp -f ${SOURCE_DIR}/${CGAL_PACKAGE}/lib/$$CGAL_OS_COMPILER/libCGAL.so ${PREFIX_PATH}/lib/libCGAL.so ;\
	fi ;\
	if [ -f  ${SOURCE_DIR}/${CGAL_PACKAGE}/lib/$$CGAL_OS_COMPILER/libCGAL.dylib ] ; then \
	  cp -f ${SOURCE_DIR}/${CGAL_PACKAGE}/lib/$$CGAL_OS_COMPILER/libCGAL.dylib ${PREFIX_PATH}/lib/libCGAL.dylib ;\
	fi
$(LIBCOIN):     $(COIN_UNTAR)
	cd ${SOURCE_DIR}/${COIN_PACKAGE}/ ; \
	if [ ! -e Makefile ] ; then \
	 ./configure --prefix=$(PREFIX_PATH) $(BIC_STATIC) --with-build-path=$(BUILD_PATH) --disable-debug LDFLAGS=${LDFLAGS} ${CFG_COMP_FLAGS} ; \
	fi ; \
	${MAKE}; ${MAKE} install

$(LIBHDF):       $(HDF_UNTAR)
	cd ${SOURCE_DIR}/${HDF_PACKAGE} ; \
	if [ ! -e config.cache ] ; then \
	  ./configure --disable-shared --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) ${CFG_COMP_FLAGS} ; \
	fi ; \
	${MAKE}; ${MAKE} install

# For <= 3.6.1
# cd ${SOURCE_DIR}/${NETCDF_PACKAGE}/src ; \
# ./configure --prefix=$(PREFIX_PATH) --without-F90 ${CFG_COMP_FLAGS} F90=false FC=false CXX=false CC=gcc; \
#
# For 3.6.2-beta6
# cd ${SOURCE_DIR}/${NETCDF_PACKAGE} ; \
# ./configure --prefix=$(PREFIX_PATH) --disable-f77 --disable-cxx --disable-examples --disable-utilities ${CFG_COMP_FLAGS} CC=gcc; \
#

$(LIBNETCDF): ${NETCDF_UNTAR}
	cd ${SOURCE_DIR}/${NETCDF_PACKAGE}/src ; \
	if  [ ! -e config.log ] ; then \
	 ./configure --prefix=$(PREFIX_PATH) --without-F90 ${CFG_COMP_FLAGS} F90=false FC=false CXX=false CC=gcc; \
	fi ; \
	${MAKE}; ${MAKE} install

$(LIBNETPBM):      $(NETPBM_UNTAR)
	cd ${SOURCE_DIR}/${NETPBM_PACKAGE}/ ; \
	if [ ! -e Makefile.config ] ; then \
	 echo "**************************************************************" ;\
	 echo "* You are about to configure netpbm for the CIVET quarantine *" ;\
	 echo "* Choose all defaults options except libraries=static,       *" ;\
	 echo "* Svgalib=none and X11=none.                                 *" ;\
	 echo "**************************************************************" ;\
	 ./configure ; \
	fi ; \
	${MAKE} --keep-going; \
	rm -rf ${PREFIX_PATH}/pbm ; \
	${MAKE} --keep-going package pkgdir=${PREFIX_PATH}/pbm/; \
	mv -f ${PREFIX_PATH}/pbm/link/* ${PREFIX_PATH}/lib ; \
	mv -f ${PREFIX_PATH}/pbm/include/* ${PREFIX_PATH}/include ; \
	rm -rf ${PREFIX_PATH}/pbm

$(LIBGSL):       ${GSL_UNTAR}
	cd ${SOURCE_DIR}/${GSL_PACKAGE} ; \
	if [ ! -e Makefile ] ; then \
	 ./configure --enable-shared=no --enable-static=yes --enable-maintainer-mode --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) ${CFG_COMP_FLAGS} ; \
	fi ; \
	${MAKE} ; ${MAKE} install

$(LIBPCRE):      $(PCRE_UNTAR)
	cd ${SOURCE_DIR}/${PCRE_PACKAGE}/ ; \
	if [ ! -e Makefile ] ; then \
	 ./configure --enable-shared=no --enable-static=yes --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) ${CFG_COMP_FLAGS}; \
	fi ; \
	${MAKE}; ${MAKE} install

$(LIBPCREPP):    $(PCREPP_UNTAR)   $(LIBPCRE)
	cd ${SOURCE_DIR}/${PCREPP_PACKAGE}/ ; \
	if [ ! -e Makefile ] ; then \
	 ./configure --disable-shared --prefix=$(PREFIX_PATH) --with-build-path=$(BUILD_PATH) --with-pcre-lib=$(PREFIX_PATH)/lib --with-pcre-include=$(PREFIX_PATH)/include ${CFG_COMP_FLAGS}; \
	fi ; \
	${MAKE}; ${MAKE} install

$(SIMAGE):     $(SIMAGE_UNTAR)
	cd ${SOURCE_DIR}/${SIMAGE_PACKAGE} ; \
	if [ ! -e Makefile ] ; then \
	 ./configure --prefix=$(PREFIX_PATH) $(BIC_STATIC) --with-build-path=$(BUILD_PATH) --without-png; \
	fi ; \
	${MAKE}; ${MAKE} install

#QTINC=/usr/lib64/qt4/include ; export QTINC ; \
#QTDIR=/usr/lib64/qt4 ; export QTDIR ; \
#QTLIB=/usr/lib64/qt4/lib64 ; export QTLIB ; \

$(SOQT):     $(SOQT_UNTAR) $(LIBCOIN)
	cd ${SOURCE_DIR}/${SOQT_PACKAGE} ; \
	QTINC=/usr/include ; export QTINC ; \
	QTDIR=/usr/lib64/qt4 ; export QTDIR ; \
	QTLIB=/usr/lib64 ; export QTLIB ; \
	export PATH=/usr/lib64/qt4/bin:${PATH} ; \
	if [ ! -e Makefile ] ; then \
	 ./configure --prefix=$(PREFIX_PATH) $(BIC_STATIC) --with-build-path=$(BUILD_PATH); \
	fi ; \
	${MAKE}; ${MAKE} install

#   +-----------------------------------------+
#   |   External packages (not a library)     |
#   +-----------------------------------------+

$(IMAGEMAGICK): $(IMAGEMAGICK_UNTAR) $(GGS)
	if [ "$(MAGICK)" == "yes" ] ; then \
	  cd ${PREFIX_PATH}/share/ ; ${GTAR} ${GTAR_FLAGS} ${TRUEFONT_TAR} ; \
	  cd ${SOURCE_DIR}/${IMAGEMAGICK_PACKAGE}/ ; \
	  if [ ! -e Makefile ] ; then \
	    ./configure --prefix=$(PREFIX_PATH) --disable-openmp --without-threads --enable-delegate-build --with-gs-font-dir=$(PREFIX_PATH)/share/fonts/default/Type1/ --with-fontconfig=yes --with-freetype=yes --with-gvc=no ${CFG_COMP_FLAGS}; \
	  fi ; \
	  ${MAKE}; ${MAKE} install ; \
	  rm ${PREFIX_PATH}/bin/display; \
	fi

#   +-----------------------------------------+
#   |	make the required environment file   |
#   +----------------------------------------+

${ENV_FILES}:
	@./mk_environment.pl ${PREFIX_PATH} ${CIVET_VERS}
	@echo making ${PREFIX_PATH}/init.sh
	@echo making ${PREFIX_PATH}/init.csh

#     +-------------+
#     |  SHORTCUTS  |
#     +-------------+
ILT           :  $(ILT)
ilt           :  $(ILT)
N3            :  $(N3)
n3            :  $(N3)
PMP           :  $(PMP)
pmp           :  $(PMP)
adni          :  $(ADNI)
arguments     :  $(LIBARGS)
autoreg       :  $(AUTOREG)
avg305        :  $(AVG305)
bicInventor   :  $(LIBBICINVENTOR)
bicpl         :  $(LIBBICPL)
boost         :  $(LIBBOOST)
brainview     :  $(BRAINVIEW)
cgal          :  $(LIBCGAL)
civet         :  $(CIVET) 
clasp         :  $(CLASP) 
classify      :  $(CLASSIFY)
coin          :  $(LIBCOIN)
colin27       :  $(COLIN27)
conglomerate  :  $(CONGLOMERATE)
cortex_area   :  $(CAREA)
cortical      :  $(CORTICAL)
display       :  $(MNIDISPLAY)
ebtks         :  $(LIBEBTKS)
emma          :  $(EMMA)
getopt        :  $(GETOPT)
ggs           :  $(GGS)
glim          :  $(GLIM)
gsl           :  $(LIBGSL)
hdf           :  $(LIBHDF)
icbm152       :  $(ICBM152)
icbm152nl     :  $(ICBM152NL)
icbm152nl09   :  $(ICBM152NL09)
icbmtemplate  :  $(ICBMTEMP)
imagemagick   :  $(IMAGEMAGICK)
inormalize    :  $(INORM)
laplace       :  $(LAPLACE)
lobesegment   :  $(LOBESEG)
m4            :  $(M4_UNTAR)
minc          :  $(LIBMINC)
mincbet       :  $(MINCBET)
mrisim        :  $(MRISIM)
perllib       :  ${PL_LIB}
netcdf        :  $(LIBNETCDF)
netpbm        :  $(LIBNETPBM)
oobicpl       :  $(LIBOOBICPL)
pcre          :  $(LIBPCRE)
pcrepp        :  $(LIBPCREPP)
pve           :  $(PVE)
qvalue        :  $(QVAL)
raytrace      :  $(RAY_TRACE)
register      :  $(REGISTER)
rminc         :  $(RMINC)
rstat         :  $(RSTAT)
simage        :  $(SIMAGE)
soqt          :  $(SOQT)
stxsegment    :  $(STXSEG)
surfreg       :  $(SURFREG)

inits         :  ${ENV_FILES}

utils         :  perllib getopt PMP ILT m4
mnilibs       :  minc ebtks bicpl oobicpl
models        :  adni avg305 colin27 icbm152 icbm152nl icbm152nl09
avg305vbm     :  ${AVG305VBM}

main          :  utils N3 autoreg clasp classify conglomerate \
                 cortex_area cortical inormalize laplace \
                 mincbet pve raytrace surfreg models \
                 icbmtemplate avg305vbm inits lobesegment mrisim

visual        :  register display brainview

#     +-----------------------------------------------------+
#     |  DELETION OF THE OBJECTS FILES OF THE MAIN PROGRAM  |
#     +-----------------------------------------------------+
#
remove_target:
	rm -f $(ADNI) \
	rm -f $(AUTOREG) \
	rm -f $(AVG305) \
	rm -f $(BRAINVIEW) \
	rm -f $(CAREA) \
	rm -f $(CIVET) \
	rm -f $(CLASP) \
	rm -f $(CLASSIFY) \
	rm -f $(LIBCOIN) \
	rm -f $(COLIN27) \
	rm -f $(CONGLOMERATE) \
	rm -f $(CORTICAL) \
	rm -f $(MNIDISPLAY) \
	rm -f $(GETOPT) \
	rm -f $(GGS) \
	rm -f $(GLIM) \
	rm -f $(GSL) \
	rm -f $(ICBM152) \
	rm -f $(ICBM152NL) \
	rm -f $(ICBM152NL09) \
	rm -f $(ICBMTEMP) \
	rm -f $(ILT) \
	rm -f $(IMAGEMAGICK) \
	rm -f $(INORM) \
	rm -f $(LAPLACE) \
	rm -f $(LIBARGS) \
	rm -f $(LIBBICINVENTOR) \
	rm -f $(LIBBICPL) \
	rm -f $(LIBBOOST) \
	rm -f $(LIBCGAL) \
	rm -f $(LIBEBTKS) \
	rm -f $(EMMA) \
	rm -f $(LIBGSL) \
	rm -f $(LIBHDF) \
	rm -f $(LIBMINC) \
	rm -f $(LIBNETCDF) \
	rm -f $(LIBOOBICPL) \
	rm -f $(LIBPCRE) \
	rm -f $(LIBPCREPP) \
	rm -f $(LOBESEG) \
	rm -f $(M4_UNTAR) \
	rm -f $(MINCBET) \
	rm -f $(MRISIM) \
	rm -f $(N3) \
	rm -f $(LIBNETPBM) \
	rm -f ${PL_LIB} \
	rm -f $(PMP) \
	rm -f $(PVE) \
	rm -f $(QVAL) \
	rm -f $(RAY_TRACE) \
	rm -f $(REGISTER) \
	rm -f $(RMINC) \
	rm -f $(RSTAT) \
	rm -f $(SIMAGE) \
	rm -f $(SOQT) \
	rm -f $(STXSEG) \
	rm -f $(SURFREG)

flush: clean remove_target

clean:
	cd ${SOURCE_DIR}/${ADNI_PACKAGE}   		; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${ARGS_PACKAGE}   		; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${AUTOREG_PACKAGE}   		; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${AVG305_PACKAGE}/		; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${BET_PACKAGE}/           	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${BICINVENTOR_PACKAGE}/          	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${BOOST_PACKAGE}               ; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${BICPL_PACKAGE}/           	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${BRAINVIEW_PACKAGE}/		; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${CAREA_PACKAGE}/         	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${NETCDF_PACKAGE}/src       	; ${MAKE} clean ; rm -f macros.make  ;\
	cd ${SOURCE_DIR}/${CGAL_PACKAGE}		; ${MAKE} clean ; rm -f config.log  ;\
	cd ${SOURCE_DIR}/${CIVET_PACKAGE}/         	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${CLASP_PACKAGE}/         	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${CLASSIFY_PACKAGE}/          	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${COIN_PACKAGE}/          	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${COLIN27_PACKAGE}/		; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${CONGLOMERATE_PACKAGE}/  	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${CSURFACE_PACKAGE}/    	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${DISPLAY_PACKAGE}/        	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${EBTKS_PACKAGE}   		; ${MAKE} clean ; rm -f config.cache  ;\
	cd ${SOURCE_DIR}/${EMMA_PACKAGE}   		; ${MAKE} clean ;\
	cd ${SOURCE_DIR}/${GETOPT_PACKAGE}/ 	 	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${GGS_PACKAGE}                 ; ${MAKE} clean ; rm -f config.cache  ;\
	cd ${SOURCE_DIR}/${GSL_PACKAGE}                 ; ${MAKE} clean ; rm -f config.cache  ;\
	cd ${SOURCE_DIR}/${HDF_PACKAGE}              	; ${MAKE} clean ; rm -f config.cache  ;\
	cd ${SOURCE_DIR}/${ILT_PACKAGE}/              	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${IMAGEMAGICK_PACKAGE}/        ; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${INORM_PACKAGE}/          	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${LOBESEG_PACKAGE}   		; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${LAPLACE_PACKAGE}/ 		; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${MINC_PACKAGE}/           	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${MRISIM_PACKAGE}/          	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${N3_PACKAGE}/          	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${NETPBM_PACKAGE}/          	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${ICBM152_PACKAGE}/		; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${ICBM152NL_PACKAGE}/		; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${ICBM152NL09_PACKAGE}/	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${ICBMTEMP_PACKAGE}/		; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${PERLLIB_PACKAGE}/     	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${SURFREG_PACKAGE}/   		; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${OOBICPL_PACKAGE}/          	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${PCRE_PACKAGE}             	; ${MAKE} clean ; rm -f config.cache  ;\
	cd ${SOURCE_DIR}/${PCREPP_PACKAGE}         	; ${MAKE} clean ; rm -f config.cache ;\
	cd ${SOURCE_DIR}/${PMP_PACKAGE}/               	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${REGISTER_PACKAGE}/      	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${PVE_PACKAGE}/                ; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${QVAL_PACKAGE}/               ; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/${RAY_TRACE_PACKAGE}/    	; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi ;\
	cd ${SOURCE_DIR}/   				; R CMD REMOVE ${RMINC_PACKAGE}  ;\
	cd ${SOURCE_DIR}/   				; R CMD REMOVE ${RSTAT_PACKAGE}  ;\
	cd ${SOURCE_DIR}/${SIMAGE_PACKAGE}   		; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi
	cd ${SOURCE_DIR}/${SOQT_PACKAGE}   		; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi
	cd ${SOURCE_DIR}/${STXSEG_PACKAGE}   		; if [ -e Makefile ] ; then ; ${MAKE} distclean ;  rm -f Makefile ; fi

