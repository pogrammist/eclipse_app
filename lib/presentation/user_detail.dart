import 'package:eclipse_app/domain/model/album.dart';
import 'package:eclipse_app/domain/model/post.dart';
import 'package:eclipse_app/domain/model/user.dart';
import 'package:eclipse_app/domain/state/albums_state.dart';
import 'package:eclipse_app/domain/state/posts_state.dart';
import 'package:eclipse_app/internal/dependencies/albums_module.dart';
import 'package:eclipse_app/internal/dependencies/posts_module.dart';
import 'package:eclipse_app/presentation/posts.dart';

import 'package:flutter/material.dart';

import 'album_detail.dart';

class UserDetail extends StatefulWidget {
  final User user;

  const UserDetail({Key key, this.user}) : super(key: key);

  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  static const _postCount = 3;
  PostsState _postsState;
  AlbumsState _albumsState;

  @override
  void initState() {
    super.initState();
    _postsState = PostsModule.postsState();
    _albumsState = AlbumsModule.albumsState();
  }

  Widget _buildAlbumsListView(BuildContext context, List<Album> albums) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: albums.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  AlbumDetail(album: albums[index]),
            ),
          ),
          child: Card(
            child: ListTile(
              leading: Icon(
                Icons.image,
                color: Colors.amber,
                size: 40,
              ),
              title: Text(
                albums[index].title,
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
        );
      },
    );
  }

  FutureBuilder<List<Album>> _buildAlbumsBody() {
    return FutureBuilder<List<Album>>(
      future: _albumsState.getUserAlbums(widget.user.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<Album> albums = snapshot.data;
          return _buildAlbumsListView(context, albums);
        } else {
          return LinearProgressIndicator();
        }
      },
    );
  }

  Widget _buildAlbumsHeader() {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.image,
          color: Colors.amber,
          size: 40,
        ),
        title: Text(
          "Albums",
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text("all"),
      ),
    );
  }

  Widget _buildPostsListView(BuildContext context, List<Post> posts) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _postCount,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => Posts(),
            ),
          ),
          child: Card(
            child: ListTile(
              leading: Icon(
                Icons.message,
                color: Colors.orange,
                size: 40,
              ),
              title: Text(
                posts[index].title,
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(
                posts[index].body,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }

  FutureBuilder<List<Post>> _buildPostsBody() {
    return FutureBuilder<List<Post>>(
      future: _postsState.getUserPosts(widget.user.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<Post> posts = snapshot.data;
          return _buildPostsListView(context, posts);
        } else {
          return LinearProgressIndicator();
        }
      },
    );
  }

  Widget _buildPostsHeader() {
    return Card(
      child: ListTile(
        leading: Icon(
          Icons.message,
          color: Colors.orange,
          size: 40,
        ),
        title: Text(
          "Posts",
          style: TextStyle(fontSize: 20),
        ),
        subtitle: Text("first three"),
      ),
    );
  }

  Widget _buildUserDetailsBody() {
    return Column(
      children: [
        Card(
          child: ListTile(
            leading: Icon(
              Icons.account_box,
              color: Colors.green,
              size: 40,
            ),
            title: Text(
              widget.user.name,
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text('name'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.email,
              color: Colors.green,
              size: 40,
            ),
            title: Text(
              widget.user.email,
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text('email'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.phone,
              color: Colors.green,
              size: 40,
            ),
            title: Text(
              widget.user.phone,
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text('phone'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.web,
              color: Colors.green,
              size: 40,
            ),
            title: Text(
              widget.user.website,
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text('website'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.work,
              color: Colors.green,
              size: 40,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.company.name,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  widget.user.company.bs,
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  widget.user.company.catchPhrase,
                  style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                )
              ],
            ),
            subtitle: Text('company'),
          ),
        ),
        Card(
          child: ListTile(
            leading: Icon(
              Icons.place,
              color: Colors.green,
              size: 40,
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.user.address.city,
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  widget.user.address.street,
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  widget.user.address.suite,
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  widget.user.address.zipcode,
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "lat: ${widget.user.address.geo.lat}, lng: ${widget.user.address.geo.lng}",
                  style: TextStyle(fontSize: 10),
                ),
              ],
            ),
            subtitle: Text('address'),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.user.username),
          backgroundColor: Colors.green,
        ),
        body: ListView(
          children: [
            _buildUserDetailsBody(),
            _buildPostsHeader(),
            _buildPostsBody(),
            _buildAlbumsHeader(),
            _buildAlbumsBody(),
          ],
        ),
      ),
    );
  }
}
