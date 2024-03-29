// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostsState on PostsStateBase, Store {
  final _$postsAtom = Atom(name: 'PostsStateBase.posts');

  @override
  ObservableList<Post> get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(ObservableList<Post> value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  final _$getUserPostsAsyncAction = AsyncAction('PostsStateBase.getUserPosts');

  @override
  Future<List<Post>> getUserPosts(int userId) {
    return _$getUserPostsAsyncAction.run(() => super.getUserPosts(userId));
  }

  @override
  String toString() {
    return '''
posts: ${posts}
    ''';
  }
}
