import 'package:flutter/material.dart';

class NewsImageCard extends StatefulWidget {
  @override
  _NewsImageCardState createState() => _NewsImageCardState();
}

class _NewsImageCardState extends State<NewsImageCard> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(35),
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: <Widget>[
            Container(
              color: Color(0xFFCCCCCC),
              constraints: BoxConstraints.tightFor(width: media,height: media*0.5),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 12,left: 12),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: UnconstrainedBox(
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    constraints: BoxConstraints.tightFor(height: media*0.08),
                    color: Color(0xFF1D717C),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'Konkurs',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}