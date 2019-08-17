import 'package:flutter/material.dart';
// ignore: must_be_immutable
class ProfileListElement extends StatefulWidget {
  String name;
  String routeToGoToName;
  IconData icon;

  ProfileListElement(this.name, this.routeToGoToName, this.icon);

  @override
  _ProfileListElementState createState() => _ProfileListElementState();
}

class _ProfileListElementState extends State<ProfileListElement> {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () => print(widget.routeToGoToName),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    widget.icon,
                    color: Colors.blueGrey.shade500,
                    size: 30,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: Text(
                    widget.name,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.blueGrey.shade500,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.blueGrey.shade500,
                size: 15,
              ),
            )
          ],
        ),
      ),
    );
  }
}
class ProfileListSeparator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(width: media.width,height: 1,color: Colors.blueGrey.shade50,),
    );
  }
}

