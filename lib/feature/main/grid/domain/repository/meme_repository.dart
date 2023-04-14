import 'package:mim_generator/core/util/resource.dart';
import 'package:mim_generator/feature/main/grid/domain/entity/meme_entity.dart';

abstract class MemeRepository {
  Future<Resource<MemeEntity>> getAll();
}