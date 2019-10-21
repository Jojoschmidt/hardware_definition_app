import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hardware_definition_app/network/post.dart';
import 'package:hardware_definition_app/network/posts_loader.dart';
import 'package:hardware_definition_app/network/wordpress.dart';
import 'package:hardware_definition_app/screens/news/news_card/welcome_message.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'news_card/news_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsCardsList extends StatefulWidget {
  @override
  _NewsCardsListState createState() => _NewsCardsListState();
}

class _NewsCardsListState extends State<NewsCardsList> {
  bool postsLoaded = false;
  int currentPage = 1;
  static WordPress wordPress = new WordPress(baseUrl: "https://hardwaredefinition.pl");
  PostsLoader postsLoader = new PostsLoader(wordPress);
  StreamController<Post> streamController;
  List<Post> posts = new List();


  void loadPosts() async {
    await postsLoader.loadPosts(streamController, currentPage);
    currentPage += 1;
    postsLoaded = true;
  }
  @override
  void initState() {
    super.initState();
    streamController = StreamController.broadcast();
    streamController.stream.listen((p) => setState(() => posts.add(p)));
    loadPosts();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size.width;
    return NotificationListener<ScrollNotification>(
      onNotification:  (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels ==
            scrollInfo.metrics.maxScrollExtent &&postsLoaded) {
          postsLoaded = false;
          loadPosts();
        }
        return true;
      },
      child: ListView.separated(
              padding: EdgeInsets.only(top: media * 0.27, bottom: 150),
              itemBuilder: (BuildContext context, int index) {
                return NewsCard(
                        posts[index].author != null
                            ? posts[index].author.name
                            : "Grzesiek Wąchocki",
                        'wczoraj',
                        posts[index].title.rendered,
                        posts[index].categories != null
                            ? posts[index].categories[0].name
                            : "Dupa",
                        Image.network(posts[index].featuredMedia != null
                            ? posts[index].featuredMedia.sourceUrl
                            : 'https://i.kym-cdn.com/entries/icons/original/000/016/546/hidethepainharold.jpg'),
                        posts[index].content.rendered);
              },
              itemCount: posts == null ? 0 : posts.length,
              separatorBuilder: (BuildContext context, int index) => Container(
                constraints: BoxConstraints.tightFor(height: media * 0.07),
              ),
              scrollDirection: Axis.vertical,
            ),
    );
  }
}
