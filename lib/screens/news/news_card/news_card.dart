import 'package:flutter/material.dart';
import 'package:hardware_definition_app/constraints.dart';
import 'news_card_image.dart';
import 'news_card_label.dart';

class NewsCard extends StatefulWidget {
  final String author;
  final String date;
  final String title;
  final String type;
  final Image image;
  final String content;

  NewsCard(this.author, this.date, this.title, this.type, this.image,this.content);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size.width;
    return Container(
      constraints: BoxConstraints.tightFor(width: media,height: media*0.87),
      child: Stack(
        children: <Widget>[
          Align(
            child: NewsCardImage(widget.author, widget.image),
            alignment: AlignmentDirectional.topStart,
          ),
          Align(
            child: NewsCardLabel(widget.date,widget.title,widget.type,widget.content),
            alignment: AlignmentDirectional.bottomEnd,
          ),
        ],
      ),
    );
  }
}
