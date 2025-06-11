import 'package:flutter/material.dart';
import 'package:news_app/features/article_details/article_details.dart';
import 'package:news_app/features/home/home_screen.dart';
import 'package:news_app/features/splash/splash.dart';

class RoutesManager {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String articleDetails = '/articleDetails';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) => const Splash(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case articleDetails:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => const ArticleDetailsScreen(),
        );
    }
    return null;
  }
}
