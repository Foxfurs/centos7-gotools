#!/bin/bash

git clone https://github.com/EnableSecurity/wafw00f.git
cd wafw00f
python3 setup.py install
ln wafw00f/build/scripts-3.7/wafw00f /usr/bin/wafw00f