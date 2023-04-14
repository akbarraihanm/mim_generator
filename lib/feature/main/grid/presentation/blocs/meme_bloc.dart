import 'package:bloc/bloc.dart';
import 'package:mim_generator/feature/main/grid/domain/entity/meme_entity.dart';
import 'package:mim_generator/feature/main/grid/domain/use_case/meme_use_case.dart';
import 'package:mim_generator/feature/main/grid/presentation/blocs/meme_event.dart';
import 'package:mim_generator/feature/main/grid/presentation/blocs/meme_state.dart';

class MemeBloc extends Bloc<MemeEvent, MemeState> {
  final MemeUseCase useCase;

  List<ContentMeme> list = [];

  MemeBloc({required this.useCase}): super(Init()) {
    on<GetAll>((event, emit) async {
      emit(ShowLoading());

      final result = await useCase.getAll();
      if (result.message != null) {
        emit(ShowError(result.message ?? ""));
      } else if (result.networkError != null) {
        emit(ShowError(result.networkError ?? ""));
      } else {
        list = result.data?.data?.meme ?? [];
        emit(Init());
      }
    });
  }

}