import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart';
import 'package:hardware_definition_app/network/posts_loader.dart';
import 'package:hardware_definition_app/screens/news/news_card/welcome_message.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:rxdart/rxdart.dart';
import 'news_card/news_card.dart';

class NewsCardsList extends StatefulWidget {
  @override
  _NewsCardsListState createState() => _NewsCardsListState();
}

class _NewsCardsListState extends State<NewsCardsList> {
  bool postsLoaded = false;
  static WordPress wordPress =
      new WordPress(baseUrl: "https://hardwaredefinition.pl");
  PostsLoader postsLoader = new PostsLoader(wordPress);
  StreamController <Post> streamController;
  List <Post> posts = new List();

  void getPosts() async {
    postsLoader.loadFirstTenPosts(streamController);
    setState(() {
      postsLoaded = true;
    });
  }

  @override
  void initState() {
    super.initState();
    streamController = StreamController.broadcast();
    streamController.stream.listen((p)=>setState(()=>posts.add(p)));
    getPosts();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size.width;
    return postsLoaded ? ListView.separated(
      padding: EdgeInsets.only(top: media*0.27, bottom: 150),
      itemBuilder: (BuildContext context, int index) {
        return index ==0 ? WelcomeMessage() : NewsCard(
            posts[index-1].author != null ? posts[index-1].author.name : "Grzesiek Wąchocki",
            'wczoraj',
            posts[index-1].title.rendered,
            posts[index-1].categories != null ? posts[index-1].categories[0].name : "Dupa",
            Image.network(posts[index-1].featuredMedia != null
                ? posts[index-1].featuredMedia.sourceUrl
                : 'https://i.kym-cdn.com/entries/icons/original/000/016/546/hidethepainharold.jpg'),
            posts[index-1].content.rendered);
      },
      itemCount: posts == null ? 0 : posts.length+1,
      separatorBuilder: (BuildContext context, int index) => Container(constraints: BoxConstraints.tightFor(height: media*0.07),),
      scrollDirection: Axis.vertical,
    ): Container(
      color: Colors.blue,
      alignment: AlignmentDirectional.center,
      child: Loading(
        indicator: BallPulseIndicator(),
        size: 100.0,
      ),
    );
  }
}
