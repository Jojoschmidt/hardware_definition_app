import 'package:flutter/material.dart';
import 'package:hardware_definition_app/constraints.dart';
import 'package:hardware_definition_app/screens/news/top_button_bar/hd_daily_button.dart';
import 'package:hardware_definition_app/screens/news/top_button_bar/search_button.dart';

class TopButtonBar extends StatefulWidget {
  @override
  _TopButtonBarState createState() => _TopButtonBarState();
}

class _TopButtonBarState extends State<TopButtonBar> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: 0.80,
      child: Padding(
        padding: EdgeInsets.only(left:media*0.056,right: media*0.044,top: media*0.02,bottom: media*0.02 ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SearchButton(),
            HdDailyButton(),
          ],

        ),
      ),
    );
  }
}
