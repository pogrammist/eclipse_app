import 'package:eclipse_app/domain/state/posts_state.dart';

import 'repository_module.dart';

class PostsModule {
  static PostsState _postsState;

  static PostsState postsState() {
    if (_postsState == null) {
      _postsState = PostsState(
        RepositoryModule.postsRepository(),
      );
    }
    return _postsState;
  }
}
