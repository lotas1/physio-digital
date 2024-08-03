import 'package:flutter/material.dart';
import 'package:physio_digital/model/product/product.dart';

class ProductInfoSection extends StatelessWidget {
  final Product product;

  const ProductInfoSection({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ExpansionTile(
          title: const Text('Details'),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.details ?? 'Unknown product'),
            ),
          ],
        ),
        ExpansionTile(
          title: const Text('Features'),
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(product.features ?? 'Unknown features'),
            ),
          ],
        ),
      ],
    );
  }
}
