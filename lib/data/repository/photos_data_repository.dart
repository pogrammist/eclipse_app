import 'package:eclipse_app/data/api/api_util.dart';
import 'package:eclipse_app/domain/model/photo.dart';
import 'package:eclipse_app/domain/repository/photos_repository.dart';

class PhotosDataRepository extends PhotosRepository {
  final ApiUtil _apiUtil;

  PhotosDataRepository(this._apiUtil);

  @override
  Future<List<Photo>> getAlbumPhotos(int albumId) =>
      _apiUtil.getAlbumPhotos(albumId);
}
