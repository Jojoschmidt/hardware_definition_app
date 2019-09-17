import 'package:flutter/material.dart';
import 'package:hardware_definition_app/constraints.dart';

class NewsCardImage extends StatefulWidget {
  final String author;
  final Image image;

  NewsCardImage(this.author, this.image);

  @override
  _NewsCardImageState createState() => _NewsCardImageState();
}

class _NewsCardImageState extends State<NewsCardImage> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
        image:
            new DecorationImage(image: widget.image.image, fit: BoxFit.cover),
      ),
      constraints:
          BoxConstraints.tightFor(width: media * 0.87, height: media * 0.53),
      alignment: AlignmentDirectional.bottomEnd,
      child: Padding(
        padding: EdgeInsets.only(bottom: media * 0.12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(30)),
            color: Colors.white,
          ),
          alignment: AlignmentDirectional.center,
          constraints:
              BoxConstraints.tightFor(height: media * 0.08, width: media * 0.3),
          child: Text(
            widget.author,
            style: TextStyle(
              fontSize: media * 0.029,
              color: Colors.black,
              fontFamily: 'quicksand',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
