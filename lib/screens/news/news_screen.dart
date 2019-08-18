import 'package:flutter/material.dart';

import 'package:hardware_definition_app/constraints.dart';
import 'package:hardware_definition_app/screens/news/top_button_bar.dart';
import 'bottom_navigation_bar.dart';
import 'news_card.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  ScrollController scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()..addListener(() => {});
  }

  double get opacity {
    if (scrollController.hasClients) {
      if (scrollController.offset > 50) {
        return 0;
      } else if (scrollController.offset >= 0) {
        return 1 - scrollController.offset / 50;
      } else {
        return 1;
      }
    } else {
      return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kNewsScreenBackgroundColor,
      body: SafeArea(
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: <Widget>[
            Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Expanded(
                      child: ListView.separated(
                        controller: scrollController,
                        padding: EdgeInsets.only(top: 100),
                        itemBuilder: (BuildContext context, int index) {
                          return NewsCard(
                              'Grzesiek Wąski',
                              'wczoraj',
                              'IOS oraz IPadOS 13 Beta 5 - Co Nowego?',
                              'Konkurs',
                              Image.network(
                                  'https://i.kym-cdn.com/entries/icons/original/000/016/546/hidethepainharold.jpg'));
                        },
                        itemCount: 6,
                        separatorBuilder: (BuildContext context, int index) =>
                            Padding(
                          padding: const EdgeInsets.only(
                              bottom: 20, top: 20, left: 10, right: 10),
                          child: SizedBox(
                            width: media,
                            height: 2,
                            child: Container(
                              color: Colors.grey.shade200,
                            ),
                          ),
                        ),
                        scrollDirection: Axis.vertical,
                      ),
                    )
                  ],
                ),
                CustomBottomNavigationBar(),
              ],
            ),
            TopButtonBar(),
          ],
        ),
      ),
    );
  }
}
