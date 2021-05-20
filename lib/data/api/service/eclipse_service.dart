import 'package:dio/dio.dart';
import 'package:eclipse_app/data/api/model/api_album.dart';
import 'package:eclipse_app/data/api/model/api_comment.dart';
import 'package:eclipse_app/data/api/model/api_photo.dart';
import 'package:eclipse_app/data/api/model/api_post.dart';
import 'package:eclipse_app/data/api/model/api_user.dart';
import 'package:eclipse_app/data/api/request/post_comment_body.dart';
import 'package:flutter/foundation.dart';

List<ApiUser> parseUsers(dynamic responseBody) {
  // final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return responseBody.map<ApiUser>((json) => ApiUser.fromJson(json)).toList();
}

List<ApiPost> parsePosts(dynamic responseBody) {
  // final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return responseBody.map<ApiPost>((json) => ApiPost.fromJson(json)).toList();
}

List<ApiComment> parseComments(dynamic responseBody) {
  // final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return responseBody
      .map<ApiComment>((json) => ApiComment.fromJson(json))
      .toList();
}

List<ApiAlbum> parseAlbums(dynamic responseBody) {
  // final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return responseBody.map<ApiAlbum>((json) => ApiAlbum.fromJson(json)).toList();
}

List<ApiPhoto> parsePhotos(dynamic responseBody) {
  // final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return responseBody.map<ApiPhoto>((json) => ApiPhoto.fromJson(json)).toList();
}

class EclipseService {
  static const _BASE_URL = 'https://jsonplaceholder.typicode.com/';

  final Dio _dio = Dio(
    BaseOptions(baseUrl: _BASE_URL),
  );

  Future<List<ApiUser>> getUsers() async {
    final response = await _dio.get('users');
    switch (response.statusCode) {
      case 200:
        print(response.data);
        return compute(parseUsers, response.data);
        break;
      default:
        throw response.data;
        break;
    }
  }

  Future<List<ApiPost>> getPosts() async {
    final response = await _dio.get('posts');
    switch (response.statusCode) {
      case 200:
        print(response.data);
        return compute(parsePosts, response.data);
        break;
      default:
        throw response.data;
        break;
    }
  }

  Future<List<ApiPost>> getUserPosts(int userId) async {
    final response = await _dio.get('users/$userId/posts');
    switch (response.statusCode) {
      case 200:
        print(response.data);
        return compute(parsePosts, response.data);
        break;
      default:
        throw response.data;
        break;
    }
  }

  Future<List<ApiComment>> getPostComments(int postId) async {
    final response = await _dio.get('posts/$postId/comments');
    switch (response.statusCode) {
      case 200:
        print(response.data);
        return compute(parseComments, response.data);
        break;
      default:
        throw response.data;
        break;
    }
  }

  Future<ApiComment> createPostComment({
    @required int postId,
    @required PostCommentBody requestBody,
  }) async {
    final formData = await requestBody.toApi();
    final response = await _dio.post(
      'posts/$postId/comments',
      data: formData,
    );
    switch (response.statusCode) {
      case 201:
        print(response.data);
        return ApiComment.fromJson(response.data);
        break;
      default:
        throw response.data;
        break;
    }
  }

  Future<List<ApiAlbum>> getUserAlbums(int userId) async {
    final response = await _dio.get('users/$userId/albums');
    switch (response.statusCode) {
      case 200:
        print(response.data);
        return compute(parseAlbums, response.data);
        break;
      default:
        throw response.data;
        break;
    }
  }

  Future<List<ApiPhoto>> getAlbumPhotos(int albumId) async {
    final response = await _dio.get('albums/$albumId/photos');
    switch (response.statusCode) {
      case 200:
        print(response.data);
        return compute(parsePhotos, response.data);
        break;
      default:
        throw response.data;
        break;
    }
  }
}
