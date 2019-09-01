import 'package:flutter/material.dart';

class NewsCardLabel extends StatelessWidget {
  final String date;
  final String title;
  final String type;
  final String content;

  NewsCardLabel(this.date, this.title, this.type, this.content);

  String prepareContent(String content) {
    String ellipsis = "..."; //define your variable truncation elipsis here
    String truncated = "";
    if (content.length > content.length - 1) {
      truncated = content.substring(0, 70 - ellipsis.length) + " " + ellipsis;
    } else {
      truncated = content;
    }
    print(truncated);
    return truncated;
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(right: media * 0.07),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  spreadRadius: 0,
                  blurRadius: 5,
                  color: Colors.grey.shade700,
                  offset: Offset(0, 5))
            ]),
        constraints:
            BoxConstraints.tightFor(width: media * 0.84, height: media * 0.41),
        child: Padding(
          padding: EdgeInsets.all(media * 0.05),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    constraints: BoxConstraints.tightFor(
                        width: media * 0.512, height: media * 0.1),
                    alignment: AlignmentDirectional.center,
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: media * 0.045, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Container(
                    alignment: AlignmentDirectional.center,
                    constraints: BoxConstraints.tightFor(
                        width: media * 0.2, height: media * 0.064),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.teal),
                      color: Colors.white,
                    ),
                    child: Text(
                      'HD-News',
                      style: TextStyle(fontSize: 15, color: Colors.teal),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      prepareContent(content),
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: 17,
                      ),
                    ),

                    Text(
                      'Wczoraj, 12:02',
                      style: TextStyle(
                          fontWeight: FontWeight.w200, fontSize: 13),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
