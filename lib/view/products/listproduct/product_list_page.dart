import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/model/product/product.dart';
import 'package:physio_digital/view/home/buttom_bar.dart';
import 'package:physio_digital/view/products/listproduct/list_product_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../product_details_view/product_details.dart';

class ListProducts extends GetView<ListProductController> {
  const ListProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildProductsTitle(),
            Expanded(child: _buildProductGrid()),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Obx(() {
      final bool isExpanded = controller.isSearchExpanded.value;

      return LayoutBuilder(
        builder: (context, constraints) {
          final double maxWidth = constraints.maxWidth;
          final double collapsedWidth = 48; // Width of the search icon button

          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(26, 53, 75, 217),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: isExpanded ? 0 : maxWidth - collapsedWidth - 30, // 30 for padding
                  child: AnimatedOpacity(
                    opacity: isExpanded ? 0.0 : 1.0,
                    duration: const Duration(milliseconds: 200),
                    child: Row(
                      children: [
                        const Icon(Icons.storefront),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            'Market',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: isExpanded ? maxWidth - 30 : collapsedWidth,
                  child: isExpanded
                      ? TextField(
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Search products...',
                      hintStyle: TextStyle(color: Colors.grey[600]),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 0),
                      prefixIcon: Icon(Icons.search, color: Colors.grey[600], size: 20),
                      prefixIconConstraints: BoxConstraints(minWidth: 40, maxWidth: 40),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.close, color: Colors.grey[600], size: 20),
                        onPressed: () {
                          controller.toggleSearch();
                          controller.resetSearch();
                        },
                        constraints: BoxConstraints(minWidth: 40, maxWidth: 40),
                      ),
                    ),
                    onChanged: controller.searchProducts,
                    style: TextStyle(fontSize: 16),
                  )
                      : IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: controller.toggleSearch,
                  ),
                ),
              ],
            ),
          );
        },
      );
    });
  }

  Widget _buildProductsTitle() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          'Products',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildProductGrid() {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      } else if (controller.filteredProducts.isEmpty) {
        return Center(child: Text('No products found'));
      } else {
        return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: controller.filteredProducts.length,
          itemBuilder: (context, index) {
            final product = controller.filteredProducts[index];
            return _buildProductCard(product, context);
          },
        );
      }
    });
  }

  Widget _buildProductCard(Product product, BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToProductDetail(product, context),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildProductImage(product),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name ?? 'Unknown',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '₦${product.price ?? 'N/A'}',
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(Product product) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          child: product.images.isNotEmpty
              ? CachedNetworkImage(
            imageUrl: product.images.first,
            width: double.infinity,
            height: 130,
            fit: BoxFit.cover,
            // placeholder: (context, url) => Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => _buildDefaultImage(),
          ) : _buildDefaultImage(),
        ),
      ],
    );
  }

  Widget _buildDefaultImage() {
    return Image.asset(
      'assets/images/default_image.jpg',
      width: double.infinity,
      height: 130,
      fit: BoxFit.cover,
    );
  }

  void _navigateToProductDetail(Product product, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailPage(product: product),
      ),
    );
  }


  Widget _buildBottomNavigationBar() {
    return CustomBottomNavigationBar(
      currentIndex: 1, // Assuming this is the marketplace page
      onTap: (index) {
        switch (index) {
          case 0:
            Get.toNamed('/');
            break;
          case 1:
          // We're already on the marketplace page
            break;
          case 2:
            Get.toNamed('/clinic');
            break;
          case 3:
            Get.toNamed('/blog');
            break;
          case 4:
            Get.toNamed('/profile');
            break;
        }
      },
    );
  }
}