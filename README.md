# Rust-C integration sandbox

A playground for experimenting with Rust-C integration on Linux and Windows.

**c-lib** contains a primitive dynamic library (libc-lib.so on Linux, libc-lib.dll on Windows), written in C;
**c-app** contains a simple C application that uses c-lib, by linking to the dynamic library;
**rust-app** contains a simple Rust application that uses c-lib, by linking to the dynamic library;

Compile C code with **gcc** on Linux and Windows. On Windows I used [MSYS2 MinGW 64-bit](https://www.msys2.org/).

On Windows, Rust must use the same linker as C to be able to link with libc-lib.dll. When installing Rust, specify this toolchain: `x86_64-pc-windows-gnu`, instead of the default x86_64-pc-windows-msvc, as indicated [here](https://stackoverflow.com/questions/47379214/step-by-step-instruction-to-install-rust-and-cargo-for-mingw-with-msys2#47380501).

To build **c-lib** library, open its folder (in MSYS2 MinGW 64-bit on Windows) and run `make`. Delete the built library by running `make clean`.

As c-app needs access to c-lib dynamic library (libc-lib.so / libc-lib.dll), and because on Windows there is no (simple) way to provide access if .dll file is in a different, non-system folder, libc-lib.dll is copied to c-app folder by the Windows scripts mentioned below. If you use `make` to build c-app, then you must copy libc-lib.dll to its folder before running c-app.exe.

Linux scripts use LD_LIBRARY_PATH variable to allow access to libc-lib.so.

**c-app** can be built by running `make`, or, on Linux, by running `linux_run.sh` which automatically builds c-lib as well, and runs c-app executable.

On Windows, either run `win_run.sh` in MSYS2 MinGW 64-bit for similar functionality, or run `win_run.bat` from cmd.exe. The latter prompts you to build c-lib and / or c-app if the respective files don't exist.

On Windows, `make clean` removes both c-app.exe and libc-lib.dll from c-app folder, on Linux libc-lib.so is not copied to c-app folder, so it is not removed.

**rust-app** can be built by invoking `cargo build`, provided c-lib has been built. On Windows, cargo works from cmd.exe only. Run `win_run.bat`, which copies libc-lib.dll to rust-app folder, an then builds and runs rust-app executable.

On Linux, there's `linux_run.sh`, which builds everything automatically and runs rust-app.