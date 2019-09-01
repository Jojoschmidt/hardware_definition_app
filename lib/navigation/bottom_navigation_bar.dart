import 'package:flutter/material.dart';
import 'package:hardware_definition_app/constraints.dart';

import 'navigation_bar_button.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentScreen;

  CustomBottomNavigationBar(this.currentScreen);

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Container(
          constraints: BoxConstraints.tightFor(
              width: media * 0.9, height: media * 0.2),
          color: kBottomNavigationBarColor,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                NavigationBarButton(Icons.home, currentScreen == 0 ? true : false, '/',true),
                NavigationBarButton(Icons.search, currentScreen == 1 ? true : false, '/search',false),
                NavigationBarButton(Icons.bookmark, currentScreen == 2 ? true : false, '/saved',false),
                NavigationBarButton(Icons.person, currentScreen == 3 ? true : false, '/profile',false)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
