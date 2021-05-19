import 'package:eclipse_app/domain/model/photo.dart';

abstract class PhotosRepository {
  Future<List<Photo>> getAlbumPhotos(int albumId);
}
