#!/bin/bash

yum install make gcc gcc-c++ -y

if [ ! -f "shc-3.8.9b.tgz" ];then
  echo "not found shc package, shc-3.8.9b.tgz!!!"
  exit 1
fi

if [ ! -d "/tmp/shc-3.8.9b" ];then
  tar -zxf shc-3.8.9b.tgz -C /tmp/
fi

cd /tmp/shc-3.8.9b

make test
make install

