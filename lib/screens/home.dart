import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  final url = 'https://jsonplaceholder.typicode.com/users';
  var users = [];

  void getUserData() async {
    try{
      var response = await http.get(Uri.parse(url));
      var jsonData = jsonDecode(response.body) as List;

      setState(() {
        users = jsonData;
      });
    }
    catch (err) {}
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Api Testing and folder structure"),
        ),
        body: Center(
          child: ListView.builder(
            itemBuilder: (context, i) {
              print(users.length);
              final user = users[i];
              return Card(
                child: Container(
                  width: double.infinity,
                  height: 40,
                  child: Text("${user['name']}", style: TextStyle(fontSize: 17),)
                ),
              );
            },
            itemCount: 6,
          ),
        )
      ),
    );
  }
}