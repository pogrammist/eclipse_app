import 'package:eclipse_app/domain/model/comment.dart';
import 'package:eclipse_app/domain/model/post.dart';
import 'package:eclipse_app/domain/state/comments_state.dart';
import 'package:eclipse_app/internal/dependencies/comments_module.dart';
import 'package:flutter/material.dart';

class PostDetail extends StatefulWidget {
  final Post post;

  const PostDetail({Key key, this.post}) : super(key: key);

  @override
  _PostDetailState createState() => _PostDetailState();
}

class _PostDetailState extends State<PostDetail> {
  CommentsState _commentsState;

  @override
  void initState() {
    super.initState();
    _commentsState = CommentsModule.commentsState();
  }

  Widget _buildCommentsListView(
    BuildContext context,
    List<Comment> comments,
  ) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: comments.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: null,
          child: Card(
            child: ListTile(
              leading: Icon(
                Icons.comment,
                color: Colors.pink[900],
                size: 40,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    comments[index].email,
                    style: TextStyle(fontSize: 15),
                  ),
                  Text(
                    comments[index].name,
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
              subtitle: Text(comments[index].body),
            ),
          ),
        );
      },
    );
  }

  FutureBuilder<List<Comment>> _buildCommentsBody(BuildContext context) {
    return FutureBuilder<List<Comment>>(
      future: _commentsState.getPostComments(widget.post.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<Comment> comments = snapshot.data;
          return _buildCommentsListView(context, comments);
        } else {
          return LinearProgressIndicator();
        }
      },
    );
  }

  Widget _buildPostBody(BuildContext context) {
    return ListView(
      children: [
        Card(
          child: ListTile(
            leading: Icon(
              Icons.message,
              color: Colors.red,
              size: 40,
            ),
            title: Text(
              widget.post.title,
              style: TextStyle(fontSize: 20),
            ),
            subtitle: Text(widget.post.body),
          ),
        ),
        _buildCommentsBody(context),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Post #${widget.post.id}"),
          backgroundColor: Colors.red,
        ),
        body: _buildPostBody(context),
      ),
    );
  }
}
