import 'package:eclipse_app/domain/model/comment.dart';

abstract class CommentsRepository {
  Future<List<Comment>> getPostComments(int postId);
}
