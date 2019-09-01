import 'package:flutter/material.dart';

import 'package:hardware_definition_app/constraints.dart';
import 'package:hardware_definition_app/screens/news/top_button_bar.dart';
import '../../navigation/bottom_navigation_bar.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;
import 'news_card.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  ScrollController scrollController;
  wp.WordPress wordPress = wp.WordPress(
    baseUrl: 'hardwaredefinition.pl',
    authenticator: wp.WordPressAuthenticator.JWT,
  );
  final String apiUrl = "https://hardwaredefinition.pl/wp-json/wp/v2/";
  List posts;

  Future<String> getPosts() async {
    var res = await http.get(Uri.encodeFull(apiUrl + "posts?_embed"),
        headers: {"Accept": "application/json"});
    setState(() {
      var resBody = json.decode(res.body);
      posts = resBody;
    });
    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    getPosts();
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
                        padding: EdgeInsets.only(top: 100, bottom: 150),
                        itemBuilder: (BuildContext context, int index) {
                          return NewsCard(
                              posts[index]['_embedded']['author'][0]["name"],
                              'wczoraj',
                              posts[index]['title']['rendered'],
                              'Konkurs',
                              Image.network(posts[index]["_embedded"]
                                              ["wp:featuredmedia"][0]
                                          ["source_url"] !=
                                      null
                                  ? posts[index]["_embedded"]
                                      ["wp:featuredmedia"][0]["source_url"]
                                  : 'https://i.kym-cdn.com/entries/icons/original/000/016/546/hidethepainharold.jpg'));
                        },
                        itemCount: posts == null ? 0 : posts.length,
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
                Hero(
                  tag: 'bottomNavigationBar',
                  child: CustomBottomNavigationBar(0),
                ),
              ],
            ),
            TopButtonBar(),
          ],
        ),
      ),
    );
  }
}
