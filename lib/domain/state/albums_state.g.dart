// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'albums_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AlbumsState on AlbumsStateBase, Store {
  final _$albumsAtom = Atom(name: 'AlbumsStateBase.albums');

  @override
  ObservableList<Album> get albums {
    _$albumsAtom.reportRead();
    return super.albums;
  }

  @override
  set albums(ObservableList<Album> value) {
    _$albumsAtom.reportWrite(value, super.albums, () {
      super.albums = value;
    });
  }

  final _$getUserAlbumsAsyncAction =
      AsyncAction('AlbumsStateBase.getUserAlbums');

  @override
  Future<List<Album>> getUserAlbums(int postId) {
    return _$getUserAlbumsAsyncAction.run(() => super.getUserAlbums(postId));
  }

  @override
  String toString() {
    return '''
albums: ${albums}
    ''';
  }
}
