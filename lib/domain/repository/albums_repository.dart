import 'package:eclipse_app/domain/model/album.dart';

abstract class AlbumsRepository {
  Future<List<Album>> getUserAlbums(int userId);
}
