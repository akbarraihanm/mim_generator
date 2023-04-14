import 'package:mim_generator/feature/main/grid/data/api/meme_service.dart';
import 'package:mim_generator/feature/main/grid/data/models/meme_response.dart';

abstract class MemeDataSource {
  Future<MemeResponse> getAll();
}

class MemeDataSourceImpl implements MemeDataSource {
  final MemeService service;

  MemeDataSourceImpl(this.service);

  @override
  Future<MemeResponse> getAll() {
    return service.getAll();
  }

}