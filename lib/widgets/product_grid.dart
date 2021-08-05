import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/providers/products.dart';
import 'package:shop/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    final loadedProducts = Provider.of<Products>(context);
    final products = loadedProducts.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: products.length,
      itemBuilder: (ctx, index) => ProductItem(products[index]),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10
      ),
    );
  }
}