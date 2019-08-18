import 'package:flutter/material.dart';
import 'package:hardware_definition_app/constraints.dart';

import 'navigation_bar_button.dart';

class CustomBottomNavigationBar extends StatelessWidget {
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
                NavigationBarButton(Icons.home, true, '/'),
                NavigationBarButton(Icons.search, false, '/search'),
                NavigationBarButton(Icons.bookmark, false, '/saved'),
                NavigationBarButton(Icons.person, false, '/profile')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
