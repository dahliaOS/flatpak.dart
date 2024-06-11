import 'dart:ffi';
import 'package:flatpak/src/libflatpak.dart';

class Flatpak {
  late NativeLibrary libFlatpak;

  Flatpak() {
    DynamicLibrary libFlatpakLib = DynamicLibrary.open('libflatpak.so');
    libFlatpak = NativeLibrary(libFlatpakLib);
  }

  String version() {
    int major = FLATPAK_MAJOR_VERSION;
    int minor = FLATPAK_MINOR_VERSION;
    int micro = FLATPAK_MICRO_VERSION;
    return '$major.$minor.$micro';
  }
}

void main() {
  Flatpak flatpak = Flatpak();
  print("Flatpak version: ${flatpak.version()}");
}
