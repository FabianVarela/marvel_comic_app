import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marvel_comic_app/core/dio/dio_provider.dart';
import 'package:marvel_comic_app/core/utils/utils.dart';
import 'package:marvel_comic_app/features/comic_detail/model/character_detail_model.dart';

class ComicDetailRepository {
  ComicDetailRepository({required this.dio});

  final Dio dio;

  Future<CharacterModel> getCharacter(String characterId) async {
    try {
      const publicKey = String.fromEnvironment('MARVEL_PUBLIC_KEY');
      const privateKey = String.fromEnvironment('MARVEL_PRIVATE_KEY');

      final timestamp = DateTime.now().millisecondsSinceEpoch;
      final response = await dio.get<Map<String, dynamic>>(
        '/v1/public/characters/$characterId',
        queryParameters: <String, dynamic>{
          'ts': '$timestamp',
          'apikey': publicKey,
          'hash': Utils.generateHash('$privateKey$publicKey', timestamp),
        },
      );

      return CharacterModel.fromJson(response.data!);
    } on Exception catch (_) {
      rethrow;
    }
  }
}

final comicDetailRepositoryProvider = Provider<ComicDetailRepository>(
  (ref) => ComicDetailRepository(dio: ref.watch(dioProvider)),
);
