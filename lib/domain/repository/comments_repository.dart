import 'package:eclipse_app/domain/model/comment.dart';
import 'package:flutter/material.dart';

abstract class CommentsRepository {
  Future<List<Comment>> getPostComments(int postId);

  Future<Comment> createPostComment({
    @required int postId,
    @required String name,
    @required String email,
    @required String body,
  });
}
