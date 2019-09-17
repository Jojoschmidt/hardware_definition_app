import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WelcomeMessage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size.width;

    return Container(
      constraints: BoxConstraints.tightFor(width: media*0.58,height: media*0.255),
      child: Stack(
        children: <Widget>[
          Align(
            alignment: AlignmentDirectional.bottomStart,
            child: Padding(
              padding:  EdgeInsets.only(left: media*0.09),
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xFFF5F5F5),
                    borderRadius: BorderRadius.circular(45)
                ),
                constraints: BoxConstraints.tightFor(width: media*0.5,height: media*0.12),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding:  EdgeInsets.only(left: media*0.045),
                child: Text(
                  "Cześć,",
                  style: TextStyle(fontSize: 50,fontWeight: FontWeight.w700),
                ),
              ),
              Container(
                color: Color(0xFF939393),
                constraints: BoxConstraints.tightFor(width: media*0.27,height: media*0.008),
              ),
              Padding(
                padding:  EdgeInsets.only(left: media*0.045),
                child: Text(
                  "Jakubie",
                  style: TextStyle(fontSize: 50,fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
