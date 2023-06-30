import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marvel_comic_app/features/comic_detail/notifier/comic_detail_provider.dart';

class ComicDetailView extends HookConsumerWidget {
  const ComicDetailView({required this.characterId, super.key});

  final String characterId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String? id;

    final args = ModalRoute.of(context)?.settings.arguments as String?;
    if (args != null) id = args;

    final comicDetail = ref.watch(comicDetailProvider(id ?? characterId));

    return Scaffold(
      appBar: AppBar(),
      body: comicDetail.when(
        data: (data) => Center(
          child: Text(
            data.data.results[0].name,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (e, s) => const Center(
          child: Text('Oops an error has occured'),
        ),
      ),
    );
  }
}
