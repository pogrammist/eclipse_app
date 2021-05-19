import 'package:eclipse_app/data/api/model/api_post.dart';
import 'package:eclipse_app/domain/model/post.dart';

class PostMapper {
  static List<Post> fromApi(List<ApiPost> posts) {
    return posts
        .map<Post>((post) => Post(
              id: post.id,
              title: post.title,
              userId: post.userId,
              body: post.body,
            ))
        .toList();
  }
}
