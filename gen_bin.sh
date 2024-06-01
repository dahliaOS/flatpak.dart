#!/bin/sh

# install libflatpak
sudo apt-get install gir1.2-flatpak-1.0 
sudo apt-get install libflatpak-dev

# install glib-2.0
sudo apt-get install libglib2.0-dev

# run ffigen
dart run ffigen --compiler-opts "-isystem /usr/lib/clang/10/include/ -isystem /usr/include -I/usr/include/glib-2.0/ -I/usr/lib/x86_64-linux-gnu/glib-2.0/include/ -I/usr/include/flatpak/"
