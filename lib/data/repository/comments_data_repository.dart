import 'package:eclipse_app/data/api/api_util.dart';
import 'package:eclipse_app/domain/model/comment.dart';

import 'package:eclipse_app/domain/repository/comments_repository.dart';

class CommentsDataRepository extends CommentsRepository {
  final ApiUtil _apiUtil;

  CommentsDataRepository(this._apiUtil);

  @override
  Future<List<Comment>> getPostComments(int postId) =>
      _apiUtil.getPostComments(postId);
}
