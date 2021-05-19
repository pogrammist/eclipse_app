// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PhotosState on PhotosStateBase, Store {
  final _$photosAtom = Atom(name: 'PhotosStateBase.photos');

  @override
  ObservableList<Photo> get photos {
    _$photosAtom.reportRead();
    return super.photos;
  }

  @override
  set photos(ObservableList<Photo> value) {
    _$photosAtom.reportWrite(value, super.photos, () {
      super.photos = value;
    });
  }

  final _$getAlbumPhotosAsyncAction =
      AsyncAction('PhotosStateBase.getAlbumPhotos');

  @override
  Future<List<Photo>> getAlbumPhotos(int albumId) {
    return _$getAlbumPhotosAsyncAction.run(() => super.getAlbumPhotos(albumId));
  }

  @override
  String toString() {
    return '''
photos: ${photos}
    ''';
  }
}
