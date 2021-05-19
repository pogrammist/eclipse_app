import 'package:eclipse_app/domain/state/photos_state.dart';

import 'repository_module.dart';

class PhotosModule {
  static PhotosState _photosState;

  static PhotosState photosState() {
    if (_photosState == null) {
      _photosState = PhotosState(
        RepositoryModule.photosRepository(),
      );
    }
    return _photosState;
  }
}
