// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:wordsus_app/counter/view/counter_page.dart';
import 'package:wordsus_app/l10n/l10n.dart';
import 'package:wordsus_app/website_list/view/website_list_page.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final routerDelegate = BeamerDelegate(
    locationBuilder: RoutesLocationBuilder(
      routes: {
        '/': (context, state, data) {
          // final initialIndex =
          //     state.queryParameters['tab'] == 'articles' ? 1 : 0;
          // return HomeScreen(initialIndex: initialIndex);
          return const BeamPage(
            key: ValueKey('project-list-page'),
            title: 'Project list Page!',
            child: WebsiteListPage(),
          );
        },
        '/project': (context, state, data) {
          // final initialIndex =
          //     state.queryParameters['tab'] == 'articles' ? 1 : 0;
          // return HomeScreen(initialIndex: initialIndex);
          return const BeamPage(
            key: ValueKey('project-page'),
            title: 'Counter Page!',
            child: CounterPage(),
          );
        },

        // '/books/:bookId': (context, state, data) {
        //   final bookId = state.pathParameters['bookId'];
        //   final book = books.firstWhere((book) => book['id'] == bookId);
        //   return BeamPage(
        //     key: ValueKey('book-$bookId'),
        //     title: book['title'],
        //     child: BookDetailsScreen(book: book),
        //     onPopPage: (context, delegate, _, page) {
        //       delegate.update(
        //         configuration: RouteInformation(
        //           location: '/?tab=books',
        //         ),
        //         rebuild: false,
        //       );
        //       return true;
        //     },
        //   );
        // },
        // 'articles/:articleId': (context, state, data) {
        //   final articleId = state.pathParameters['articleId'];
        //   final article =
        //       articles.firstWhere((article) => article['id'] == articleId);
        //   return BeamPage(
        //     key: ValueKey('articles-$articleId'),
        //     title: article['title'],
        //     child: ArticleDetailsScreen(article: article),
        //     onPopPage: (context, delegate, _, page) {
        //       delegate.update(
        //         configuration: RouteInformation(
        //           location: '/?tab=articles',
        //         ),
        //         rebuild: false,
        //       );
        //       return true;
        //     },
        //   );
        // },
      },
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Color(0xFF363636),
          elevation: 0,
        ),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      // home: const WebsiteListPage(),
      routerDelegate: routerDelegate,
      routeInformationParser: BeamerParser(),
      backButtonDispatcher: BeamerBackButtonDispatcher(
        delegate: routerDelegate,
      ),
    );
  }
}
