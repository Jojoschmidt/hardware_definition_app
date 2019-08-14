import 'package:flutter/material.dart';

import 'news_card.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return NewsCard();
                  },
                  itemCount: 6,
                  separatorBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.only(bottom: 20,top: 20,left: 10,right: 10),
                    child: SizedBox(
                      width: media,height: 2,child: Container(color: Colors.grey.shade200,),
                    ),
                  ),
                  scrollDirection: Axis.vertical,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
