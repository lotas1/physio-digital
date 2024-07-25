import 'package:flutter/material.dart';
import 'package:physio_digital/models/products/product_model.dart';

class ProductImageCarousel extends StatelessWidget {
  final Product product;

  const ProductImageCarousel({super.key, required this.product});

  void _showFullScreenCarousel(BuildContext context, int initialIndex) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.black,
          insetPadding: const EdgeInsets.all(0),
          child: FullScreenImageCarousel(
            product: product,
            initialIndex: initialIndex,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => _showFullScreenCarousel(context, 0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15), // Add border radius here
            child: Image.asset(
              product.imageUrl,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: product.imageThumbnails.asMap().entries.map((entry) {
            int idx = entry.key;
            String thumbnail = entry.value;
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                onTap: () => _showFullScreenCarousel(context, idx),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5), // Add border radius here
                  child: Image.asset(
                    thumbnail,
                    height: 60,
                    width: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}


class FullScreenImageCarousel extends StatelessWidget {
  final Product product;
  final int initialIndex;

  const FullScreenImageCarousel({
    super.key,
    required this.product,
    required this.initialIndex,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      controller: PageController(initialPage: initialIndex),
      itemCount: product.imageThumbnails.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.pop(context),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10), // Add border radius here
            child: Image.asset(
              product.imageThumbnails[index],
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }
}
