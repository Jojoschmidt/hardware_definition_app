import 'package:flutter/material.dart';

import 'news_image_card.dart';

class NewsCard extends StatefulWidget {
  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                alignment: AlignmentDirectional.center,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(90),
                  child: Container(
                    constraints: BoxConstraints.tightFor(
                        width: 45, height: 45),
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Grzesiek Wąski',
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    'wczoraj',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w300),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          alignment: AlignmentDirectional.topStart,
          child: Padding(
            padding: EdgeInsets.only(left: 20,top: 10,bottom: 10),
            child: Text(
              'IOS oraz IPadOS 13 Beta 5 - Co nowego?',
              style: TextStyle(
                  fontSize: 25
              ),
            ),
          ),
        ),
        NewsImageCard()
      ],
    );
  }
}
