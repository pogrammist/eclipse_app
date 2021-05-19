import 'package:eclipse_app/domain/model/post.dart';

abstract class PostsRepository {
  Future<List<Post>> getPosts();

  Future<List<Post>> getUserPosts(int userId);
}
