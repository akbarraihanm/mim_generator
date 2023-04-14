import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mim_generator/feature/main/detail/presentation/blocs/meme_detail_event.dart';
import 'package:mim_generator/feature/main/detail/presentation/blocs/meme_detail_state.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class MemeDetailBloc extends Bloc<MemeDetailEvent, MemeDetailState> {
  final _picker = ImagePicker();
  final ssCtrl = ScreenshotController();

  File? file;
  String? text;
  double xImage = 0.0;
  double yImage = 0.0;

  double xText = 0.0;
  double yText = 0.0;

  MemeDetailBloc(): super(Init()) {
    on<DragImage>((event, emit) {
      xImage = event.x;
      yImage = event.y;
      emit(Init());
    });

    on<DragText>((event, emit) {
      xText = event.x;
      yText = event.y;
      emit(Init());
    });

    on<OpenGallery>((event, emit) async {
      final pickedFile = await _picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 75,
      );
      if (pickedFile != null) {
        file = File(pickedFile.path);
        emit(Init());
      } else {
        emit(ShowError("No picked image"));
      }
    });
    on<InputText>((event, emit) {
      text = event.text;
      emit(Init());
    });

    on<CaptureWidget>((event, emit) async {
      final image = await ssCtrl.capture();
      final directory = (await getApplicationDocumentsDirectory()).path;
      String fileName = "${DateTime.now().microsecondsSinceEpoch}";
      if (image != null) {
        final imagePath = await File('$directory/$fileName.png').create();
        await imagePath.writeAsBytes(image);
        emit(ScreenshotSuccess(imagePath, image));
      } else {
        emit(ShowError("Screen not captured"));
      }
    });
  }

}