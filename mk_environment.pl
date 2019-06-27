#! /usr/bin/env perl

#
# Create the files init.sh and init.csh for known configurations:
#          DEFAULT  => This is the interactive mode
#          MNIBIC   => This is the SGE installation at the BIC
#          ZEALOUS  => This is the PBS torque installation at ACE LAB
#          NOEL     => This is the SGE installation at the NOEL lab (BIC)
#          ZLAB     => This is the SGE installation at the Zatorre Lab (McGill)
#          CLUMEQ   => This is the Moab installation (pbs) on krylov (obsolete)
#        GUILLIMIN  => This is the Moab installation (pbs) on guillimin (obsolete)
#          COLOSSE  => This is the SGE installation on colosse (CLUMEQ, Laval)(obsolete)
#          RQCHP    => This is the PBS installation on mammouth serie-2 (obsolete)
#          GRAHAM   => This is the SLURM installation on graham.computecanada.ca
#          CEDAR    => This is the SLURM installation on cedar.computecanada.ca 
#          MP2B     => This is the SLURM installation on mp2b.computecanada.ca 
#          NIH      => This is the installation on biowulf (NIH)
#          NUPPI    => This is the installation on nuppi (Kuopio, Finland)
#          JUDGE    => This is the installation on Judge (Juelich) (obsolete)
#          JUROPA   => This is the installation on Juropa (Juelich) (obsolete)
#          JURECA   => This is the installation on Jureca (Juelich)
# These sites are identified from their domain name or machine name.
# Since installations of SGE and PBS vary too much from site to site,
# it is not possible to have generic setups for these grids. Any other 
# configuration must be coded in this file and in the main script of 
# CIVET (CIVET_Processing_Pipeline). 
#

#
# Copyright Alan C. Evans
# Professor of Neurology
# McGill University
#

use strict;
use File::Basename;
use File::Spec;
use File::Temp qw/ tempdir /;

my $me = &basename($0);
my $Usage = "Usage: $me prefix version\n" .
            "  prefix            PREFIX directory for installation\n" .
            "  version           CIVET version\n" .
            "Output will be prefix/init.sh and prefix/init.csh\n\n";

