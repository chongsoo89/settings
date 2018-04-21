# This file includes settings for alias, intel compiler settings and so on.
# If you want to use this file, write below lines in the ~/.bashrc file.
#
# if [ -f ~/this_folder_dir/bashrc ]; then
#   . ~/this_folder_dir/bashrc
# fi

# Alias settings
alias ll='ls -l'
alias rm='rm -i'
alias rcp='rsync -avP'
alias tart='tar tvvzf'
alias tarc='tar cvvzf'
alias tarx='tar xvvzf'

# Stach & core file size
#ulimit -s unlimited
#ulimit -c unlimited

# Library setting
#export COMPILER=gcc
export COMPILER=intel

# Intel compiler and MPI setting
if [ "$COMPILER" = intel ]; then
  source /opt/intel/bin/compilervars.sh intel64
  export I_MPI_CC=icc
  export I_MPI_CXX=icpc
  export I_MPI_FC=ifort
  export I_MPI_F77=ifort
  export I_MPI_F90=ifort
fi

# Library version
export METIS_VERSION=5.1.0
export PARMETIS_VERSION=4.0.3
export SZIP_VERSION=2.1.1
export HDF5_VERSION=1.8.20
export CGNS_VERSION=3.3.1
export BOOST_VERSION=1.61.0
export BLAZE_VERSION=3.1

# Metis
export PATH=$PATH:/opt/lib_$COMPILER/metis/$METIS_VERSION/bin
export CPATH=$CPATH:/opt/lib_$COMPILER/metis/$METIS_VERSION/include
export LIBRARY_PATH=$LIBRARY_PATH:/opt/lib_$COMPILER/metis/$METIS_VERSION/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/lib_$COMPILER/metis/$METIS_VERSION/lib

# Parmetis
export PATH=$PATH:/opt/lib_$COMPILER/parmetis/$PARMETIS_VERSION/bin
export CPATH=$CPATH:/opt/lib_$COMPILER/parmetis/$PARMETIS_VERSION/include
export LIBRARY_PATH=$LIBRARY_PATH:/opt/lib_$COMPILER/parmetis/$PARMETIS_VERSION/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/lib_$COMPILER/parmetis/$PARMETIS_VERSION/lib

# SZIP
export CPATH=$CPATH:/opt/lib_$COMPILER/szip/$SZIP_VERSION/include
export LIBRARY_PATH=$LIBRARY_PATH:/opt/lib_$COMPILER/szip/$SZIP_VERSION/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/lib_$COMPILER/szip/$SZIP_VERSION/lib

# HDF5
export PATH=$PATH:/opt/lib_$COMPILER/hdf5/$HDF5_VERSION/bin
export CPATH=$CPATH:/opt/lib_$COMPILER/hdf5/$HDF5_VERSION/include
export LIBRARY_PATH=$LIBRARY_PATH:/opt/lib_$COMPILER/hdf5/$HDF5_VERSION/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/lib_$COMPILER/hdf5/$HDF5_VERSION/lib

# CGNS
export PATH=$PATH:/opt/lib_$COMPILER/cgns/$CGNS_VERSION/bin
export PATH=$PATH:/opt/lib_$COMPILER/cgns/$CGNS_VERSION/bin/cgnstools
export CPATH=$CPATH:/opt/lib_$COMPILER/cgns/$CGNS_VERSION/include
export LIBRARY_PATH=$LIBRARY_PATH:/opt/lib_$COMPILER/cgns/$CGNS_VERSION/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/lib_$COMPILER/cgns/$CGNS_VERSION/lib

# Boost
export CPATH=$CPATH:/opt/lib_$COMPILER/boost/$BOOST_VERSION/include
export LIBRARY_PATH=$LIBRARY_PATH:/opt/lib_$COMPILER/boost/$BOOST_VERSION/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/lib_$COMPILER/boost/$BOOST_VERSION/lib

# Blaze
export CPATH=$CPATH:/opt/lib_$COMPILER/blaze/$BLAZE_VERSION/include
