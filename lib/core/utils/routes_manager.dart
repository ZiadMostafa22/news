import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app_c12_online_sun/data/api/model/articles_response/article.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/home.dart';
import 'package:news_app_c12_online_sun/presentation/screens/home/tabs/article_details/article_details.dart';
import 'package:news_app_c12_online_sun/presentation/screens/splash/splash.dart';

class RoutesManager {
  static const String splash = '/splash';
  static const String home = '/home';
  static const String details = '/details';


  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(
          builder: (context) => const Splash(),
        );
      case home:
        return MaterialPageRoute(
          builder: (context) => Home(),
        );

      case details:
        return MaterialPageRoute(
settings: settings,
          builder: (context) => ArticleDetails(),
        );
    }
  }
}
