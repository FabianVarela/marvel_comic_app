import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:marvel_comic_app/features/comic_detail/view/comic_detail_view.dart';
import 'package:marvel_comic_app/features/comic_list/notifier/comic_list_provider.dart';

class ComicListView extends HookConsumerWidget {
  const ComicListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final comicList = ref.watch(comicListProvider(''));

    return Scaffold(
      body: comicList.when(
        data: (data) => ListView.separated(
          itemCount: data.data.results.length,
          separatorBuilder: (_, __) => const Divider(),
          itemBuilder: (_, pos) {
            final item = data.data.results[pos];
            return ListTile(
              title: Text(
                item.name,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              onTap: () {
                // You can use onGeneratedRoute pass arguments
                //    on settings param.
                // Other option is use routes table defining key, widget and
                //    get value with ModalRoute.of(context)!.settings.
                Navigator.of(context).pushNamed(
                  '/detail',
                  arguments: '${item.id}',
                );
                /*
                // The default or conventional way.
                Navigator.of(context).push(
                  MaterialPageRoute<dynamic>(
                    builder: (_) => ComicDetailView(characterId: '${item.id}'),
                  ),
                );
                */
              },
            );
          },
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (e, s) => const Center(
          child: Text('Oops an error has occured'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Test it
          ref.invalidate(comicListProvider(''));
        },
      ),
    );
  }
}
