import 'package:flutter/material.dart';
import 'package:hardware_definition_app/navigation/bottom_navigation_bar.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: <Widget>[
            Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.close,
                    ),
                    Text('Wyszukiwanie')
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      decoration: new BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(45)),
                          boxShadow: [
                            new BoxShadow(
                                color: Colors.grey.shade300,
                                offset: new Offset(0, 10),
                                blurRadius: 30,
                                spreadRadius: 1)
                          ]),
                      constraints: BoxConstraints.tightFor(
                          width: media.width * 0.8, height: media.width * 0.12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Hero(
                            tag: 'search',
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(
                                Icons.search,
                                size: 30,
                              ),
                            ),
                          ),
                          Text('Co masz na myśli?')
                        ],
                      ),
                    )
                  ],
                ),
                Text('Proponowane'),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.shade300,
                                spreadRadius: 15,
                                blurRadius: 20)
                          ]),
                    ),
                  ),
                )
              ],
            ),
            Hero(
              tag: 'bottomNavigationBar',
              child: CustomBottomNavigationBar(1),
            ),
          ],
        ),
      ),
    );
  }
}
