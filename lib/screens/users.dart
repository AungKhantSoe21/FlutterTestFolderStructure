import 'package:flutter/material.dart';
import 'package:flutter_test_folder_structure/core/repository/user_api.dart';
import 'package:flutter_test_folder_structure/screens/home.dart';
import 'package:flutter_test_folder_structure/screens/login.dart';
import 'package:flutter_test_folder_structure/screens/products.dart';

class UserView extends StatefulWidget {
  static String route = 'UserView';

  @override
  _UserViewState createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {

  late List _users;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    getUserData();
  }

  getUserData() async {
    _users = await UserApi();

    setState(() {
      _isLoading = false;
    });

    print(_users);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.account_box),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, Home.route),
                icon: Icon(Icons.restaurant)),
            IconButton(
                onPressed: () => Navigator.pushNamed(context, ProductsOverviewScreen.route),
                icon: Icon(Icons.production_quantity_limits)),
            IconButton(
                onPressed: () => Navigator.pushNamed(context, Login.route),
                icon: Icon(Icons.logout_outlined)),
          ],
        ),
      body: _isLoading
        ? Center(
          child: CircularProgressIndicator(),
        )
        : ListView.builder(
          itemCount: _users.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(_users[i].name),
              subtitle: Text(_users[i].username),
              trailing: Text(_users[i].email, style: TextStyle(color: Colors.black),),
            );
          },
        )
    );
  }
}