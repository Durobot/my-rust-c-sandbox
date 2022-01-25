#!/bin/bash

if [ ! -f "../c-lib/libc-lib.so" ]
then
    echo -e "../c-lib/libc-lib.so does not exist, will try building it now\n"
    cd ../c-lib/
    make
    cd ../c-app/
    echo
fi
make
LD_LIBRARY_PATH=../c-lib ./c-app
