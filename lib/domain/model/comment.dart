import 'package:meta/meta.dart';

class Comment {
  final dynamic postId; //bad api
  final int id;
  final String name;
  final String email;
  final String body;

  Comment({
    @required this.postId,
    @required this.id,
    @required this.name,
    @required this.email,
    @required this.body,
  });
}
