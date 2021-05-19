import 'package:eclipse_app/data/api/model/api_comment.dart';
import 'package:eclipse_app/domain/model/comment.dart';

class CommentMapper {
  static List<Comment> fromApi(List<ApiComment> comments) {
    return comments
        .map<Comment>((comment) => Comment(
              postId: comment.postId,
              id: comment.id,
              name: comment.name,
              email: comment.email,
              body: comment.body,
            ))
        .toList();
  }
}
