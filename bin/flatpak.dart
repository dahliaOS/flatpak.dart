import 'dart:ffi';
import 'package:ffi/ffi.dart';
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

  int getInstances() {
    Pointer<GPtrArray> instances = libFlatpak.flatpak_instance_get_all();
    return instances.ref.len;
  }

  List<String> getSupportedArches() {
    Pointer<Pointer<Char>> supportedArches =
        libFlatpak.flatpak_get_supported_arches();

    List<String> supportedArchesList = [];
    int index = 0;

    while (true) {
      Pointer<Char> archPtr = supportedArches.elementAt(index).value;
      if (archPtr == nullptr) {
        break;
      }
      String arch = archPtr.cast<Utf8>().toDartString();
      supportedArchesList.add(arch);
      index++;
    }

    malloc.free(supportedArches);

    return supportedArchesList;
  }
}

void main() {
  Flatpak flatpak = Flatpak();
  print("Flatpak version: ${flatpak.version()}");
  print("Supported arches: ${flatpak.getSupportedArches()}");
}
