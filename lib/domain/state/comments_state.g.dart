// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CommentsState on CommentsStateBase, Store {
  final _$commentsAtom = Atom(name: 'CommentsStateBase.comments');

  @override
  ObservableList<Comment> get comments {
    _$commentsAtom.reportRead();
    return super.comments;
  }

  @override
  set comments(ObservableList<Comment> value) {
    _$commentsAtom.reportWrite(value, super.comments, () {
      super.comments = value;
    });
  }

  final _$getPostCommentsAsyncAction =
      AsyncAction('CommentsStateBase.getPostComments');

  @override
  Future<List<Comment>> getPostComments(int postId) {
    return _$getPostCommentsAsyncAction
        .run(() => super.getPostComments(postId));
  }

  final _$createPostCommentAsyncAction =
      AsyncAction('CommentsStateBase.createPostComment');

  @override
  Future<void> createPostComment(
      {@required int postId,
      @required String name,
      @required String email,
      @required String body}) {
    return _$createPostCommentAsyncAction.run(() => super.createPostComment(
        postId: postId, name: name, email: email, body: body));
  }

  @override
  String toString() {
    return '''
comments: ${comments}
    ''';
  }
}
