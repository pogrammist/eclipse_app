import 'package:eclipse_app/domain/model/album.dart';
import 'package:eclipse_app/domain/model/photo.dart';
import 'package:eclipse_app/domain/state/photos_state.dart';
import 'package:eclipse_app/internal/dependencies/photos_module.dart';
import 'package:flutter/material.dart';

class AlbumDetail extends StatefulWidget {
  final Album album;

  const AlbumDetail({Key key, @required this.album, int albumId})
      : super(key: key);

  @override
  _AlbumDetailState createState() => _AlbumDetailState();
}

class _AlbumDetailState extends State<AlbumDetail> {
  PhotosState _photosState;

  @override
  void initState() {
    super.initState();
    _photosState = PhotosModule.photosState();
  }

  Widget _buildPhotosListView(BuildContext context, List<Photo> photos) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _photosState.photos.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          // onTap: () => Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (BuildContext context) =>
          //         PostDetail(post: _albumsState.albums[index]),
          //   ),
          // ),
          child: Card(
            child: ListTile(
              leading: Image.network(
                photos[index].thumbnailUrl,
                width: 40,
              ),
              title: Text(
                _photosState.photos[index].title,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        );
      },
    );
  }

  FutureBuilder<List<Photo>> _buildAlbumDetailBody() {
    return FutureBuilder<List<Photo>>(
      future: _photosState.getAlbumPhotos(widget.album.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<Photo> photos = snapshot.data;
          return _buildPhotosListView(context, photos);
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Album #${widget.album.id}"),
          backgroundColor: Colors.amber,
        ),
        body: _buildAlbumDetailBody(),
      ),
    );
  }
}
