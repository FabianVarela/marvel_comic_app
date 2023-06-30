import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marvel_comic_app/features/comic_list/model/character_list_model.dart';
import 'package:marvel_comic_app/features/comic_list/repository/comic_list_repository.dart';

final comicListProvider = FutureProvider.family<CharacterListModel, String>(
  (ref, textFilter) async {
    final repository = ref.watch(comicListRepositoryProvider);
    return repository.getCharacterList(textFilter);
  },
);
