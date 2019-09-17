import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart';
class PostsLoader{
  WordPress wp;
  PostsLoader(WordPress wp){
    this.wp = wp;
  }
  void loadFirstTenPosts(StreamController <Post> streamController) async{
    ParamsPostList paramsPostList = new ParamsPostList();
    wp.fetchPostsButFast(postParams: paramsPostList,fetchAuthor: true,fetchFeaturedMedia: true,fetchCategories: true,streamController: streamController);
  }
}