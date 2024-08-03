import 'package:flutter/material.dart';
import 'package:physio_digital/model/product/product.dart';
import 'package:physio_digital/view/products/product_details_view/product_image_carousel.dart';
import 'package:physio_digital/view/products/product_details_view/product_info.dart';

import 'buy_buttion.dart';

class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ProductImageCarousel(product: product),
                const SizedBox(height: 16),
                _buildProductName(),
                const SizedBox(height: 8),
                _buildProductPrice(),
                const SizedBox(height: 16),
                ProductInfoSection(product: product),
                const SizedBox(height: 16),
                BuyNowButton(product: product),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductName() {
    return Text(
      product.name ?? 'Unnamed Product',
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildProductPrice() {
    return Text(
      product.price != null && product.price!.isNotEmpty
          ? '\₦${product.price}'
          : 'Price not available',
      style: const TextStyle(
        color: Color(0xFF354AD9),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}