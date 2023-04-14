import 'package:mim_generator/feature/main/grid/data/models/meme_response.dart';
import 'package:mim_generator/feature/main/grid/domain/entity/meme_entity.dart';

extension MemeResponseToEntity on MemeResponse {
  MemeEntity toEntity() => MemeEntity(
    success: success,
    data: data?.toEntity(),
  );
}

extension MemeDataToEntity on MemeData {
  DataMeme toEntity() => DataMeme(
    meme: meme?.map((e) => e.toEntity()).toList(),
  );
}

extension MemeContentToEntity on MemeContent {
  ContentMeme toEntity() => ContentMeme(
    id: id,
    name: name,
    url: url,
    width: width,
    height: height,
    boxCount: boxCount,
    captions: captions,
  );
}