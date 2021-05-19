import 'package:eclipse_app/data/api/model/api_photo.dart';
import 'package:eclipse_app/domain/model/photo.dart';

class PhotoMapper {
  static List<Photo> fromApi(List<ApiPhoto> comments) {
    return comments
        .map<Photo>((album) => Photo(
              albumId: album.albumId,
              id: album.id,
              title: album.title,
              url: album.url,
              thumbnailUrl: album.thumbnailUrl,
            ))
        .toList();
  }
}
