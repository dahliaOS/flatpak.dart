#!/bin/sh
dart run ffigen --compiler-opts "-isystem /usr/lib/clang/17/include/ -isystem /usr/include -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include/ -I/usr/include/flatpak/"
