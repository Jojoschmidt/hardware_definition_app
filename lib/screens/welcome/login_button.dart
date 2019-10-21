// ignore: must_be_immutable
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginButton extends StatefulWidget {
  IconData iconData;
  final String text;
  final Color color;

  LoginButton(this.iconData, this.text, this.color);

  LoginButton.noButton(this.text, this.color) {
    iconData = null;
  }

  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () => Navigator.pushReplacementNamed(context, '/'),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: Container(
            alignment: AlignmentDirectional.center,
            constraints: BoxConstraints.tightFor(
                width: media * 0.9, height: media * 0.15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.iconData != null
                      ? Icon(
                          widget.iconData,
                          color: Colors.white,
                          size: 30,
                        )
                      : null,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      alignment: AlignmentDirectional.center,
                      child: Text(
                        widget.text,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w300,
                            letterSpacing: 3),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            color: widget.color,
          ),
        ),
      ),
    );
  }
}
