import 'package:flutter/material.dart';
import 'package:news_app/presentation/screens/article_details/article_details.dart';
import 'package:news_app/presentation/screens/home/home.dart';
import 'package:news_app/presentation/screens/search/search.dart';
import 'package:news_app/presentation/screens/splash/splash.dart';

class RoutesManager {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String search = '/search';
  static const String articleDetails = '/articleDetails';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) => Splash(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => Home(),
        );
        case search:
        return MaterialPageRoute(
          builder: (context) => SearchScreen(),
        );
        case articleDetails:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => ArticleDetailsScreen(),
        );
    }
  }
}
