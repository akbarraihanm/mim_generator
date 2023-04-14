import 'package:flutter_test/flutter_test.dart';
import 'package:mim_generator/feature/main/grid/domain/entity/meme_entity.dart';

void main() {
  final entity = MemeEntity(
    success: true,
    data: DataMeme(
      meme: [ContentMeme(
        id: 'id',
        name: 'name',
        url: 'url',
        width: 0,
        height: 0,
        boxCount: 0,
        captions: 0,
      )]
    ),
  );

  test(
      'Given MemeEntity,'
      'When initialized, '
      'Then it should return correct data', () async {
    expect(entity.success, true);
    expect(entity.data?.meme?.first.id, 'id');
    expect(entity.data?.meme?.first.name, 'name');
    expect(entity.data?.meme?.first.url, 'url');
  });
}