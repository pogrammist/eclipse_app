import 'package:eclipse_app/domain/model/comment.dart';
import 'package:eclipse_app/domain/repository/comments_repository.dart';
import 'package:mobx/mobx.dart';

part 'comments_state.g.dart';

class CommentsState = CommentsStateBase with _$CommentsState;

abstract class CommentsStateBase with Store {
  CommentsStateBase(this._commentsRepository);

  final CommentsRepository _commentsRepository;

  @observable
  ObservableList<Comment> comments = ObservableList();

  @action
  Future<List<Comment>> getPostComments(int postId) async {
    comments =
        ObservableList.of(await _commentsRepository.getPostComments(postId));
    return comments;
  }
}
