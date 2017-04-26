#!/bin/sh

#  @author: Oliver Kehret

#  @date  : 2017-02-15

#

# Prerequisites to run the script

# On Debian/Ubuntu:

# sudo apt-get install arm-linux-gnueabihf-gcc

# cd /usr/bin/

# sudo ln -s arm-linux-gnueabihf-gcc arm-linux-gnueabihf-gcc-x

# please set VERSION and BOOST_VERSION

VERSION=1.54.0

BOOST_VERSION=boost_1_54_0

BASE_DIR=$(pwd)

INSTALL_DIR=$BASE_DIR/boost

if [ ! -e $BOOST_VERSION".tar.bz2" ]; then

    wget -c http://sourceforge.net/projects/boost/files/boost/$VERSION"/"$BOOST_VERSION.tar.bz2

fi

if [ ! -e $BOOST_VERSION ]; then

    tar -xjvf $BOOST_VERSION".tar.bz2"

fi

if [ ! -e "$INSTALL_DIR" ]; then

   sudo mkdir -p $INSTALL_DIR

fi

if [ ! -e "boost/lib/libboost_thread.so" ]; then

    cd $BOOST_VERSION"/"

    sudo ./bootstrap.sh

    sed -i '12s/.*/  using gcc : arm : arm-linux-gnueabihf-g++ : <compileflags>-std=c++11 ;/' project-config.jam

    sudo ./b2 install --prefix=$INSTALL_DIR -link=shared toolset=gcc-arm

fi

if [ ! -e "boost/lib/libboost_thread.so" ]; then

echo "======================================="

echo "boost/lib/libboost_thread.so not succefully build ... aborting"

echo "remove the cause of the error and start again"

exit 1

fi
