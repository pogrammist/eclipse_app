import 'package:eclipse_app/domain/model/album.dart';
import 'package:eclipse_app/domain/repository/albums_repository.dart';
import 'package:mobx/mobx.dart';

part 'albums_state.g.dart';

class AlbumsState = AlbumsStateBase with _$AlbumsState;

abstract class AlbumsStateBase with Store {
  AlbumsStateBase(this._albumsRepository);

  final AlbumsRepository _albumsRepository;

  @observable
  ObservableList<Album> albums = ObservableList();

  @action
  Future<List<Album>> getUserAlbums(int postId) async {
    albums = ObservableList.of(await _albumsRepository.getUserAlbums(postId));
    return albums;
  }
}
