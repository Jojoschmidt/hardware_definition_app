import 'package:flutter/material.dart';

import '../../constraints.dart';
import 'login_button.dart';
import 'login_button_section.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kWelcomeScreenBackgroundColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: "Logo",
                child: Container(
                  child: FittedBox(
                    child: Image.asset(
                        'assets/welcome_screen_logo.png'),
                    fit: BoxFit.contain,
                  ),
                  constraints: BoxConstraints.tightFor(width: 300),
                ),
              ),
            ),
            Expanded(child: Hero(child: LoginButtonSection(),tag: 'bottomNavigationBar',)),
          ],
        ),
      ),
    );
  }
}
