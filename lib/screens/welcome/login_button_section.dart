import 'package:flutter/material.dart';

import '../../constraints.dart';
import 'login_button.dart';

class LoginButtonSection extends StatefulWidget {

  @override
  _LoginButtonSectionState createState() => _LoginButtonSectionState();
}

class _LoginButtonSectionState extends State<LoginButtonSection> with SingleTickerProviderStateMixin{
  bool visible = false;
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 300),()=>setState(() {
      visible = true;
    }));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 700),
      curve: Curves.decelerate,
      opacity: visible?1:0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Text(
              'Witamy!',
              style: kWelcomeScreenWelcomeMessageTextStyle,
            ),
          ),
          LoginButton.noButton('Wejdź bez logowania', Colors.black),
          LoginButton(
              Icons.face, 'Zaloguj się z Facebookiem', kFacebookColor),
        ],
      ),
    );
  }
}
