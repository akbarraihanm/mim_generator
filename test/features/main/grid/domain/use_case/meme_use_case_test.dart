import 'package:flutter_test/flutter_test.dart';
import 'package:mim_generator/core/util/resource.dart';
import 'package:mim_generator/feature/main/grid/domain/entity/meme_entity.dart';
import 'package:mim_generator/feature/main/grid/domain/repository/meme_repository.dart';
import 'package:mim_generator/feature/main/grid/domain/use_case/meme_use_case.dart';
import 'package:mocktail/mocktail.dart';

class MockRepo extends Mock implements MemeRepository {}

void main() {
  late MockRepo repo;
  late MemeUseCase useCase;

  setUpAll(() {
    repo = MockRepo();
    useCase = MemeUseCase(repo);
  });

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

  group('MemeUseCase test', () {
    test(
        'Given MemeUseCase, '
        'When get all meme, '
        'Then it should return correct entity', () async {
      when(() => repo.getAll()).thenAnswer((_) async => Resource.success(entity));

      final result = await useCase.getAll();
      expect(result.data, entity);
    });
  });
}