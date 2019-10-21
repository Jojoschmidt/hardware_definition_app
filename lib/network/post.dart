import 'package:flutter_wordpress/flutter_wordpress.dart' as wp;

class Post extends wp.Post{
  Post();
  @override
  Post.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    date = json['date'];
    dateGmt = json['date_gmt'];
    guid = json['guid'] != null ? new wp.Guid.fromJson(json['guid']) : null;
    modified = json['modified'];
    modifiedGmt = json['modified_gmt'];
    password = json['password'];
    slug = json['slug'];
    if (json['status'] != null) {
      wp.PostPageStatus.values.forEach((val) {
        if (wp.enumStringToName(val.toString()) == json['status']) {
          status = val;
          return;
        }
      });
    }
    type = json['type'];
    link = json['link'];
    title = json['title'] != null ? new wp.Title.fromJson(json['title']) : null;
    content =
    json['content'] != null ? new wp.Content.fromJson(json['content']) : null;
    excerpt =
    json['excerpt'] != null ? new wp.Excerpt.fromJson(json['excerpt']) : null;
    authorID = json['author'];
    featuredMediaID = json['featured_media'];
    if (json['comment_status'] != null) {
      wp.PostCommentStatus.values.forEach((val) {
        if (wp.enumStringToName(val.toString()) == json['comment_status']) {
          commentStatus = val;
          return;
        }
      });
    }
    if (json['ping_status'] != null) {
      wp.PostPingStatus.values.forEach((val) {
        if (wp.enumStringToName(val.toString()) == json['ping_status']) {
          pingStatus = val;
          return;
        }
      });
    }
    sticky = json['sticky'];
    template = json['template'];
    if (json['format'] != null) {
      wp.PostFormat.values.forEach((val) {
        if (wp.enumStringToName(val.toString()) == json['format']) {
          format = val;
          return;
        }
      });
    }
    categoryIDs = json['categories'].cast<int>();
    tagIDs = json['tags'].cast<int>();
    permalinkTemplate = json['permalink_template'];
    generatedSlug = json['generated_slug'];
    lLinks = json['_links'] != null ? new wp.Links.fromJson(json['_links']) : null;
  }
}