import 'package:flutter/material.dart';
import 'package:hardware_definition_app/screens/news/news_cards_list.dart';
import 'package:hardware_definition_app/screens/news/top_button_bar/top_button_bar.dart';
import '../../navigation/bottom_navigation_bar.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Expanded(
                      child: NewsCardsList(),
                    )
                  ],
                ),
                //Hero(
                //  tag: 'bottomNavigationBar',
                //  child: CustomBottomNavigationBar(0),
                //),
              ],
            ),
            TopButtonBar(),
          ],
        ),
      ),
    );
  }
}
