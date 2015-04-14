#!/bin/bash

base_dir=`pwd`
tmp_dir=$base_dir/tmp

rm -rf $tmp_dir 
mkdir -p $tmp_dir
git clone -b v2.6.1 https://github.com/google/protobuf.git $tmp_dir  
if [ $? -ne 0 ]
then
    echo -e "\033[31m protobuf: download from git error \033[0m"
    exit 1
fi

cd $tmp_dir
autoreconf -f -i -Wall,no-obsolete
if [ $? -ne 0 ]
then
    echo -e "\033[31m protobuf: generate configure file error \033[0m"
    exit 1
fi
./configure --prefix=${base_dir} --enable-shared=no && make && make install
if [ $? -ne 0 ]
then
    echo -e "\033[31m protobuf: make error \033[0m"
    exit 1
fi
rm -rf $tmp_dir


