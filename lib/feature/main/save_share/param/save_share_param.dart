import 'dart:io';
import 'dart:typed_data';

class SaveShareParam {
  final File file;
  final Uint8List image;

  SaveShareParam(this.file, this.image);
}