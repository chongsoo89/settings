# This file includes settings for alias, intel compiler settings and so on.
# If you want to use this file, write below lines in the ~/.bashrc file.
#
# if [ -f ~/this_folder_dir/bashrc ]; then
#   . ~/this_folder_dir/bashrc
# fi

# Alias settings
alias ll='ls -lh'
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
  source /opt/intel/parallel_studio_xe_2019/bin/psxevars.sh
  export I_MPI_CC=icc
  export I_MPI_CXX=icpc
  export I_MPI_FC=ifort
  #export I_MPI_F77=ifort
  export I_MPI_F90=ifort
fi

# Library version
export HDF5_VERSION=1.10.5
export CGNS_VERSION=3.4.0
export PARMETIS_VERSION=4.0.3
export BOOST_VERSION=1.61.0
export BLAZE_VERSION=3.1

# HDF5 for cmake
export HDF5_DIR=/opt/lib_$COMPILER/hdf5/$HDF5_VERSION/share/cmake
export PATH=/opt/lib_$COMPILER/hdf5/$HDF5_VERSION/bin:$PATH
export INCLUDE=/opt/lib_$COMPILER/hdf5/$HDF5_VERSION/include:$INCLUDE
export LIB=/opt/lib_$COMPILER/hdf5/$HDF5_VERSION/lib:$LIB

# CGNS for cmake
export PATH=/opt/lib_$COMPILER/cgns/$CGNS_VERSION/bin/cgnstools:$PATH
export PATH=/opt/lib_$COMPILER/cgns/$CGNS_VERSION/bin:$PATH
export INCLUDE=/opt/lib_$COMPILER/cgns/$CGNS_VERSION/include:$INCLUDE
export LIB=/opt/lib_$COMPILER/cgns/$CGNS_VERSION/lib:$LIB

# ParMETIS for cmake
export PATH=/opt/lib_$COMPILER/parmetis/$PARMETIS_VERSION/bin:$PATH
export INCLUDE=/opt/lib_$COMPILER/parmetis/$PARMETIS_VERSION/include:$INCLUDE
export LIB=/opt/lib_$COMPILER/parmetis/$PARMETIS_VERSION/lib:$LIB

# Linux standard environment variables
export CPATH=$INCLUDE:$CPATH
export LIBRARY_PATH=$LIB:$LIBRARY_PATH
export LD_LIBRARY_PATH=$LIB:$LD_LIBRARY_PATH

# Boost
export CPATH=$CPATH:/opt/lib_$COMPILER/boost/$BOOST_VERSION/include
export LIBRARY_PATH=$LIBRARY_PATH:/opt/lib_$COMPILER/boost/$BOOST_VERSION/lib
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/lib_$COMPILER/boost/$BOOST_VERSION/lib

# Blaze
export CPATH=$CPATH:/opt/lib_$COMPILER/blaze/$BLAZE_VERSION/include
