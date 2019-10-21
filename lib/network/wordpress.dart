
import 'dart:async' as async;
import 'dart:async';
import 'dart:convert';

import 'package:hardware_definition_app/network/post.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;

/// All WordPress related functionality are defined under this class.
class WordPress {
  String _baseUrl;
  wp.WordPressAuthenticator _authenticator;

  Map<String, String> _urlHeader = {
    'Authorization': '',
  };

  /// If [WordPressAuthenticator.ApplicationPasswords] is used as an authenticator,
  /// [adminName] and [adminKey] is necessary for authentication.
  /// https://wordpress.org/plugins/application-passwords/
  WordPress({@required String baseUrl,
    wp.WordPressAuthenticator authenticator,
    String adminName,
    String adminKey}) {
    this._baseUrl = baseUrl.endsWith('/')
        ? baseUrl.substring(0, baseUrl.length - 1)
        : baseUrl;

    this._authenticator = authenticator;

    if (adminName != null && adminKey != null && this._authenticator != null) {
      switch (this._authenticator) {
        case wp.WordPressAuthenticator.ApplicationPasswords:
          String str = '$adminName:$adminKey';
          String base64 = base64Encode(utf8.encode(str));
          _urlHeader['Authorization'] = 'Basic $base64';
          break;
        case wp.WordPressAuthenticator.JWT:
        //TODO: Implement JWT Admin authentication
          break;
      }
    }
  }

  /// This returns a [User] object when a user with valid [username] and [password]
  /// has been successfully authenticated.
  ///
  /// In case of an error, a [WordPressError] object is thrown.
  async.Future<wp.User> authenticateUser(
      {@required username, @required password}) async {
    if (_authenticator == wp.WordPressAuthenticator.ApplicationPasswords) {
      return _authenticateViaAP(username, password);
    } else if (_authenticator == wp.WordPressAuthenticator.JWT) {
      return _authenticateViaJWT(username, password);
    } else
      return fetchUser(username: username);
  }

  async.Future<wp.User> _authenticateViaAP(username, password) async {
    //TODO: Implement Application Passwords User Authentication
    return fetchUser(username: username);
  }

  async.Future<wp.User> _authenticateViaJWT(username, password) async {
    final body = {
      'username': username,
      'password': password,
    };

    final response = await http.post(
      _baseUrl + wp.URL_JWT_TOKEN,
      body: body,
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      wp.JWTResponse authResponse =
      wp.JWTResponse.fromJson(json.decode(response.body));
      _urlHeader['Authorization'] = 'Bearer ${authResponse.token}';

      return fetchUser(email: authResponse.userEmail);
    } else {
      try {
        throw new wp.WordPressError.fromJson(json.decode(response.body));
      } catch (e) {
        throw new wp.WordPressError(message: response.body);
      }
    }
  }

