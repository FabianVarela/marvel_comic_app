import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marvel_comic_app/core/dio/dio_provider.dart';
import 'package:marvel_comic_app/core/utils/utils.dart';
import 'package:marvel_comic_app/features/comic_list/model/character_list_model.dart';

class ComicListRepository {
  ComicListRepository({required this.dio});

  final Dio dio;

  Future<CharacterListModel> getCharacterList(String textFilter) async {
    try {
      const publicKey = String.fromEnvironment('MARVEL_PUBLIC_KEY');
      const privateKey = String.fromEnvironment('MARVEL_PRIVATE_KEY');

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final response = await dio.get<Map<String, dynamic>>(
        '/v1/public/characters',
        queryParameters: <String, dynamic>{
          if (textFilter.isNotEmpty) 'nameStartsWith': textFilter,
          'limit': 100.toString(),
          'ts': '$timestamp',
          'apikey': publicKey,
          'hash': Utils.generateHash('$privateKey$publicKey', timestamp),
        },
      );

      return CharacterListModel.fromJson(response.data!);
    } on Exception catch (_) {
      rethrow;
    }
  }
}

final comicListRepositoryProvider = Provider<ComicListRepository>(
  (ref) => ComicListRepository(dio: ref.watch(dioProvider)),
);
