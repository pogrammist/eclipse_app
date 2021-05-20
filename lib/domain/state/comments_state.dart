import 'package:eclipse_app/domain/model/comment.dart';
import 'package:eclipse_app/domain/repository/comments_repository.dart';
import 'package:flutter/material.dart';
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

  @action
  Future<void> createPostComment({
    @required int postId,
    @required String name,
    @required String email,
    @required String body,
  }) async {
    comments.add(await _commentsRepository.createPostComment(
      postId: postId,
      name: name,
      email: email,
      body: body,
    ));
  }
}
