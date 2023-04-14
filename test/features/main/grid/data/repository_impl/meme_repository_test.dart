import 'package:flutter_test/flutter_test.dart';
import 'package:mim_generator/feature/main/grid/data/data_source/meme_data_source.dart';
import 'package:mim_generator/feature/main/grid/data/models/meme_response.dart';
import 'package:mim_generator/feature/main/grid/data/repository_impl/meme_repository_impl.dart';
import 'package:mim_generator/feature/main/grid/domain/repository/meme_repository.dart';
import 'package:mim_generator/feature/main/grid/mapper.dart';
import 'package:mocktail/mocktail.dart';

class MockDataSource extends Mock implements MemeDataSource {}

void main() {
  late MockDataSource dataSource;
  late MemeRepository repository;

  setUpAll(() {
    dataSource = MockDataSource();
    repository = MemeRepositoryImpl(dataSource);
  });

  final response = MemeResponse.fromJsonMap({
    "success": true,
    "data": MemeData.fromJsonMap({
      "memes": [
        MemeContent.fromJsonMap({
          'id': 'id',
          'name': 'name',
          'url': 'url',
          'width': 0,
          'height': 0,
          'box_count': 0,
          'captions': 0,
        }).toJson(),
      ].toList(),
    }).toJson(),
  });

  group('MemeRepository test', () {
    test(
        'Given MemeRepository, '
        'When get all meme, '
        'Then it should return correct data', () async {
      when(() => dataSource.getAll()).thenAnswer((_) async => response);

      final result = await repository.getAll();
      final entity = result.data?.data?.meme?.first;
      final res = response.data?.toEntity();
      expect(entity?.id, res?.meme?.first.id);
      expect(entity?.name, res?.meme?.first.name);
      expect(entity?.url, res?.meme?.first.url);
    });
  });
}