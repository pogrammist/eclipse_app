import 'package:eclipse_app/domain/model/post.dart';
import 'package:eclipse_app/domain/repository/posts_repository.dart';
import 'package:mobx/mobx.dart';

part 'posts_state.g.dart';

class PostsState = PostsStateBase with _$PostsState;

abstract class PostsStateBase with Store {
  PostsStateBase(this._postsRepository);

  final PostsRepository _postsRepository;

  @observable
  ObservableList<Post> posts = ObservableList();

  @action
  Future<List<Post>> getUserPosts(int userId) async {
    posts = ObservableList.of(await _postsRepository.getUserPosts(userId));
    return posts;
  }
}
