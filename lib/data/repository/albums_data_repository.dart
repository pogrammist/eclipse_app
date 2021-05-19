import 'package:eclipse_app/data/api/api_util.dart';
import 'package:eclipse_app/domain/model/album.dart';
import 'package:eclipse_app/domain/repository/albums_repository.dart';

class AlbumsDataRepository extends AlbumsRepository {
  final ApiUtil _apiUtil;

  AlbumsDataRepository(this._apiUtil);

  @override
  Future<List<Album>> getUserAlbums(int userId) =>
      _apiUtil.getUserAlbums(userId);
}
