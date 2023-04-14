abstract class SaveShareState {}

class Init extends SaveShareState {}

class Success extends SaveShareState {
  String message;

  Success(this.message);
}

class ShowError extends SaveShareState {
  String message;

  ShowError(this.message);
}