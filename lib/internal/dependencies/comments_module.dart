import 'package:eclipse_app/domain/state/comments_state.dart';

import 'repository_module.dart';

class CommentsModule {
  static CommentsState _commentsState;

  static CommentsState commentsState() {
    if (_commentsState == null) {
      _commentsState = CommentsState(
        RepositoryModule.commentsRepository(),
      );
    }
    return _commentsState;
  }
}
