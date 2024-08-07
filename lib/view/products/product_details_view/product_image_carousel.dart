import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:physio_digital/model/product/product.dart';

class ProductImageCarousel extends StatelessWidget {
  final Product product;

  const ProductImageCarousel({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMainImage(context),
        const SizedBox(height: 8),
        if (product.images.isNotEmpty) _buildThumbnails(context),
      ],
    );
  }

  Widget _buildMainImage(BuildContext context) {
    return GestureDetector(
      onTap: product.images.isNotEmpty
          ? () => _showFullScreenCarousel(context, 0)
          : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: product.images.isNotEmpty
            ? CachedNetworkImage(
          imageUrl: product.images[0],
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
          placeholder: (context, url) => _buildPlaceholder(),
          errorWidget: (context, url, error) => _buildPlaceholder(),
        )
            : _buildPlaceholder(),
      ),
    );
  }

  Widget _buildThumbnails(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: product.images.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: GestureDetector(
              onTap: () => _showFullScreenCarousel(context, index),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl: product.images[index],
                  height: 60,
                  width: 60,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => _buildPlaceholder(size: 60),
                  errorWidget: (context, url, error) => _buildPlaceholder(size: 60),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildPlaceholder({double size = 200}) {
    return Container(
      width: size,
      height: size,
      color: Colors.grey[300],
      child: Icon(Icons.image, color: Colors.white, size: size * 0.5),
    );
  }

  void _showFullScreenCarousel(BuildContext context, int initialIndex) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.black,
        insetPadding: EdgeInsets.zero,
        child: FullScreenImageCarousel(
          product: product,
          initialIndex: initialIndex,
        ),
      ),
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
      itemCount: product.images.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.pop(context),
          child: CachedNetworkImage(
            imageUrl: product.images[index],
            fit: BoxFit.contain,
            placeholder: (context, url) => _buildPlaceholder(),
            errorWidget: (context, url, error) => _buildPlaceholder(),
          ),
        );
      },
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.grey[300],
      child: const Icon(Icons.image, color: Colors.white, size: 100),
    );
  }
}