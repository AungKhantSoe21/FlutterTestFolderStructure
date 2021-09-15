import 'dart:convert';
import 'package:http/http.dart' as http; 
import 'package:flutter/material.dart';
// import 'package:flutter_test_folder_structure/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  final url = 'https://jsonplaceholder.typicode.com/users';
  var users = [];

  void getUserData() async {
    try{
      var response = await http.get(Uri('jsonplaceholder.typicode.com', 'users'));
      var jsonData = jsonDecode(response.body) as List;

      setState(() {
        users = jsonData;
      });
    }
    catch (err) {}
  }

  @override
  void initState() {
    super.initState();
    getUserData();
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