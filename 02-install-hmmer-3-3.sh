#!/bin/bash

# actf version is circa 2013!

cd ../bin/
# wget http://eddylab.org/software/hmmer/hmmer.tar.gz # done
tar -zxf hmmer.tar.gz
cd hmmer-3.3
./configure --prefix /ACTF/Course/mb599_bds_s20/data/share/Group6_Emily_Lorne_Kaimyn/bin
make
make check
make install
# (cd easel; make install) # leaving this out for now
