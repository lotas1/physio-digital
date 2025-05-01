import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:physio_digital/model/product/product.dart';

class ProductImageCarousel extends StatefulWidget {
  final Product product;

  const ProductImageCarousel({super.key, required this.product});

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      int next = _pageController.page!.round();
      if (_currentIndex != next) {
        setState(() {
          _currentIndex = next;
        });
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMainCarousel(context),
        const SizedBox(height: 16),
        if (widget.product.images.isNotEmpty) _buildIndicators(),
        const SizedBox(height: 8),
        if (widget.product.images.length > 1) _buildThumbnails(context),
      ],
    );
  }

  Widget _buildMainCarousel(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: widget.product.images.isNotEmpty
              ? PageView.builder(
            controller: _pageController,
            itemCount: widget.product.images.length,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _showFullScreenCarousel(context, index),
                child: Hero(
                  tag: 'product_image_${widget.product.id}_$index',
                  child: CachedNetworkImage(
                    imageUrl: widget.product.images[index],
                    fit: BoxFit.cover,
                    placeholder: (context, url) => _buildPlaceholder(),
                    errorWidget: (context, url, error) =>
                        _buildPlaceholder(),
                  ),
                ),
              );
            },
          )
              : _buildPlaceholder(),
        ),
      ),
    );
  }

  Widget _buildIndicators() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        widget.product.images.length,
            (index) => Container(
          width: 8,
          height: 8,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentIndex == index
                ? const Color(0xFF354AD9)
                : Colors.grey.shade300,
          ),
        ),
      ),
    );
  }

  Widget _buildThumbnails(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.product.images.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            child: Container(
              width: 70,
              height: 70,
              margin: const EdgeInsets.symmetric(horizontal: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: _currentIndex == index
                      ? const Color(0xFF354AD9)
                      : Colors.transparent,
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: CachedNetworkImage(
                  imageUrl: widget.product.images[index],
                  fit: BoxFit.cover,
                  placeholder: (context, url) =>
                      _buildPlaceholder(size: 70),
                  errorWidget: (context, url, error) =>
                      _buildPlaceholder(size: 70),
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
      color: Colors.grey[200],
      child: Icon(
        Icons.image,
        color: Colors.grey[400],
        size: size * 0.4,
      ),
    );
  }

  void _showFullScreenCarousel(BuildContext context, int initialIndex) {
    Navigator.of(context).push(
      PageRouteBuilder(
        opaque: false,
        barrierColor: Colors.black87,
        pageBuilder: (context, _, __) => FullScreenImageCarousel(
          product: widget.product,
          initialIndex: initialIndex,
        ),
      ),
    );
  }
}

class FullScreenImageCarousel extends StatefulWidget {
  final Product product;
  final int initialIndex;

  const FullScreenImageCarousel({
    super.key,
    required this.product,
    required this.initialIndex,
  });

  @override
  State<FullScreenImageCarousel> createState() =>
      _FullScreenImageCarouselState();
}

class _FullScreenImageCarouselState extends State<FullScreenImageCarousel> {
  late PageController _pageController;
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: widget.initialIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          '${_currentIndex + 1}/${widget.product.images.length}',
          style: const TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => Navigator.pop(context),
        child: PageView.builder(
          controller: _pageController,
          itemCount: widget.product.images.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemBuilder: (context, index) {
            return InteractiveViewer(
              minScale: 0.5,
              maxScale: 3.0,
              child: Center(
                child: Hero(
                  tag: 'product_image_${widget.product.id}_$index',
                  child: CachedNetworkImage(
                    imageUrl: widget.product.images[index],
                    fit: BoxFit.contain,
                    placeholder: (context, url) => _buildPlaceholder(),
                    errorWidget: (context, url, error) => _buildPlaceholder(),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: Colors.transparent,
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}