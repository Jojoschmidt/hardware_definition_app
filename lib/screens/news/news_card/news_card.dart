import 'package:flutter/material.dart';
import 'package:hardware_definition_app/data/string_manipulation.dart';

class NewsCard extends StatefulWidget {
  final String author;
  final String date;
  final String title;
  final String type;
  final Image image;
  final String content;

  NewsCard(
      this.author, this.date, this.title, this.type, this.image, this.content);

  @override
  _NewsCardState createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {

  @override
  Widget build(BuildContext context) {
    String title = StringManipulation.prepareTitle(widget.title);
    String content = StringManipulation.prepareContent(widget.content);
    print(content);
    var media = MediaQuery.of(context).size.width;
    return Column(
      children: <Widget>[
        Container(
          constraints:
              BoxConstraints.tightFor(height: media * 0.536, width: media),
          child: Image(
            image: widget.image.image,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: PostTitle(title),
                    ),
                    PostCategory(widget.type),
                  ],
                ),
                PostContent(content),
                PostDate('Wczoraj, 12:02')
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PostTitle extends StatelessWidget {
  final String title;

  PostTitle(this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: Text(
        title,
        style: TextStyle(
            fontSize: 21, fontWeight: FontWeight.w700, fontFamily: 'barlow'),
      ),
    );
  }
}

class PostCategory extends StatelessWidget {
  final String category;

  PostCategory(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.tightFor(width: 80, height: 30),
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.teal, width: 1.5),
        color: Colors.white,
      ),
      child: Text(
        category,
        style: TextStyle(
          fontSize: 15,
          color: Colors.teal,
          fontFamily: 'muli',
          fontWeight: FontWeight.w300,
        ),
      ),
    );
  }
}

class PostContent extends StatelessWidget {
  final String content;

  PostContent(this.content);

  @override
  Widget build(BuildContext context) {
    return Text(
      content,
      style: TextStyle(

        fontFamily: 'muli',
        fontWeight: FontWeight.w300,
        fontSize: 17,
      ),
    );
  }
}

class PostDate extends StatelessWidget {
  final String date;

  PostDate(this.date);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: Text(
        date,
        style: TextStyle(
          fontWeight: FontWeight.w300,
          fontSize: 14,
          fontFamily: 'muli',
        ),
      ),
    );
  }
}
