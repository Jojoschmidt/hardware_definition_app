import 'package:flutter/material.dart';

class ExternalLinkButton extends StatefulWidget {
  final String text;
  final Color textColor;

  ExternalLinkButton(this.text, this.textColor);

  @override
  _ExternalLinkButtonState createState() => _ExternalLinkButtonState();
}

class _ExternalLinkButtonState extends State<ExternalLinkButton> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: OutlineButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        borderSide: BorderSide(
            width: 1,
            style: BorderStyle.solid,
            color: Colors.grey),
        onPressed: () => print('www'),
        child: Container(
          child: Center(
            child: Text(
              widget.text,
              style: TextStyle(
                color: widget.textColor,
                fontSize: 18,
                letterSpacing: 0.2,
                fontWeight: FontWeight.w400
              ),
            ),
          ),
          constraints: BoxConstraints.tightFor(
              width: media.width * 0.7, height: 60),
        ),
      ),
    );
  }
}