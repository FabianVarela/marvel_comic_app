import 'package:flutter/material.dart';
import 'package:marvel_comic_app/features/comic_detail/view/comic_detail_view.dart';
import 'package:marvel_comic_app/features/comic_list/view/comic_list_view.dart';
import 'package:marvel_comic_app/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // You can use onGeneratedRoute pass arguments on settings param.
      onGenerateRoute: (settings) {
        if (settings.name == '/detail') {
          final args = settings.arguments as String?;
          return MaterialPageRoute(
            builder: (_) => ComicDetailView(characterId: args!),
          );
        }
        return null;
      },
      // You can use onGeneratedRoute pass arguments on settings param.
      // The default or conventional way.
      home: const ComicListView(),
      /*
      // Other option is use routes table defining key, widget and
      //    get value with ModalRoute.of(context)!.settings.
      routes: {
        '/': (_) => const ComicListView(),
        '/detail': (_) => const ComicDetailView(characterId: ''),
      },
      */
    );
  }
}
