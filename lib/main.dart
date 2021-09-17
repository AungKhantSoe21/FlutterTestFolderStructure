import 'package:flutter/material.dart';
import 'package:flutter_test_folder_structure/routes.dart';
import 'package:flutter_test_folder_structure/screens/home.dart';
import 'package:flutter_test_folder_structure/utils/product_provider.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
          ChangeNotifierProvider<Products>(
              create: (BuildContext context) {
                return Products();
              }),
      ],
      child: MaterialApp(
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
      ),
    );
  }
}