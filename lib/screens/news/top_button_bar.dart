import 'package:flutter/material.dart';
import 'package:hardware_definition_app/constraints.dart';

class TopButtonBar extends StatefulWidget {
  @override
  _TopButtonBarState createState() => _TopButtonBarState();
}

class _TopButtonBarState extends State<TopButtonBar> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Opacity(
          opacity: 1,
          child: IconButton(
            onPressed: () {
              setState(() {
                print('masło');
              });
            },
            icon: Icon(
              Icons.search,
              size: 50,
              color: Colors.grey.shade300,
            ),
          ),
        ),
        Opacity(
          opacity: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 30,
                    spreadRadius: 5,
                    offset: Offset(0, 10)
                  )
                ],
                color: Colors.white
              ),
              child: GestureDetector(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    'HardwareDaily News',
                    style: kHardwareDailyButtonTextStyle,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
