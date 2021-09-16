import 'package:flutter/material.dart';
import 'package:flutter_test_folder_structure/core/model/recipe.dart';
import 'package:flutter_test_folder_structure/core/repository/recipe_api.dart';
import 'package:flutter_test_folder_structure/screens/users.dart';
import 'package:flutter_test_folder_structure/widgets/recipe_cart.dart';

class Home extends StatefulWidget {

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
              SizedBox(width: 15,),
              Text("Food Recipe")
            ],
          ),
          actions: [
            IconButton(onPressed: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => UserView())
            ), icon: Icon(Icons.account_balance))
          ],
        ),
      body: _isLoading
        ? Center(
          child: CircularProgressIndicator(),
        )
        : ListView.builder(
          itemCount: _recipes.length,
          itemBuilder: (context, i) {
            return RecipeCard(
              _recipes[i].name, 
              _recipes[i].totalTime, 
              _recipes[i].rating.toString(), 
              _recipes[i].images
            );
          },
        )
    );
  }
}