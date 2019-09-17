import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchButton extends StatefulWidget {
  @override
  _SearchButtonState createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size.width;

    return Hero(
      tag: 'search',
      child: Container(
        constraints: BoxConstraints.tightFor(
            width: media * 0.125, height: media * 0.125),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Color(0xFF005485),width: 1.5),
        ),
        child: ClipOval(
          child: FlatButton(
            onPressed: () => Navigator.pushNamed(context, '/search'),
            child: SvgPicture.asset(
              'assets/search.svg',
              width: media * 0.056,
              height: media * 0.056,
            ),
          ),
        ),
      ),
    );
  }
}
