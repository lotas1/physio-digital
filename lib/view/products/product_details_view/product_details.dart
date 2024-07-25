import 'package:flutter/material.dart';
import 'package:physio_digital/models/products/product_model.dart';
import 'package:physio_digital/view/products/product_details_view/buy_buttion.dart';
import 'package:physio_digital/view/products/product_details_view/product_image_carousel.dart';
import 'package:physio_digital/view/products/product_details_view/product_info.dart';
class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.shopping_cart),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProductImageCarousel(product: product),
              const SizedBox(height: 16),
              Text(
                product.name,
                style: const TextStyle(
                  // fontWeight: FontWeight.bold,
                  fontSize: 24,
                  
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '\$${product.price}',
                style: const TextStyle(
                  color: Color(0xFF354AD9),
                  // fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(height: 16),
              ProductInfoSection(product: product),
              const SizedBox(height: 16),
              BuyNowButton(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
