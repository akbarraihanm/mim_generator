import 'dart:io';

abstract class SaveShareEvent {}

class Save extends SaveShareEvent {
  File file;

  Save(this.file);
}