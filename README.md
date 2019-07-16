# Welcome to the CIVET building page.

## Overview

Before you continue, please make sure to review the license agreement: [CIVET Liscense](https://github.com/aces/CIVET_Full_Project).

If you are only interested in installing CIVET binaries only without the trouble of compiling 
CIVET from sources, you can obtain binaries for some common systems on the [CIVET main page](http://www.bic.mni.mcgill.ca/ServicesSoftware/CIVET-2-1-0-Source-Code-Access-and-Binaries) 
(available soon).

At this point, the following versions are available:

* CIVET-2.1.0 - released in Oct 2016 (Ubuntu 14 and CentOS 6).
* CIVET-2.1.1 - released in Dec 2018 (Ubuntu 16, 18 and CentOS 7).

The compilation procedure is the same for all versions of CIVET.

## Download CIVET from GitHub

If you really wish to continue and compile CIVET from GitHub sources, you need follow the
instructions before download:

#### 1 - Make sure you install Git LFS extension
To download CIVET's "large" files (e.g. *.tar.gz, *.tgz, *.mnc, *.obj) from GIT sources, you need to install the [Git Large File Storage](https://git-lfs.github.com/) extension. Please follow the URL (https://git-lfs.github.com/) to obtain the installation guide. 

After you finish the installation, please run in your terminal:
```bash
git lfs
```

If the **stdout** is like
```
git lfs <command> [<args>]

Git LFS is a system for managing and versioning large files in
association with a Git repository.  Instead of storing the large files
within the Git repository as blobs, Git LFS stores special "pointer
files" in the repository, while storing the actual file contents on a
Git LFS server.  The contents of the large file are downloaded
automatically when needed, for example when a Git branch containing
the large file is checked out.
```

Your installation of Git-LFS should be successful.

#### 2 - Make sure you connect to GitHub with SSH
As CIVET will automatically download all source code for the some acelab/BIC packages from GitHub via SSH, please make sure you can connect to GitHub with SSH. 

You can test it by using
```bash
git clone git@github.com:aces/CIVET_Full_Project.git
```

If it does not work, please follow [Generating a new SSH key and adding it to the ssh-agent](https://help.github.com/en/enterprise/2.15/user/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent) to create your SSH connection.

#### 3 - Filelist of CIVET_Full_Project
In this repo (CIVET_Full_Project), we include
* install.sh 
* Makefile 
* mk_environment.pl 
* Test folder (MINC image to test CIVET)
* TGZ folder

The TGZ folder contains external packages (.tar.gz) not developed at the acelab/BIC (like HDF5, netcdf, Boost, etc). These versions in TGZ have been tested with the current version of CIVET and they work. You should not replace them with newer versions without testing and validation.

#### 4 - Select the appropriate CIVET version.

* CIVET-2.1.0 builds on older system like Ubuntu 14 and CentOS6,
  but it will not run unless you have an older version of PERL.
*  CIVET-2.1.1 builds on newer systems like Ubuntu 16, 18 and
  CentOS 6, 7, using most gcc versions. This version runs with
  the latest version of PERL. The only notable difference 
  between 2.1.0 and 2.1.1 is that the latter performs an 
  intensity normalization on the t1w image prior to non-uniformity
  corrections, which does affect the outcome of the pipeline. We
  do recommend to use CIVET-2.1.1.

You can find the tag for specific version in **branch** drop-down menu (e.g. CIVET_2_1_1 for CIVET-2.1.1).

After you select the proper version (e.g. CIVET-2.1.1), you can down CIVET Install Script, Makefile, Externel Packages and testing images by using the following command
```
git lfs clone --branch CIVET_2_1_1 git@github.com:aces/CIVET_Full_Project.git
```
**Note**: Please **DO NOT** download the ZIP file of 'CIVET_Full_Project'! It would not download all external packages which are uploaded using LFS format.

## Building CIVET on Your Machine

#### 1 - Check Building Requirements
Before compiling, make sure that the necessary system requirements are satisfied:
* Ubuntu/Debian:
```bash
sudo apt-get install build-essential
sudo apt-get install libz-dev libjpeg-dev libpng-dev libtiff-dev \
    liblcms2-dev flex libx11-dev freeglut3-dev \
    libxmu-dev libxi-dev libqt4-dev imagemagick gnuplot
```

* CentOS:
```bash
yum groupinstall 'Development Tools'
yum install zlib-devel libjpeg-devel libpng-devel libtiff-devel \
    lcms2-devel which cpan libX11-devel freeglut-devel \
    perl-Env perl-Perl4-CoreLibs gnuplot imagemagick \
cpan install ExtUtils::MakeMaker
```

    Some of these graphical libraries may not be required, but they
    have been added in the list, for completeness, if you wish to 
    compile the extra visualization tools.

#### 2 - Review Install Script
You are now ready to compile from GIT sources. Make sure the following variables are set in the script install.sh.
```bash
ANIMAL=no
MRISIM=no
MAGICK=no
GIT=yes
CVS=no
...
make PREFIX_PATH=$INSTALL_DIR USE_GIT=$GIT USE_CVS=$CVS netpbm
make PREFIX_PATH=$INSTALL_DIR ANIMAL=$ANIMAL MRI_SIM=$MRISIM \
    USE_GIT=$GIT USE_CVS=$CVS main
make PREFIX_PATH=$INSTALL_DIR ANIMAL=$ANIMAL MRI_SIM=$MRISIM \
    USE_GIT=$GIT USE_CVS=$CVS civet inits
```

**NOTE**: We do no provide ANIMAL support in this open-source version.

#### 3 - Set Default Terminal to Bash
Please check whether your default terminal is bash, run
```bash
echo $SHELL
```

The **stdout** should be 
```
/bin/bash
```

If not, you can use **chsh** or change softlink of /bin/sh to change it.

#### 4 - Build Your CIVET
Simply run 
```
./install.sh
```

* You will be first prompted to enter values for the compilation of netpbm.
Choose the static build. Accept defaults for the z-library. Choose
"none" for all graphics support libraries (png, jpg, X11, svga, etc).

* At the end of compilation, you should have 396 files in the
Linux-x86_64/bin directory (for CIVET-2.1.1).

#### 5 - Test Your CIVET

The install.sh script will produce the file job_test. You should run the regression test to make sure that CIVET runs properly.
```bash
./job_test
```

## Generate Source Codes' and Binary Packages
Once you are done building CIVET from sources, you can package the binaries and archive the sources:
* Package the binaries (add this line to install.sh):
```
make PREFIX_PATH=$INSTALL_DIR USE_GIT=$GIT USE_CVS=$CVS binaries
```

This will produce the output civet-2.1.1-binaries.tar.gz.
    
* Archive the sources (add this line to install.sh):
```
make PREFIX_PATH=$INSTALL_DIR USE_GIT=$GIT USE_CVS=$CVS source_packages
```

This will produce the output civet-2.1.1-cdrom.tar.gz.

The binaries can be copied and installed on other systems.
The archive of the sources can be used to recompile based on the packages saved as .tar.gz in TGZ.

## Load the CIVET environment into your path (Installation)
Just run in *your CIVET_Full_Project* folder.
```
cd your_CIVET_Full_Project
source Linux-x86_64/init.sh
```