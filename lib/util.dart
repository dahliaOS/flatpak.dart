import 'dart:typed_data';
import 'dart:ffi';

String charToString(Pointer<Char> char) {
  return String.fromCharCode(char.value);
}
