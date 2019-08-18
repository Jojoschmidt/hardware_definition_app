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
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: RaisedButton(
                color: Colors.white,
                elevation: 50,
                onPressed: () {
                  setState(() {
                    print('HardwareDailyNews');
                  });
                },
                child: Container(
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
        ),
      ],
    );
  }
}
