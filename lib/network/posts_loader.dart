import 'dart:async';

import 'package:hardware_definition_app/network/post.dart';
import 'package:hardware_definition_app/network/wordpress.dart';
import 'package:flutter_wordpress/flutter_wordpress.dart' as net;

class PostsLoader {
  WordPress wp;

  PostsLoader(WordPress wp) {
    this.wp = wp;
  }

  Future<bool> loadFirstTenPosts(
      StreamController<Post> streamController) async {
    net.ParamsPostList paramsPostList = new net.ParamsPostList();
    await wp.fetchPostsButFast(
        postParams: paramsPostList,
        fetchAuthor: true,
        fetchFeaturedMedia: true,
        fetchCategories: true,
        streamController: streamController);
    return true;
  }

  Future<bool> loadPosts(
      StreamController<Post> streamController, int page) async {
    net.ParamsPostList paramsPostList =
        new net.ParamsPostList(pageNum: page, perPage: 10);
    await wp.fetchPostsButFast(
        postParams: paramsPostList,
        fetchAuthor: true,
        fetchFeaturedMedia: true,
        fetchCategories: true,
        streamController: streamController);
    return true;
  }
}
