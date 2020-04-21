# Print current directory
export PS1="\u@\h:\w\$ "

# Alias settings
alias ll='ls -lh'
alias rm='rm -i'
alias rcp='rsync -avP'
alias tart='tar tvvzf'
alias tarc='tar cvvzf'
alias tarx='tar xvvzf'

# Bigstorage directory
export BIGSTORAGE=/scratch/$USER

# KISTI system
export SYSTEM=x86-skylake
#export SYSTEM=mic-knl

module load craype-network-opa
module load craype-$SYSTEM
module load intel/17.0.5
module load impi/17.0.5
module load hdf5-parallel/1.10.2
module load cmake/3.12.3
module load git/1.8.3.4

# Library version
export CGNS_VERSION=3.4.0
export PARMETIS_VERSION=4.0.3

# CGNS for cmake
export PATH=/home01/$USER/opt/$SYSTEM/cgns/$CGNS_VERSION/bin:$PATH
export INCLUDE=/home01/$USER/opt/$SYSTEM/cgns/$CGNS_VERSION/include:$INCLUDE
export LIB=/home01/$USER/opt/$SYSTEM/cgns/$CGNS_VERSION/lib:$LIB

# ParMETIS for cmake
export PATH=/home01/$USER/opt/$SYSTEM/parmetis/$PARMETIS_VERSION/bin:$PATH
export INCLUDE=/home01/$USER/opt/$SYSTEM/parmetis/$PARMETIS_VERSION/include:$INCLUDE
export LIB=/home01/$USER/opt/$SYSTEM/parmetis/$PARMETIS_VERSION/lib:$LIB

# RapidJson for cmake
export INCLUDE=/opt/lib_$COMPILER/rapidjson/include:$INCLUDE

# Linux standard environment variables
export CPATH=$INCLUDE:$CPATH
export LIBRARY_PATH=$LIB:$LIBRARY_PATH
export LD_LIBRARY_PATH=$LIB:$LD_LIBRARY_PATH
