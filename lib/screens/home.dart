import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/core/model/recipe.dart';
import '/core/repository/recipe_api.dart';
import '/screens/products.dart';
import '/screens/login.dart';
import '/screens/users.dart';
import '/widgets/recipe_cart.dart';

class Home extends StatefulWidget {
  static String route = 'Home';
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Recipe> _recipes;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();

    getRecipes();
  }

  Future<void> getRecipes() async {
    _recipes = await RecipeApi.getRecipe();

    setState(() {
      _isLoading = false;
    });

    print(_recipes);
  }

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
              Icon(Icons.restaurant_menu),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () => Navigator.pushNamed(context, UserView.route),
                icon: Icon(Icons.account_box)),
            IconButton(
                onPressed: () => Navigator.pushNamed(context, ProductsOverviewScreen.route),
                icon: Icon(Icons.production_quantity_limits)),
            IconButton(
                onPressed: () => signOut().then((value) => Navigator.pushNamed(context, Login.route)),
                icon: Icon(Icons.logout_outlined)),
          ],
        ),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, i) {
                  return RecipeCard(_recipes[i].name, _recipes[i].totalTime,
                      _recipes[i].rating.toString(), _recipes[i].images);
                },
              ));
  }
}
