import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:thaik_mobile/persistence/local_storage.dart';
import '/routes.dart';
import '/core/viewmodel/product_provider.dart';
import 'package:provider/provider.dart';
import '/screens/home.dart';
import '/screens/register.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
              }
          ),
          // Provider(
          //   create: (BuildContext context) {
          //     return AppDatabase();
          //   }
          // )
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
        home: FirebaseAuth.instance.currentUser == null ? Register() : Home(),
        routes: getRoutes(),
      ),
    );
  }
}