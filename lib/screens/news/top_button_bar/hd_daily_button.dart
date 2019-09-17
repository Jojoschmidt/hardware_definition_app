import 'package:flutter/material.dart';

import '../../../constraints.dart';

class HdDailyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size.width;

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
                color:Color(0x22000000),
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(0, 3)
            )
          ],
          color: Color(0xFF005485)
      ),
      constraints: BoxConstraints.tightFor(width: media*0.525,height: media *0.12 ),
      child: GestureDetector(

        child: Container(
          alignment: AlignmentDirectional.center,
          child: Text(
            'HardwareDaily News',
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: media*0.049,color: Colors.white,fontFamily: 'coolvetica'),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
