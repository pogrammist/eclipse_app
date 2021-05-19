import 'package:eclipse_app/data/api/api_util.dart';
import 'package:eclipse_app/domain/model/post.dart';
import 'package:eclipse_app/domain/repository/posts_repository.dart';

class PostsDataRepository extends PostsRepository {
  final ApiUtil _apiUtil;

  PostsDataRepository(this._apiUtil);

  @override
  Future<List<Post>> getPosts() => _apiUtil.getPosts();

  @override
  Future<List<Post>> getUserPosts(int userId) => _apiUtil.getUserPosts(userId);
}
