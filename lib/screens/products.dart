import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/screens/home.dart';
import '/screens/users.dart';

import '../widgets/products_grid.dart';
import 'login.dart';

class ProductsOverviewScreen extends StatefulWidget {
  static String route = 'ProductsOverviewScreen';

  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {

  Future<void> signOut() async {
    try {
      FirebaseAuth.instance.signOut();
    } catch (e) {
      print(e);
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.production_quantity_limits),
          ],
        ),
        actions: [
          IconButton(
              onPressed: () => Navigator.pushNamed(context, Home.route),
              icon: Icon(Icons.restaurant)),
          IconButton(
              onPressed: () => Navigator.pushNamed(context, UserView.route),
              icon: Icon(Icons.account_box)),
          IconButton(
              onPressed: () => signOut().then((value) => Navigator.pushNamed(context, Login.route)),
              icon: Icon(Icons.logout_outlined)),
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
