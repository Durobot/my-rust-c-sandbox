@echo off
if not exist "libc-lib.dll" (
    if not exist "..\c-lib\libc-lib.dll" (
        echo "Open MSYS2 MinGW 64-bit, go to ..\c-lib and run 'make' (w/o the '') to build libc-lib.dll first!"
        pause
        exit /B
    )
    copy ..\c-lib\libc-lib.dll .\
)

if not exist "c-app.exe" (
    echo "Open MSYS2 MinGW 64-bit and run 'make' (w/o the '') to build c-app.exe first!"
    pause
    exit /B
)

@echo on
c-app.exe
pause