  /// This returns a [User] object if the user with [id], [email] or [username]
  /// exists. Otherwise throws [WordPressError].
  ///
  /// Only one parameter is enough to search for the user.
  ///
  /// In case of an error, a [WordPressError] object is thrown.
  async.Future<wp.User> fetchUser({int id, String email, String username}) async {
    print('Starting to fetch user');

    final StringBuffer url = new StringBuffer(_baseUrl + wp.URL_USERS);
    final Map<String, String> params = {
      'search': '',
    };
    if (id != null) {
      params['search'] = '$id';
    } else if (email != null)
      params['search'] = email;
    else if (username != null) params['search'] = username;

    url.write(wp.constructUrlParams(params));
    final response = await http.get(url.toString(), headers: _urlHeader);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      final jsonStr = json.decode(response.body);
      print('Ending to fetch user');
      if (jsonStr.length == 0)
        throw new wp.WordPressError(
            code: 'wp_empty_list', message: "No users found");
      return wp.User.fromJson(jsonStr[0]);
    } else {
      try {
        wp.WordPressError err =
        wp.WordPressError.fromJson(json.decode(response.body));
        throw err;
      } catch (e) {
        throw new wp.WordPressError(message: response.body);
      }
    }
  }

  /// This returns a list of [Post] based on the filter parameters
  /// specified through [ParamsPostList] object. By default it returns only
  /// [ParamsPostList.perPage] number of posts in page [ParamsPostList.pageNum].
  ///
  /// [fetchAuthor], [fetchComments], [fetchCategories], [fetchTags],
  /// [fetchFeaturedMedia] and [fetchAttachments] will fetch and set [Post.author],
  /// [Post.comments], [Post.categories], [Post.tags], [Post.featuredMedia] and
  /// [Post.attachments] respectively. If they are non-existent, their values will
  /// null.
  ///
  /// (**Note:** *Set only those fetch boolean parameters which you need because
  /// the more information to fetch, the longer it will take to return all Posts*)
  ///
  /// In case of an error, a [WordPressError] object is thrown.

  /// This function fetches post information such as author, comments, categories,
  /// tags, featuredMedia and attachments.
  Future<Post> _postBuilder({
    var json,
    Post post,
    bool setAuthor = false,
    bool setComments = false,
    wp.Order orderComments = wp.Order.desc,
    wp.CommentOrderBy orderCommentsBy = wp.CommentOrderBy.date,
    bool setCategories = false,
    bool setTags = false,
    bool setFeaturedMedia = false,
    bool setAttachments = false,
  }) async {
    if (setAuthor) {
      wp.User author = new wp.User();
      author.name = json['_embedded']['author'][0]["name"];
      if (author.name != null) post.author = author;
    }
    if (setCategories) {
      List<wp.Category> categories =
      await fetchCategories(params: wp.ParamsCategoryList(post: post.id));
      if (categories != null && categories.length != 0)
        post.categories = categories;
    }
    if (setTags) {
      List<wp.Tag> tags =
      await fetchTags(params: wp.ParamsTagList(post: post.id));
      if (tags != null && tags.length != 0) post.tags = tags;
    }
    if (setFeaturedMedia) {
      wp.Media media = new wp.Media();
      try {
        media.sourceUrl =
        json["_embedded"]["wp:featuredmedia"][0]['source_url'];
        if (media.sourceUrl != null) post.featuredMedia = media;
      } catch (e) {
        print("No media");
      }
    }
    if (setAttachments) {
      List<wp.Media> media = await fetchMediaList(
        params: wp.ParamsMediaList(
          includeParentIDs: [post.id],
        ),
      );
      if (media != null && media.length != 0) post.attachments = media;
    }
    return post;
  }

  Future<List<Post>> fetchPostsButFast({
    @required wp.ParamsPostList postParams,
    bool fetchAuthor = false,
    bool fetchComments = false,
    wp.Order orderComments = wp.Order.desc,
    wp.CommentOrderBy orderCommentsBy = wp.CommentOrderBy.date,
    bool fetchCategories = false,
    bool fetchTags = false,
    bool fetchFeaturedMedia = false,
    bool fetchAttachments = false,
    StreamController<Post> streamController,
  }) async {
    print('Starting to fetch posts');
    final StringBuffer url = new StringBuffer(_baseUrl + wp.URL_POSTS);
    url.write(postParams.toString());
    url.write('_embed');
    print(url.toString());
    final response = await http.get(url.toString(), headers: _urlHeader);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      List<Post> posts = new List();
      final list = json.decode(response.body);

      for (final post in list) {
        streamController.add(await _postBuilder(
          json: post,
          post: Post.fromJson(post),
          setAuthor: fetchAuthor,
          setComments: fetchComments,
          orderComments: orderComments,
          orderCommentsBy: orderCommentsBy,
          setCategories: fetchCategories,
          setTags: fetchTags,
          setFeaturedMedia: fetchFeaturedMedia,
          setAttachments: fetchAttachments,
        ));
      }
      print('Ending to fetch posts');
      return posts;
    } else {
      try {
        wp.WordPressError err =
        wp.WordPressError.fromJson(json.decode(response.body));
        throw err;
      } catch (e) {
        throw new wp.WordPressError(message: response.body);
      }
    }
  }


  ///This recursive function builds the hierarchy of comments for the given post
  ///and comment. Only parent comments (direct comments to post) need to be
  ///supplied.
  wp.CommentHierarchy _commentHierarchyBuilder(List<wp.Comment> commentList,
      wp.Comment comment) {
    final childComments = commentList.where((ele) =>
    ele.id != comment.id && ele.parent != 0 && ele.parent == comment.id);

    if (childComments == null || childComments.length == 0) {
      return new wp.CommentHierarchy(comment: comment, children: null);
    } else {
      List<wp.CommentHierarchy> children = new List();
      childComments.forEach((c) {
        children.add(_commentHierarchyBuilder(commentList, c));
      });
      return new wp.CommentHierarchy(
        comment: comment,
        children: children,
      );
    }
  }

  /// This returns a list of [Page] based on the filter parameters
  /// specified through [ParamsPageList] object. By default it returns only
  /// [ParamsPageList.perPage] number of pages in page [ParamsPageList.pageNum].
  ///
  /// In case of an error, a [WordPressError] object is thrown.
  async.Future<List<wp.Page>> fetchPages({@required wp.ParamsPageList params}) async {
    final StringBuffer url = new StringBuffer(_baseUrl + wp.URL_PAGES);

    url.write(params.toString());

    final response = await http.get(url.toString(), headers: _urlHeader);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      List<wp.Page> pages = new List<wp.Page>();
      final list = json.decode(response.body);
      list.forEach((page) {
        pages.add(wp.Page.fromJson(page));
      });
      return pages;
    } else {
      try {
        wp.WordPressError err =
        wp.WordPressError.fromJson(json.decode(response.body));
        throw err;
      } catch (e) {
        throw new wp.WordPressError(message: response.body);
      }
    }
  }

  /// This returns a list of [User] based on the filter parameters
  /// specified through [ParamsUserList] object. By default it returns only
  /// [ParamsUserList.perPage] number of users in page [ParamsUserList.pageNum].
  ///
  /// In case of an error, a [WordPressError] object is thrown.
  async.Future<List<wp.User>> fetchUsers({@required wp.ParamsUserList params}) async {
    final StringBuffer url = new StringBuffer(_baseUrl + wp.URL_USERS);

    url.write(params.toString());

    final response = await http.get(url.toString(), headers: _urlHeader);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      List<wp.User> users = new List<wp.User>();
      final list = json.decode(response.body);
      list.forEach((user) {
        users.add(wp.User.fromJson(user));
      });
      return users;
    } else {
      try {
        wp.WordPressError err =
        wp.WordPressError.fromJson(json.decode(response.body));
        throw err;
      } catch (e) {
        throw new wp.WordPressError(message: response.body);
      }
    }
  }

  /// This returns a list of [Comment] based on the filter parameters
  /// specified through [ParamsCommentList] object. By default it returns only
  /// [ParamsCommentList.perPage] number of comments in page [ParamsCommentList.pageNum].
  ///
  /// In case of an error, a [WordPressError] object is thrown.
  async.Future<List<wp.Comment>> fetchComments(
      {@required wp.ParamsCommentList params}) async {
    final StringBuffer url = new StringBuffer(_baseUrl + wp.URL_COMMENTS);

    url.write(params.toString());

    final response = await http.get(url.toString(), headers: _urlHeader);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      List<wp.Comment> comments = new List<wp.Comment>();
      final list = json.decode(response.body);
      list.forEach((comment) {
        comments.add(wp.Comment.fromJson(comment));
      });
      return comments;
    } else {
      try {
        wp.WordPressError err =
        wp.WordPressError.fromJson(json.decode(response.body));
        throw err;
      } catch (e) {
        throw new wp.WordPressError(message: response.body);
      }
    }
  }

  /// This returns a list of [CommentHierarchy] based on the filter parameters
  /// specified through [ParamsCommentList] object. The list returned has all
  /// parent comments (i.e. comments directed towards posts) with
  /// [CommentHierarchy.children] containing the replies to that comment.
  ///
  /// In case of an error, a [WordPressError] object is thrown.
  async.Future<List<wp.CommentHierarchy>> fetchCommentsAsHierarchy(
      {@required wp.ParamsCommentList params}) async {
    final StringBuffer url = new StringBuffer(_baseUrl + wp.URL_COMMENTS);

    url.write(params.toString());

    final response = await http.get(url.toString(), headers: _urlHeader);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      List<wp.Comment> comments = new List<wp.Comment>();
      List<wp.CommentHierarchy> commentsHierarchy = new List<wp.CommentHierarchy>();
      final list = json.decode(response.body);
      list.forEach((comment) {
        comments.add(wp.Comment.fromJson(comment));
      });

      comments.forEach((comment) {
        if (comment.parent == 0)
          commentsHierarchy.add(_commentHierarchyBuilder(comments, comment));
      });
      return commentsHierarchy;
    } else {
      try {
        wp.WordPressError err =
        wp.WordPressError.fromJson(json.decode(response.body));
        throw err;
      } catch (e) {
        throw new wp.WordPressError(message: response.body);
      }
    }
  }

  /// This returns a list of [Category] based on the filter parameters
  /// specified through [ParamsCategoryList] object. By default it returns only
  /// [ParamsCategoryList.perPage] number of categories in page [ParamsCategoryList.pageNum].
  ///
  /// In case of an error, a [WordPressError] object is thrown.
  async.Future<List<wp.Category>> fetchCategories(
      {@required wp.ParamsCategoryList params}) async {
    print('Starting to fetch categories');

    final StringBuffer url = new StringBuffer(_baseUrl + wp.URL_CATEGORIES);

    url.write(params.toString());

    final response = await http.get(url.toString(), headers: _urlHeader);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      List<wp.Category> categories = new List<wp.Category>();
      final list = json.decode(response.body);
      list.forEach((category) {
        categories.add(wp.Category.fromJson(category));
      });
      print('Ending to fetch categories');

      return categories;
    } else {
      try {
        wp.WordPressError err =
        wp.WordPressError.fromJson(json.decode(response.body));
        throw err;
      } catch (e) {
        throw new wp.WordPressError(message: response.body);
      }
    }
  }

  /// This returns a list of [Tag] based on the filter parameters
  /// specified through [ParamsTagList] object. By default it returns only
  /// [ParamsTagList.perPage] number of tags in page [ParamsTagList.pageNum].
  ///
  /// In case of an error, a [WordPressError] object is thrown.
  async.Future<List<wp.Tag>> fetchTags({@required wp.ParamsTagList params}) async {
    final StringBuffer url = new StringBuffer(_baseUrl + wp.URL_TAGS);

    url.write(params.toString());

    final response = await http.get(url.toString(), headers: _urlHeader);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      List<wp.Tag> tags = new List<wp.Tag>();
      final list = json.decode(response.body);
      list.forEach((tag) {
        tags.add(wp.Tag.fromJson(tag));
      });
      return tags;
    } else {
      try {
        wp.WordPressError err =
        wp.WordPressError.fromJson(json.decode(response.body));
        throw err;
      } catch (e) {
        throw new wp.WordPressError(message: response.body);
      }
    }
  }

  /// This returns a list of [Media] based on the filter parameters
  /// specified through [ParamsMediaList] object. By default it returns only
  /// [ParamsMediaList.perPage] number of tags in page [ParamsMediaList.pageNum].
  ///
  /// In case of an error, a [WordPressError] object is thrown.
  async.Future<List<wp.Media>> fetchMediaList(
      {@required wp.ParamsMediaList params}) async {
    print('Starting to fetch media');
    final StringBuffer url = new StringBuffer(_baseUrl + wp.URL_MEDIA);

    url.write(params.toString());

    final response = await http.get(url.toString(), headers: _urlHeader);

    if (response.statusCode >= 200 && response.statusCode < 300) {
      List<wp.Media> media = new List<wp.Media>();
      final list = json.decode(response.body);
      list.forEach((m) {
        media.add(wp.Media.fromJson(m));
      });
      print('Ending to fetch media');
      return media;
    } else {
      try {
        wp.WordPressError err =
        wp.WordPressError.fromJson(json.decode(response.body));
        throw err;
      } catch (e) {
        throw new wp.WordPressError(message: response.body);
      }
    }
  }

  /// This is used to create a [Post] in the site. Before this method can be called,
  /// [User] creating the post needs to be authenticated first by calling
  /// [WordPress.authenticateUser]. On success, the [Post] object is returned containing
  /// post information.
  ///
  /// In case of an error, a [WordPressError] object is thrown.
  async.Future<Post> createPost({@required Post post}) async {
    final StringBuffer url = new StringBuffer(_baseUrl + wp.URL_POSTS);

    final response = await http.post(
      url.toString(),
      headers: _urlHeader,
      body: post.toJson(),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return Post.fromJson(json.decode(response.body));
    } else {
      try {
        wp.WordPressError err =
        wp.WordPressError.fromJson(json.decode(response.body));
        throw err;
      } catch (e) {
        throw new wp.WordPressError(message: response.body);
      }
    }
  }

  /// This is used to create a [Comment] for a [Post]. Before this method can be called,
  /// [User] writing the comment needs to be authenticated first by calling
  /// [WordPress.authenticateUser]. On success, the [Comment] object is returned containing
  /// comment information.
  ///
  /// In case of an error, a [WordPressError] object is thrown.
  async.Future<wp.Comment> createComment({@required wp.Comment comment}) async {
    final StringBuffer url = new StringBuffer(_baseUrl + wp.URL_COMMENTS);

    final response = await http.post(
      url.toString(),
      headers: _urlHeader,
      body: comment.toJson(),
    );

    if (response.statusCode >= 200 && response.statusCode < 300) {
      return wp.Comment.fromJson(json.decode(response.body));
    } else {
      try {
        wp.WordPressError err =
        wp.WordPressError.fromJson(json.decode(response.body));
        throw err;
      } catch (e) {
        throw new wp.WordPressError(message: response.body);
      }
    }
  }
}
