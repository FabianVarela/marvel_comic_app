import 'package:dio/dio.dart';
import 'package:marvel_comic_app/features/comic_list/model/character_list_model.dart';
import 'package:mocktail/mocktail.dart';

class MockDio extends Mock implements Dio {}

class MockBaseOptions extends Mock implements BaseOptions {}

class MockClientAdapter extends Mock implements HttpClientAdapter {}

MockDio createMockDio() {
  final mockDio = MockDio();
  final mockOptions = MockBaseOptions();
  final mockAdapter = MockClientAdapter();

  when(() => mockDio.options).thenReturn(mockOptions);
  when(() => mockDio.httpClientAdapter).thenReturn(mockAdapter);

  return mockDio;
}

class MockDioResponse<T> extends Mock implements Response<T> {}

class _FakeDioOptions extends Fake implements Options {}

MockDioResponse<T> createMockDioResponse<T>(MockDio mockDio) {
  registerFallbackValue(_FakeDioOptions());

  final response = MockDioResponse<T>();
  when(
    () => mockDio.get<T>(
      any(),
      options: any(named: 'options'),
      queryParameters: any(named: 'queryParameters'),
    ),
  ).thenAnswer((_) async => response);

  return response;
}

class MockDioError extends Mock implements DioError {}

/// Model
class MyCharacterFake extends Fake implements CharacterListModel {}
