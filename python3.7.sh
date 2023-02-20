#!/bin/bash

wget https://www.python.org/ftp/python/3.7.3/Python-3.7.3.tgz
tar -xzvf Python-3.7.3.tgz
yum -y install zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel gdbm-devel db4-devel libpcap-devel xz-devel gcc libffi-devel gcc make automake autoconf libtool libffi-devel
./Python-3.7.3/configure --prefix=/usr/local/python3 --with-ssl
make && make install
mv /usr/bin/python3 /usr/bin/python3.bak
mv /usr/bin/pip3 /usr/bin/pip3.bak
ln -s /usr/local/python3/bin/python3.7 /usr/bin/python3
ln -s /usr/local/python3/bin/pip3.7 /usr/bin/pip3