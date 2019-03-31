#! /bin/bash

#AutoSnort PreReq and Install Script for HomeLab

mkdir ~/snort_src
cd ~/snort_src

apt-get install -y  build-essential autotools-dev libdumbnet-dev libluajit-5.1-dev libpcap-dev libpcre3-dev zlib1g-dev pkg-config libhwloc-dev cmake

apt-get install -y liblzma-dev openssl libssl-dev cpputest libsqlite3-dev uuid-dev libtool git autoconf bison flex libnetfilter-queue-dev

wget https://downloads.sourceforge.net/project/safeclib/libsafec-10052013.tar.gz

tar -xzvf libsafec-10052013

./configure && make && make install

wget http://www.colm.net/files/ragel/ragel-6.10.tar.gz

tar -xzvf ragel-6.10.tar.gz
cd ragel-6.10
./configure && make && make install

wget https://dl.bintray.com/boostorg/release/1.67.0/source/boost_1_67_0.tar.gz
tar -xvzf boost_1_67_0.tar.gz

wget https://github.com/intel/hyperscan/archive/v4.7.0.tar.gz
tar -xvzf v4.7.0.tar.gz
mkdir ~/snort_src/hyperscan-4.7.0-build
cd hyperscan-4.7.0-build/

cmake -DCMAKE_INSTALL_PREFIX=/usr/local -DBOOST_ROOT=~/snort_src/boost_1_67_0/ ../hyperscan-4.7.0
make && make install
