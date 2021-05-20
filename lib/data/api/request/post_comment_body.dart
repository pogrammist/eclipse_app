import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class PostCommentBody {
  final int postId;
  final String name;
  final String email;
  final String body;

  PostCommentBody({
    @required this.postId,
    @required this.name,
    @required this.email,
    @required this.body,
  });

  Future<FormData> toApi() async {
    final FormData formData = FormData.fromMap({
      'postId': postId,
      'name': name,
      'email': email,
      'body': body,
    });
    print(formData.fields);
    return formData;
  }
}
