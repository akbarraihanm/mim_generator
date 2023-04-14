import 'dart:io';
import 'dart:typed_data';

abstract class MemeDetailState {}

class Init extends MemeDetailState {}

class ScreenshotSuccess extends MemeDetailState {
  File ss;
  Uint8List image;

  ScreenshotSuccess(this.ss, this.image);
}

class ShowError extends MemeDetailState {
  String message;

  ShowError(this.message);
}