#!/bin/bash

if [ ! -f "./libc-lib.dll" ]
then
    if [ ! -f "../c-lib/libc-lib.dll" ]
    then
        echo -e "../c-lib/libc-lib.dll does not exist, will try building it now\n"
        cd ../c-lib/
        make
        cd ../c-app/
        echo
    fi
    cp ../c-lib/libc-lib.dll ./
fi

if [ ! -f "./c-app.exe" ]
then
    echo -e "c-app.exe does not exist, will try building it now\n"
    make
    echo
fi
./c-app.exe
