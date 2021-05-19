import 'package:eclipse_app/data/api/model/api_album.dart';
import 'package:eclipse_app/domain/model/album.dart';

class AlbumMapper {
  static List<Album> fromApi(List<ApiAlbum> comments) {
    return comments
        .map<Album>((album) => Album(
              userId: album.userId,
              id: album.id,
              title: album.title,
            ))
        .toList();
  }
}