die $Usage if( !( $#ARGV == 0 || $#ARGV == 1 ) );
my $prefix = shift;
my $version = shift;

my %GridConf = ( 'DEFAULT'  => { # This is the interactive mode
                                 'grid' => "spawn",
                                 'path' => undef,
                                 'command' => undef,
                                 'site_id' => undef },
                 # Must come before MNIBIC since both have same domain name.
                 # Oops! a bit tricky. These tags come in random order.
                 'NOEL'     => { # This is the SGE installation at the NOEL lab
                                 'grid' => "sge",
                                 'path' => ( $ENV{'SGE_ROOT'} && $ENV{'SGE_CELL'} ) ? 
                                           "$ENV{'SGE_ROOT'}/$ENV{'SGE_CELL'}" :
                                           "/usr/sge/default",
                                 'command' => "uname -n",
                                 'site_id' => "pandarus" },
                 'MNIBIC'   => { # This is the SGE installation at the BIC
                                 'grid' => "sge",
                                 'path' => ( $ENV{'SGE_ROOT'} && $ENV{'SGE_CELL'} ) ? 
                                           "$ENV{'SGE_ROOT'}/$ENV{'SGE_CELL'}" :
                                           "/usr/sge/default",
                                 'command' => "domainname",
                                 'site_id' => "vamana" },
                 'ZEALOUS'  => { # This is the SGE installation on zealous
                                 'grid' => "sge",
                                 'path' => ( $ENV{'SGE_ROOT'} && $ENV{'SGE_CELL'} ) ? 
                                           "$ENV{'SGE_ROOT'}/$ENV{'SGE_CELL'}" :
                                           "/opt/grid_engine/default",
                                 'command' => "uname -n",
                                 'site_id' => "zealous" },
                 'ZLAB'     => { # This is the SGE installation at the ZLab.
                                 'grid' => "sge",
                                 'path' => ( $ENV{'SGE_ROOT'} && $ENV{'SGE_CELL'} ) ?
                                           "$ENV{'SGE_ROOT'}/$ENV{'SGE_CELL'}" :
                                           "/usr/sge/default",
                                 'command' => "uname -n",
                                 'site_id' => "oliver" },
                 'CLUMEQ'   => { # This is the Moab installation (pbs) on krylov 
                                 # (CLUMEQ, McGill)
                                 'grid' => "pbs",
                                 'path' => "/usr/local/bin",
                                 'command' => "uname -n",
                                 'site_id' => "krylov.clumeq.mcgill.ca" },
               'GUILLIMIN'  => { # This is the torque installation (pbs) on guillimin 
                                 # (CLUMEQ, McGill)
                                 'grid' => "pbs",
                                 'path' => "/opt/torque/x86_64/bin",
                                 'command' => "uname -n",
                                 'site_id' => "lg-1r" },
                 'COLOSSE'  => { # This is the Moab installation (pbs) on colosse (CLUMEQ, Laval)
                                 'grid' => "pbs",
                                 'path' => "/opt/moab/bin",
                                 'command' => "uname -n",
                                 'site_id' => "colosse" },
                 'RQCHP'    => { # This is the PBS installation on mammouth serie-2 
                                 # (RQCHP, Sherbrooke)
                                 'grid' => "pbs",
                                 'path' => "/opt/torque/bin",
                                 'command' => "uname -n",
                                 'site_id' => "ip03" },
                 'GRAHAM'   => { # This is the SLURM installation on Graham 
                                 # (Compute Canada, Waterloo)
                                 'grid' => "slurm",
                                 'path' => "/opt/software/slurm/bin/",
                                 'command' => "uname -n",
                                 'site_id' => "gra-" },
                 'CEDAR'    => { # This is the SLURM installation on Cedar 
                                 # (Compute Canada, Vancouver)
                                 'grid' => "slurm",
                                 'path' => "/opt/software/slurm/bin",
                                 'command' => "uname -n",
                                 'site_id' => "cedar" },
                 'MP2B'     => { # This is the SLURM installation on Mp2b 
                                 # (Compute Canada, Sherbrooke)
                                 'grid' => "slurm",
                                 'path' => "/opt/software/slurm/bin",
                                 'command' => "uname -n",
                                 'site_id' => "ip20" },
                 'KISTI'    => { # This is the PBS installation on KISTI
                                 # (KISTI, South Korea)
                                 'grid' => "pbs",
                                 'path' => "/usr/bin",
                                 'command' => "uname -n",
                                 'site_id' => "twn001.sdfarm.kr" },
                 'NIH'      => { # This is the installation on biowulf (NIH)
                                 'grid' => "pbs",
                                 'path' => "/usr/local/pbs/bin",
                                 'command' => "uname -n",
                                 'site_id' => "biowulf.nih.gov" },
                 'NUPPI'    => { # This is the installation on nuppi (Finland)
                                 'grid' => "sge",
                                 'path' => ( $ENV{'SGE_ROOT'} && $ENV{'SGE_CELL'} ) ?
                                           "$ENV{'SGE_ROOT'}/$ENV{'SGE_CELL'}" :
                                           "/usr/sge/default",
                                 'command' => "uname -n",
                                 'site_id' => "nuppi" },
                 'JUDGE'    => { # This is the installation on Judge (Juelich)
                                 'grid' => "pbs",
                                 'path' => "/opt/moab/bin",
                                 'command' => "uname -n",
                                 'site_id' => "judge" },
                 'JUROPA'   => { # This is the installation on Juropa (Juelich)
                                 'grid' => "pbs",
                                 'path' => "/opt/moab/bin.fzj",
                                 'command' => "domainname",
                                 'site_id' => "JuRoPA" },
                 'JURECA'   => { # This is the installation on Jureca (Juelich)
                                 'grid' => "slurm",
                                 'path' => "/opt/software/slurm/bin/",
                                 'command' => "uname -n",
                                 'site_id' => "jrl" },
               );

#########################################
# Determine local site for installation #
#########################################

my $local_site = "DEFAULT";
foreach my $site ( keys %GridConf ) {
  if( defined $GridConf{$site}{command} && defined $GridConf{$site}{site_id} ) {
    my $site_id = `$GridConf{$site}{command}`;
    chomp( $site_id );
    if( $site_id =~ m/$GridConf{$site}{site_id}/ ) {
      $local_site = $site;
      last;
    }
  }
}

#################################
# Make init file for sh and csh #
#################################

`mkdir -p $prefix` if( !( -e $prefix ) );
open SH_FILE, ">${prefix}/init.sh";
open CSH_FILE, ">${prefix}/init.csh";

# description

print SH_FILE "####################################################################\n";
print SH_FILE "# sh initialization file for BIC quarantine. (use = for sh)        #\n";
print SH_FILE "#   - set path                                                     #\n";
print SH_FILE "#   - set LD_LIBRARY_PATH for run-time libraries (likely obsolete) #\n";
print SH_FILE "#   - set MNI_DATAPATH for MNI models                              #\n";
print SH_FILE "#   - set PERL libraries                                           #\n";
print SH_FILE "#   - set R libraries                                              #\n";
print SH_FILE "#   - minc2 options                                                #\n";
print SH_FILE "#   - grid scheduler (SGE or PBS)                                  #\n";
print SH_FILE "####################################################################\n\n";

print CSH_FILE "####################################################################\n";
print CSH_FILE "# csh initialization file for BIC quarantine. (use == for csh)     #\n";
print CSH_FILE "#   - set path                                                     #\n";
print CSH_FILE "#   - set LD_LIBRARY_PATH for run-time libraries (likely obsolete) #\n";
print CSH_FILE "#   - set MNI_DATAPATH for MNI models                              #\n";
print CSH_FILE "#   - set PERL libraries                                           #\n";
print CSH_FILE "#   - set R libraries                                              #\n";
print CSH_FILE "#   - minc2 options                                                #\n";
print CSH_FILE "#   - grid scheduler (SGE or PBS)                                  #\n";
print CSH_FILE "####################################################################\n\n";

print SH_FILE "unset JUNKVAL\n";
print SH_FILE "declare JUNKVAL=\$(readlink -f \$\{BASH_SOURCE\[0\]\})\n";
print SH_FILE "MNIBASEPATH=`dirname \$JUNKVAL`\n";
print SH_FILE "unset JUNKVAL\n\n";

print CSH_FILE "unset JUNKVAL\n";
print CSH_FILE "set JUNKVAL=`readlink -f \$0`\n";
print CSH_FILE "set MNIBASEPATH=`dirname \$JUNKVAL`\n";
print CSH_FILE "unset JUNKVAL\n\n";

# path

if( defined( $version ) ) {
  print SH_FILE "CIVET=CIVET${version}\n\n";
  print CSH_FILE "setenv CIVET CIVET${version}\n\n";
  print SH_FILE "export PATH=\"\$MNIBASEPATH/\$CIVET/progs:\$MNIBASEPATH/bin:\"\$PATH\n\n";
  print CSH_FILE "setenv PATH \"\$MNIBASEPATH/\$CIVET/progs:\$MNIBASEPATH/bin:\"\$PATH\n\n";
} else {
  print SH_FILE "export PATH=\"\$MNIBASEPATH/bin:\"\$PATH\n\n";
  print CSH_FILE "setenv PATH \"\$MNIBASEPATH/bin:\"\$PATH\n\n";
}

# dynamic libs path
print SH_FILE "if [ -z \"\$LD_LIBRARY_PATH\" ]; then\n";
print SH_FILE "  export LD_LIBRARY_PATH=\"\$MNIBASEPATH/lib\"\n";
print SH_FILE "else\n";
print SH_FILE "  export LD_LIBRARY_PATH=\"\$MNIBASEPATH/lib:\"\$LD_LIBRARY_PATH\n";
print SH_FILE "fi\n\n";

print CSH_FILE "if ( ! \${?LD_LIBRARY_PATH} ) then\n";
print CSH_FILE "  setenv LD_LIBRARY_PATH \"\$MNIBASEPATH/lib\"\n";
print CSH_FILE "else\n";
print CSH_FILE "  setenv LD_LIBRARY_PATH \"\$MNIBASEPATH/lib:\"\$LD_LIBRARY_PATH\n";
print CSH_FILE "endif\n\n";

# path for MNI models
print SH_FILE "if [ -z \"\$MNI_DATAPATH\" ]; then\n";
print SH_FILE "  export MNI_DATAPATH=\"\$MNIBASEPATH/share\"\n";
print SH_FILE "else\n";
print SH_FILE "  export MNI_DATAPATH=\"\$MNIBASEPATH/share:\"\$MNI_DATAPATH\n";
print SH_FILE "fi\n\n";

print CSH_FILE "if ( ! \${?MNI_DATAPATH} ) then\n";
print CSH_FILE "  setenv MNI_DATAPATH \"\$MNIBASEPATH/share\"\n";
print CSH_FILE "else\n";
print CSH_FILE "  setenv MNI_DATAPATH \"\$MNIBASEPATH/share:\"\$MNI_DATAPATH\n";
print CSH_FILE "endif\n\n";

# path for MNI perl libs
print SH_FILE "if [ -z \"\$PERL5LIB\" ]; then\n";
print SH_FILE "  export PERL5LIB=\"\$MNIBASEPATH/perl\"\n";
print SH_FILE "else\n";
print SH_FILE "  export PERL5LIB=\"\$MNIBASEPATH/perl:\"\$PERL5LIB\n";
print SH_FILE "fi\n\n";

print CSH_FILE "if ( ! \${?PERL5LIB} ) then\n";
print CSH_FILE "  setenv PERL5LIB \"\$MNIBASEPATH/perl\"\n";
print CSH_FILE "else\n";
print CSH_FILE "  setenv PERL5LIB \"\$MNIBASEPATH/perl:\"\$PERL5LIB\n";
print CSH_FILE "endif\n\n";

# We need Format.pm to be installed and in the PERL5LIB path (needed by minchistory).
# If we find it, copy it into the quarantines; if not, issue a warning to install it.

my $ret = `which perldoc`;
if( -e $ret ) {
  $ret = `perldoc -lm Text::Format`; chomp( $ret );
  if( -e $ret ) {
    my $out = "${prefix}/perl/Text/Format/pm";
    if( !( -e $out ) ) {
      `mkdir -p $prefix/perl/Text` if( !( -e "$prefix/perl/Text" ) );
      `cp $ret $out`;
    }
  } else {
    print "Warning: Cannot find PERL Text::Format. You should install it.\n";
    print "Some tools like minchistory will not work properly without it.\n";
  }
} else {
  print "Warning: Cannot find PERL perldoc to check for Text::Format. You should install it.\n";
}

# path for R libs
print SH_FILE "if [ -z \"\$R_LIBS\" ]; then\n";
print SH_FILE "  export R_LIBS=\"\$MNIBASEPATH/R_LIBS\"\n";
print SH_FILE "else\n";
print SH_FILE "  export R_LIBS=\"\$MNIBASEPATH/R_LIBS:\"\$R_LIBS\n";
print SH_FILE "fi\n\n";

print CSH_FILE "if ( ! \${?R_LIBS} ) then\n";
print CSH_FILE "  setenv R_LIBS \"\$MNIBASEPATH/R_LIBS\"\n";
print CSH_FILE "else\n";
print CSH_FILE "  setenv R_LIBS \"\$MNIBASEPATH/R_LIBS:\"\$R_LIBS\n";
print CSH_FILE "endif\n\n";

# Disable volume caching in minc (for code integrity)
print SH_FILE "export VOLUME_CACHE_THRESHOLD=-1\n\n";
print CSH_FILE "setenv VOLUME_CACHE_THRESHOLD -1\n\n";

# Path for brain-view's config file
print SH_FILE "export BRAINVIEW=\"\$MNIBASEPATH/share/brain-view\"\n\n";
print CSH_FILE "setenv BRAINVIEW \"\$MNIBASEPATH/share/brain-view\"\n\n";

# Select minc2 with compression
print SH_FILE "export MINC_FORCE_V2=1\n";
print SH_FILE "export MINC_COMPRESS=4\n\n";
print CSH_FILE "setenv MINC_FORCE_V2 1\n";
print CSH_FILE "setenv MINC_COMPRESS 4\n\n";

# Add the GRID environment
if( $local_site ne "DEFAULT" ) {
  if( $GridConf{$local_site}{grid} eq "sge" ) {
    print SH_FILE "source $GridConf{$local_site}{path}/common/settings.sh\n\n";
    print CSH_FILE "source $GridConf{$local_site}{path}/common/settings.csh\n\n";
  } else {
    print SH_FILE "export PATH=\"$GridConf{$local_site}{path}:\"\$PATH\n\n";
    print CSH_FILE "setenv PATH \"$GridConf{$local_site}{path}:\"\$PATH\n\n";
  }
}

# Pass on GRID environment to CIVET via env variable
print SH_FILE "export CIVET_JOB_SCHEDULER=${local_site}\n\n";
print CSH_FILE "setenv CIVET_JOB_SCHEDULER ${local_site}\n\n";

# Path to mpirun for node filling ppn>1.
# if( $local_site eq "GUILLIMIN" ) {
#   print SH_FILE "module load openmpi/1.6.3-gcc\n\n";
#   print CSH_FILE "module load openmpi/1.6.3-gcc\n\n";
# }
# if( $local_site eq "COLOSSE" ) {
#   print SH_FILE "module load mpi/openmpi/1.6.5\n\n";
#   print CSH_FILE "module load mpi/openmpi/1.6.5\n\n";
# }

close SH_FILE;
close CSH_FILE;

