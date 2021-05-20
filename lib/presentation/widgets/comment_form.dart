import 'package:eclipse_app/domain/state/comments_state.dart';
import 'package:eclipse_app/internal/dependencies/comments_module.dart';
import 'package:flutter/material.dart';

class CommentForm extends StatefulWidget {
  final int postId;

  const CommentForm({Key key, @required this.postId}) : super(key: key);

  @override
  CommentFormState createState() {
    return CommentFormState();
  }
}

class CommentFormState extends State<CommentForm> {
  CommentsState _commentsState;

  final _formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final mailController = TextEditingController();
  final commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _commentsState = CommentsModule.commentsState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Builder(
          builder: (BuildContext context) => SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "New comment",
                    style: TextStyle(fontSize: 20, color: Colors.grey[800]),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some name';
                      }
                      return null;
                    },
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(6.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: "Type in your name",
                        fillColor: Colors.white70),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: mailController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some email';
                      }
                      return null;
                    },
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(6.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: "Type in your email",
                        fillColor: Colors.white70),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: commentController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some comment';
                      }
                      return null;
                    },
                    decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(6.0),
                          ),
                        ),
                        filled: true,
                        hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: "Type in your comment",
                        fillColor: Colors.white70),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.pink[900],
                          onPrimary: Colors.white,
                          onSurface: Colors.grey,
                        ),
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            await _commentsState.createPostComment(
                              postId: widget.postId,
                              name: nameController.text,
                              email: mailController.text,
                              body: commentController.text,
                            );
                            Navigator.pop(context);
                            Scaffold.of(context).showSnackBar(
                              SnackBar(content: Text('Processing Data')),
                            );
                          }
                        },
                        child: Text('Submit'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
