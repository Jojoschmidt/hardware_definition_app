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
    if (content.length > 68-ellipsis.length) {
      truncated = content.substring(0, 68 - ellipsis.length) + " " + ellipsis;
    } else {
      truncated = content;
    }
    print(truncated);
    return truncated;
  }

  @override
  Widget build(BuildContext context) {
    print(content);
    print(date);
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
                          fontSize: media * 0.045,
                          fontWeight: FontWeight.w700,
                          fontFamily: 'barlow'),
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
                      type,
                      style: TextStyle(
                        fontSize: media*0.030,
                        color: Colors.teal,
                        fontFamily: 'muli',
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        prepareContent(content),
                        style: TextStyle(
                          fontFamily: 'muli',
                          fontWeight: FontWeight.w300,
                          fontSize: media * 0.035,
                        ),
                      ),
                    ),
                    Text(
                      'Wczoraj, 12:02',
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        fontSize: media * 0.0255,
                        fontFamily: 'muli',
                      ),
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