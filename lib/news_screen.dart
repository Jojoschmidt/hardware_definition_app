import 'package:flutter/material.dart';

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
    scrollController = ScrollController()
      ..addListener(() => setState(() {
          }));

  }

  double get opacity {
    if (scrollController.hasClients) {
      if (scrollController.offset > 50) {
        return 0;
      } else if(scrollController.offset>=0) {
        return 1 - scrollController.offset / 50;
      }else{
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
                        padding: EdgeInsets.only(top: 100),
                        controller: scrollController,
                        itemBuilder: (BuildContext context, int index) {
                          return NewsCard();
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
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Container(
                      color: Color(0xFF28AA54),
                      constraints: BoxConstraints.tightFor(
                          width: media * 0.9, height: media * 0.2),
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(
                              Icons.home,
                              size: 40,
                            ),
                            Icon(
                              Icons.search,
                              size: 40,
                              color: Colors.black12,
                            ),
                            Icon(
                              Icons.bookmark,
                              size: 40,
                              color: Colors.black12,
                            ),
                            Icon(
                              Icons.person,
                              size: 40,
                              color: Colors.black12,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Opacity(
                  opacity: opacity,
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
                  opacity: opacity,
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
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 22),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
class Cus extends StatefulWidget {
  @override
  _CusState createState() => _CusState();
}

class _CusState extends State<Cus> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

