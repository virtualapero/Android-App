import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'pages/apero.dart';
import 'pages/first_time.dart';
import 'pages/index.dart';
import 'pages/undefined_route.dart';

class AppRouter {
  static String mainRoute= '/';
  static SharedPreferences? _prefs;
  static bool _first = false;

  static init() async {
    AppRouter._prefs = await SharedPreferences.getInstance();
    AppRouter._first = !(AppRouter._prefs?.containsKey("first_time") ?? false);
  }

  static first() {
    AppRouter._first = false;
    AppRouter._prefs?.setBool("first_time", false);
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    if(AppRouter._first) {
      return MaterialPageRoute(builder: (context) => const FirstTimeView());
    }

    switch (settings.name) {
      case '/':
        return  MaterialPageRoute(builder: (context) => const HomeView());
      case '/apero':
        return MaterialPageRoute(builder: (context) {
          String? id = settings.arguments as String;
          return AperoView(id: id);
        });
      default:
        return MaterialPageRoute(builder: (context) => UndefinedRouteView(name: settings.name,));
    }
  }
}
