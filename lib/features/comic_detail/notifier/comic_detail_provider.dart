import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marvel_comic_app/features/comic_detail/model/character_detail_model.dart';
import 'package:marvel_comic_app/features/comic_detail/repository/comic_detail_repository.dart';

final comicDetailProvider = FutureProvider.family<CharacterModel, String>(
  (ref, id) async {
    final repository = ref.watch(comicDetailRepositoryProvider);
    return repository.getCharacter(id);
  },
);
