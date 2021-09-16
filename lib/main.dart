import 'package:flutter/material.dart';
import 'package:flutter_test_folder_structure/routes.dart';
import 'package:flutter_test_folder_structure/screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Food Recipe",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.white) 
        )
      ),
      home: Home(),
      routes: getRoutes(),
    );
  }
}