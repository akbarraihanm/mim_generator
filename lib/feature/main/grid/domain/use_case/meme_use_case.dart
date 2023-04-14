import 'package:mim_generator/core/util/resource.dart';
import 'package:mim_generator/feature/main/grid/domain/entity/meme_entity.dart';
import 'package:mim_generator/feature/main/grid/domain/repository/meme_repository.dart';

class MemeUseCase {
  final MemeRepository repository;

  MemeUseCase(this.repository);

  Future<Resource<MemeEntity>> getAll() {
    return repository.getAll();
  }
}