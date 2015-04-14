#!/bin/bash

base_dir=`pwd`
tmp_dir=$base_dir/tmp

rm -rf $tmp_dir 
mkdir -p $tmp_dir
git clone -b v2.0 https://github.com/gflags/gflags.git $tmp_dir  
if [ $? -ne 0 ]
then
    echo -e "\033[31m gflags: download from git error \033[0m"
    exit 1
fi

cd $tmp_dir
./configure --prefix=${base_dir} --enable-shared=no && make && make install
if [ $? -ne 0 ]
then
    echo -e "\033[31m gflags: make error \033[0m"
    exit 1
fi
rm -rf $tmp_dir


