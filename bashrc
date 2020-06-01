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
export COMPILER=gcc
#export COMPILER=intel

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
#export HDF5_VERSION=1.10.5
export CGNS_VERSION=3.4.0
export PARMETIS_VERSION=4.0.3

export LIB_LOCATION=/opt/lib_$COMPILER

# HDF5 for cmake
#export HDF5_DIR=$LIB_LOCATION/hdf5/$HDF5_VERSION/share/cmake
#export PATH=$LIB_LOCATION/hdf5/$HDF5_VERSION/bin:$PATH
#export INCLUDE=$LIB_LOCATION/hdf5/$HDF5_VERSION/include:$INCLUDE
#export LIB=$LIB_LOCATION/hdf5/$HDF5_VERSION/lib:$LIB

# CGNS for cmake
export PATH=$LIB_LOCATION/cgns/$CGNS_VERSION/bin:$PATH
export INCLUDE=$LIB_LOCATION/cgns/$CGNS_VERSION/include:$INCLUDE
export LIB=$LIB_LOCATION/cgns/$CGNS_VERSION/lib:$LIB

# ParMETIS for cmake
export PATH=$LIB_LOCATION/parmetis/$PARMETIS_VERSION/bin:$PATH
export INCLUDE=$LIB_LOCATION/parmetis/$PARMETIS_VERSION/include:$INCLUDE
export LIB=$LIB_LOCATION/parmetis/$PARMETIS_VERSION/lib:$LIB

# RapidJson for cmake
#export INCLUDE=$LIB_LOCATION/rapidjson/include:$INCLUDE

# Linux standard environment variables
export CPATH=$INCLUDE:$CPATH
export LIBRARY_PATH=$LIB:$LIBRARY_PATH
export LD_LIBRARY_PATH=$LIB:$LD_LIBRARY_PATH
