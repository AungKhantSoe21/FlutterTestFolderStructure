import 'package:flutter/material.dart';
import 'package:flutter_test_folder_structure/core/model/recipe.dart';
import 'package:flutter_test_folder_structure/core/repository/recipe_api.dart';
import 'package:flutter_test_folder_structure/screens/products.dart';

import '/screens/login.dart';
import 'package:flutter_test_folder_structure/screens/users.dart';
import 'package:flutter_test_folder_structure/widgets/recipe_cart.dart';
import 'package:flutter_test_folder_structure/widgets/circular_loading.dart';

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
                onPressed: () =>
                    Navigator.pushNamed(context, ProductsOverviewScreen.route),
                icon: Icon(Icons.production_quantity_limits)),
            IconButton(
                onPressed: () => Navigator.pushNamed(context, Login.route),
                icon: Icon(Icons.logout_outlined)),
          ],
        ),
        body: _isLoading
            ? CircularLoading()
            : ListView.builder(
                itemCount: _recipes.length,
                itemBuilder: (context, i) {
                  return RecipeCard(_recipes[i].name, _recipes[i].totalTime,
                      _recipes[i].rating.toString(), _recipes[i].images);
                },
              ));
  }
}
