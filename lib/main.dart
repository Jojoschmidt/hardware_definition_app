import 'package:flutter/material.dart';
import 'package:hardware_definition_app/screens/news/news_screen.dart';
import 'package:hardware_definition_app/screens/profile/profile_screen.dart';

import 'screens/info/info_screen.dart';
import 'screens/search/search_screen.dart';
import 'screens/welcome/logo_screen.dart';
import 'screens/welcome/welcome_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HardwarDefinition',
      initialRoute: 'logo',
      routes: {
        '/': (context) => NewsScreen(),
        '/profile': (context) => ProfileScreen(),
        'welcome': (context) => WelcomeScreen(),
        '/profile/info': (context) => InfoScreen(),
        '/search': (context) => SearchScreen(),
        'logo': (context) => LogoScreen()
      },
    );
  }
}
