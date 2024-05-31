import 'dart:ffi';
import 'package:flatpak/src/libflatpak.dart';

void main() {
// Load the Flatpak library
  final DynamicLibrary libFlatpak = DynamicLibrary.open('libflatpak.so');

  NativeLibrary n = NativeLibrary(libFlatpak);

  print(n.glib_major_version);
}
