import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:marvel_comic_app/features/comic_list/model/character_list_model.dart';
import 'package:marvel_comic_app/features/comic_list/repository/comic_list_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../core/fake_result.dart';
import '../../../core/mocks.dart';

void main() {
  late MockDio mockDio;
  late ComicListRepository comicListRepository;

  setUpAll(() {
    mockDio = createMockDio();
    comicListRepository = ComicListRepository(dio: mockDio);
  });

  group('Get character list', () {
    test('Get the character list', () async {
      // Arrange
      // final characterList = getCharacterList();
      final response = createMockDioResponse<Map<String, dynamic>>(mockDio);

      when(() => response.statusCode).thenReturn(200);
      when(() => response.data).thenReturn(
        jsonDecode(jsonResponse) as Map<String, dynamic>,
      );

      // Act
      final futureResult = comicListRepository.getCharacterList('');
      final result = await futureResult;

      // Assert
      expect(futureResult, isA<Future<CharacterListModel>>());
      expect(result, isA<CharacterListModel>());
      // expect(result, characterList);
    });
    // test('Error getting character list', () {});
  });
}
