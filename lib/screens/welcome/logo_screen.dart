import 'package:flutter/material.dart';
import 'package:hardware_definition_app/constraints.dart';

import 'welcome_screen.dart';

class LogoScreen extends StatefulWidget {
  @override
  _LogoScreenState createState() => _LogoScreenState();
}

class _LogoScreenState extends State<LogoScreen> {
  @override
  void initState() {
    Future.delayed(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context,
            PageRouteBuilder(
                transitionDuration: Duration(milliseconds: 800),
                pageBuilder: (context, animation, secondaryAnimation) =>
                    WelcomeScreen())));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kWelcomeScreenBackgroundColor,
      body: Center(
        child: Hero(
          tag: "Logo",
          child: Container(
            constraints:
                BoxConstraints.tightFor(width: 300, height: media.height),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.asset('assets/welcome_screen_logo.png'),
            ),
          ),
        ),
      ),
    );
  }
}
