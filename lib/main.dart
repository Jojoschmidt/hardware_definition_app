import 'package:flutter/material.dart';
import 'package:hardware_definition_app/profile_screen.dart';

import 'news_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HardwarDefinition',
      initialRoute: '/',
      routes: {
        '/' : (context) => NewsScreen(),
        '/profile' : (context) => ProfileScreen()
      },
    );
  }
}

