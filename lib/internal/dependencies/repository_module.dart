import 'package:eclipse_app/data/repository/albums_data_repository.dart';
import 'package:eclipse_app/data/repository/comments_data_repository.dart';
import 'package:eclipse_app/data/repository/photos_data_repository.dart';
import 'package:eclipse_app/data/repository/posts_data_repository.dart';
import 'package:eclipse_app/data/repository/users_data_repository.dart';
import 'package:eclipse_app/domain/repository/albums_repository.dart';
import 'package:eclipse_app/domain/repository/comments_repository.dart';
import 'package:eclipse_app/domain/repository/photos_repository.dart';
import 'package:eclipse_app/domain/repository/posts_repository.dart';
import 'package:eclipse_app/domain/repository/users_repository.dart';

import 'api_module.dart';

class RepositoryModule {
  static UsersRepository _userRepository;
  static PostsRepository _postsRepository;
  static CommentsRepository _commentssRepository;
  static AlbumsRepository _albumsRepository;
  static PhotosRepository _photosRepository;

  static UsersRepository usersRepository() {
    if (_userRepository == null) {
      _userRepository = UsersDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _userRepository;
  }

  static PostsRepository postsRepository() {
    if (_postsRepository == null) {
      _postsRepository = PostsDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _postsRepository;
  }

  static CommentsRepository commentsRepository() {
    if (_commentssRepository == null) {
      _commentssRepository = CommentsDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _commentssRepository;
  }

  static AlbumsRepository albumsRepository() {
    if (_albumsRepository == null) {
      _albumsRepository = AlbumsDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _albumsRepository;
  }

  static PhotosRepository photosRepository() {
    if (_photosRepository == null) {
      _photosRepository = PhotosDataRepository(
        ApiModule.apiUtil(),
      );
    }
    return _photosRepository;
  }
}
