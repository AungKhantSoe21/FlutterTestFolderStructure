import 'package:flutter/material.dart';
import '/routes.dart';

import 'package:flutter_test_folder_structure/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      routes: getRoutes(),
      home: Login());
  }
}
