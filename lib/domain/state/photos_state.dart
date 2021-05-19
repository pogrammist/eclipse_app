import 'package:eclipse_app/domain/model/photo.dart';
import 'package:eclipse_app/domain/repository/photos_repository.dart';

import 'package:mobx/mobx.dart';

part 'photos_state.g.dart';

class PhotosState = PhotosStateBase with _$PhotosState;

abstract class PhotosStateBase with Store {
  PhotosStateBase(this._photosRepository);

  final PhotosRepository _photosRepository;

  @observable
  ObservableList<Photo> photos = ObservableList();

  @action
  Future<List<Photo>> getAlbumPhotos(int albumId) async {
    photos = ObservableList.of(await _photosRepository.getAlbumPhotos(albumId));
    return photos;
  }
}
