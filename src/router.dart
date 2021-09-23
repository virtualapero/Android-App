import 'package:flutter/material.dart';

import 'pages/index.dart';
import 'pages/undefined_route.dart';



class AppRouter {
  static String mainRoute= '/';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
    case '/':
      return  MaterialPageRoute(builder: (context) => const HomeView());
    default:
      return MaterialPageRoute(builder: (context) => UndefinedRouteView(name: settings.name,));
  }
  }
}
