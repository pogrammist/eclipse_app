import 'package:eclipse_app/data/mapper/album_mapper.dart';
import 'package:eclipse_app/data/mapper/comment_mapper.dart';
import 'package:eclipse_app/data/mapper/photo_mapper.dart';
import 'package:eclipse_app/data/mapper/post_mapper.dart';
import 'package:eclipse_app/data/mapper/user_mapper.dart';
import 'package:eclipse_app/domain/model/album.dart';
import 'package:eclipse_app/domain/model/comment.dart';
import 'package:eclipse_app/domain/model/photo.dart';
import 'package:eclipse_app/domain/model/post.dart';
import 'package:eclipse_app/domain/model/user.dart';

import 'service/eclipse_service.dart';

class ApiUtil {
  final EclipseService _eclipseService;

  ApiUtil(this._eclipseService);

  Future<List<User>> getUsers() async {
    final result = await _eclipseService.getUsers();
    return UserMapper.fromApi(result);
  }

  Future<List<Post>> getPosts() async {
    final result = await _eclipseService.getPosts();
    return PostMapper.fromApi(result);
  }

  Future<List<Post>> getUserPosts(int userId) async {
    final result = await _eclipseService.getUserPosts(userId);
    return PostMapper.fromApi(result);
  }

  Future<List<Comment>> getPostComments(int commentId) async {
    final result = await _eclipseService.getPostComments(commentId);
    return CommentMapper.fromApi(result);
  }

  Future<List<Album>> getUserAlbums(int userId) async {
    final result = await _eclipseService.getUserAlbums(userId);
    return AlbumMapper.fromApi(result);
  }

  Future<List<Photo>> getAlbumPhotos(int albumId) async {
    final result = await _eclipseService.getAlbumPhotos(albumId);
    return PhotoMapper.fromApi(result);
  }
}
