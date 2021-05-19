import 'package:eclipse_app/domain/model/user.dart';
import 'package:flutter/material.dart';
import 'package:eclipse_app/domain/state/home_state.dart';
import 'package:eclipse_app/internal/dependencies/home_module.dart';

import 'user_detail.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeState _homeState;

  @override
  void initState() {
    super.initState();
    _homeState = HomeModule.homeState();
  }

  Widget _buildUsersListView(BuildContext context, List<User> users) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => UserDetail(user: users[index]),
            ),
          ),
          child: Card(
            child: ListTile(
              leading: Icon(
                Icons.account_box,
                color: Colors.blue,
                size: 50,
              ),
              title: Text(
                users[index].username,
                style: TextStyle(fontSize: 20),
              ),
              subtitle: Text(users[index].name),
            ),
          ),
        );
      },
    );
  }

  FutureBuilder<List<User>> _buildBody(BuildContext context) {
    return FutureBuilder<List<User>>(
      future: _homeState.getUsers(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<User> users = snapshot.data;
          return _buildUsersListView(context, users);
        } else {
          return LinearProgressIndicator();
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
          title: Text('Eclipse Users'),
        ),
        body: _buildBody(context),
      ),
    );
  }
}
