import 'package:eclipse_app/domain/state/posts_state.dart';
import 'package:eclipse_app/internal/dependencies/posts_module.dart';
import 'package:flutter/material.dart';
import 'post_detail.dart';

class Posts extends StatefulWidget {
  @override
  _PostsState createState() => _PostsState();
}

class _PostsState extends State<Posts> {
  PostsState _postsState;

  @override
  void initState() {
    super.initState();
    _postsState = PostsModule.postsState();
  }

  Widget _buildPostsListView(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: _postsState.posts.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) =>
                  PostDetail(post: _postsState.posts[index]),
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
                _postsState.posts[index].title,
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(_postsState.posts[index].body),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Posts"),
          backgroundColor: Colors.orange,
        ),
        body: _buildPostsListView(context),
      ),
    );
  }
}
