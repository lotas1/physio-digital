import 'package:flutter/material.dart';
import 'package:physio_digital/models/products/product_model.dart';
import 'package:physio_digital/view/products/product_card_widget.dart';

class ProductGridList extends StatelessWidget {
  const ProductGridList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.8,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return ProductCardWidget(product: products[index]);
      },
    );
  }
}
