#! /bin/bash

#AutoSnort3 PreReq and Install Script for HomeLab

mkdir ~/snort_src
cd ~/snort_src

apt-get install -y  build-essential autotools-dev libdumbnet-dev libluajit-5.1-dev libpcap-dev libpcre3-dev zlib1g-dev pkg-config libhwloc-dev cmake

apt-get install -y liblzma-dev openssl libssl-dev cpputest libsqlite3-dev uuid-dev libtool git autoconf bison flex libnetfilter-queue-dev

apt-get install -y libnghttp2-dev

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

echo "Check to see if Hyperscan works"

cd ~/snort_src/hyperscan-4.7.0-build/
./bin/unit-hyperscan

#####Download and Install Snort 2.9.12
echo "Will now start to Download and Install Snort"

cd ~/snort_src
wget https://www.snort.org/downloads/snort/daq-2.0.6.tar.gz
tar -xvzf daq-2.0.6.tar.gz
cd daq-2.0.6
./configure
make && make install


cd ~/snort_src
wget https://www.snort.org/downloads/snort/snort-2.9.12.tar.gz
tar -xvzf snort-2.9.12.tar.gz
cd snort-2.9.12
./configure --enable-sourcefire
make && make install

ldconfig

ln -s /usr/local/bin/snort /usr/sbin/snort

/usr/sbin/snort -V