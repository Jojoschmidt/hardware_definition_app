import 'package:flutter/material.dart';
import 'package:hardware_definition_app/constraints.dart';
import 'news_card_insides.dart';

class NewsCard extends StatefulWidget {
  final String author;
  final String date;
  final String title;
  final String type;
  final Image image;

  NewsCard(this.author, this.date, this.title, this.type, this.image);

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
                    constraints: BoxConstraints.tightFor(width: 45, height: 45),
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
                    widget.author,
                    style: TextStyle(fontSize: 18),
                  ),
                  Text(
                    widget.date,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          alignment: AlignmentDirectional.topStart,
          child: Padding(
            padding: EdgeInsets.only(left: 20, top: 10, bottom: 10),
            child: Text(
              widget.title,
              style: TextStyle(fontSize: 25),
            ),
          ),
        ),
        NewsCardInsides(widget.type,widget.image)
      ],
    );
  }
}
