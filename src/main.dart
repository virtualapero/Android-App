import 'package:flutter/material.dart';

import 'router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppRouter.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VirtualApero',
      theme: ThemeData(
        primarySwatch: const MaterialColor(
          0xFF007cba,
          <int, Color>{
            50: Color(0xFF0070a7),
            100: Color(0xFF006395),
            200: Color(0xFF005782),
            300: Color(0xFF004a70),
            400: Color(0xFF003e5d),
            500: Color(0xFF00324a),
            600: Color(0xFF002538),
            700: Color(0xFF001925),
            800: Color(0xFF000c13),
            900: Color(0xFF000000),
          }
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: const MaterialColor(
            0xFF007cba,
            <int, Color>{
              50: Color(0xFFE0EFF7),
              100: Color(0xFFB3D8EA),
              200: Color(0xFF80BEDD),
              300: Color(0xFF4DA3CF),
              400: Color(0xFF2690C4),
              500: Color(0xFF007CBA),
              600: Color(0xFF0074B3),
              700: Color(0xFF0069AB),
              800: Color(0xFF005FA3),
              900: Color(0xFF004C94),
            }
        ),
      ),
      themeMode: ThemeMode.system,
      onGenerateRoute: AppRouter.generateRoute,
      initialRoute: AppRouter.mainRoute,
    );
  }
}