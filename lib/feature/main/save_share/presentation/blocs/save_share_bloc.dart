import 'package:bloc/bloc.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:mim_generator/feature/main/save_share/presentation/blocs/save_share_event.dart';
import 'package:mim_generator/feature/main/save_share/presentation/blocs/save_share_state.dart';

class SaveShareBloc extends Bloc<SaveShareEvent, SaveShareState> {
  SaveShareBloc(): super(Init()) {
    on<Save>((event, emit) async {
      await ImageGallerySaver.saveImage(await event.file.readAsBytes());
      emit(Success("Successfully saved to Gallery"));
    });
  }

}