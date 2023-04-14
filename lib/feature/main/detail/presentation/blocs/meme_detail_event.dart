abstract class MemeDetailEvent {}

class DragImage extends MemeDetailEvent {
  double x;
  double y;

  DragImage(this.x, this.y);
}

class DragText extends MemeDetailEvent {
  double x;
  double y;

  DragText(this.x, this.y);
}

class CaptureWidget extends MemeDetailEvent {}

class OpenGallery extends MemeDetailEvent {}

class InputText extends MemeDetailEvent {
  String text;

  InputText(this.text);
}