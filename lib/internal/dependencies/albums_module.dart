import 'package:eclipse_app/domain/state/albums_state.dart';

import 'repository_module.dart';

class AlbumsModule {
  static AlbumsState _albumsState;

  static AlbumsState albumsState() {
    if (_albumsState == null) {
      _albumsState = AlbumsState(
        RepositoryModule.albumsRepository(),
      );
    }
    return _albumsState;
  }
}
