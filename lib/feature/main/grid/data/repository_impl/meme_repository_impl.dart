import 'dart:convert';

import 'package:mim_generator/core/const/app_string.dart';
import 'package:mim_generator/core/network/api_exception.dart';
import 'package:mim_generator/core/util/resource.dart';
import 'package:mim_generator/feature/main/grid/data/data_source/meme_data_source.dart';
import 'package:mim_generator/feature/main/grid/domain/entity/meme_entity.dart';
import 'package:mim_generator/feature/main/grid/domain/repository/meme_repository.dart';
import 'package:mim_generator/feature/main/grid/mapper.dart';

class MemeRepositoryImpl implements MemeRepository {
  final MemeDataSource dataSource;

  MemeRepositoryImpl(this.dataSource);

  @override
  Future<Resource<MemeEntity>> getAll() async {
    try {
      final data = await dataSource.getAll();
      return Resource.success(data.toEntity());
    } catch (ex) {
      if (ex is ErrorRequestException) {
        var message = jsonDecode(ex.errorBody);
        return Resource.error(message["message"]);
      } else if (ex is UnauthorizedException) {
        return Resource.unauthorized(AppString.unauthorizedMsg);
      } else if (ex is NetworkException) {
        return Resource.networkError("$ex");
      } else {
        return Resource.error("$ex");
      }
    }
  }

}