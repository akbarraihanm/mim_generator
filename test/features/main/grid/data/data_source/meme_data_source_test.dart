import 'package:flutter_test/flutter_test.dart';
import 'package:mim_generator/feature/main/grid/data/api/meme_service.dart';
import 'package:mim_generator/feature/main/grid/data/data_source/meme_data_source.dart';
import 'package:mim_generator/feature/main/grid/data/models/meme_response.dart';
import 'package:mocktail/mocktail.dart';

class MockService extends Mock implements MemeService {}

void main() {
  late MockService service;
  late MemeDataSource dataSource;

  setUpAll(() {
    service = MockService();
    dataSource = MemeDataSourceImpl(service);
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
      ],
    }).toJson(),
  });

  group('MemeDataSource test', () {
    test(
        'Given MemeDataSource, '
        'When get all memes, '
        'Then it should return correct response', () async {
      when(() => service.getAll()).thenAnswer((_) async => response);

      final result = await dataSource.getAll();
      expect(result.toJson(), response.toJson());
    });
  });
}