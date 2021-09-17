import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_test_folder_structure/utils/product_provider.dart';

class ProductsGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = productsData.items;
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (ctx, i) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.cyan
          ),
          child: ListTile(
            title: Text(products[i].title),
            subtitle: Text(products[i].id),
            trailing: Container(
              width: 70,
              height: 170,
              child: Image.network(
                products[i].imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        );
      }
    );
  }
}
