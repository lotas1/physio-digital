import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/models/products/product_model.dart';
import 'package:physio_digital/view/products/product_details_view/product_details.dart';

class ProductCardWidget extends StatelessWidget {
  final Product product;
  const ProductCardWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    try {
      return GestureDetector(
        onTap: () {
          Get.to(ProductDetailPage(product: sampleProduct));
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Image.asset(
                      product.imageUrl.isNotEmpty
                          ? product.imageUrl
                          : 'assets/images/default_image.jpg',
                      width: double.infinity,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  if (product.isPreferred)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 33, 45, 123),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(0))),
                        child: const Text(
                          'Preferred',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                  if (product.isRecommended)
                    Positioned(
                      top: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 33, 45, 123),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(0),
                                bottomRight: Radius.circular(0),
                                topRight: Radius.circular(15),
                                topLeft: Radius.circular(0))),
                        child: const Text(
                          'Recommended',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.zero,
                          )),
                      onPressed: () {
                        // Get.to(ProductDetailPage(product: sampleProduct));
                      },
                      child: Text(
                        product.name.isNotEmpty ? product.name : 'Unknown',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                          color: Colors.black,
                          backgroundColor: Colors.transparent,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '\$${product.price.toStringAsFixed(2)}',
                      style: const TextStyle(
                        color:Color(0xFF354AD9),
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } catch (e) {
      return const Scaffold(
        body: Center(
          child: Text('An error occurred'),
        ),
      );
    }
  }
}
