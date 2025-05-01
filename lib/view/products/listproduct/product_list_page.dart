import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/model/product/product.dart';
import 'package:physio_digital/view/home/buttom_bar.dart';
import 'package:physio_digital/view/products/listproduct/list_product_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart'; // Import shimmer package
import '../product_details_view/product_details.dart';

class ListProducts extends GetView<ListProductController> {
  const ListProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context),
            Expanded(
              child: RefreshIndicator(
                color: const Color(0xFF354AD9),
                onRefresh: () async {
                  await controller.fetchProducts();
                },
                child: _buildProductList(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Obx(() {
      final bool isExpanded = controller.isSearchExpanded.value;

      return Container(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              offset: const Offset(0, 2),
              blurRadius: 6,
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                if (!isExpanded) ...[
                  Text(
                    'Shop',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF354AD9),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Products',
                    style: GoogleFonts.poppins(
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  const Spacer(),
                ],
                if (isExpanded)
                  Expanded(
                    child: Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: TextField(
                        autofocus: true,
                        decoration: InputDecoration(
                          hintText: 'Search products...',
                          hintStyle: GoogleFonts.poppins(
                            color: Colors.grey[500],
                            fontSize: 14,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                          suffixIcon: IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.grey,
                              size: 20,
                            ),
                            onPressed: () {
                              controller.toggleSearch();
                              controller.resetSearch();
                            },
                          ),
                        ),
                        onChanged: controller.searchProducts,
                      ),
                    ),
                  )
                else
                  IconButton(
                    icon: const Icon(
                      Icons.search_rounded,
                      color: Color(0xFF354AD9),
                      size: 28,
                    ),
                    onPressed: controller.toggleSearch,
                  ),
              ],
            ),
            // if (!isExpanded)
            //   const SizedBox(height: 12),
            // if (!isExpanded)
            //   _buildCategoryTabs(),
          ],
        ),
      );
    });
  }



  Widget _buildProductList() {
    return Obx(() {
      if (controller.isLoading.value) {
        return _buildShimmerLoading();
      } else if (controller.filteredProducts.isEmpty) {
        return _buildEmptyState();
      } else {
        return _buildProductGrid();
      }
    });
  }

  // Shimmer loading effect
  Widget _buildShimmerLoading() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.72,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: 6, // Show 6 shimmer placeholders
        itemBuilder: (context, index) {
          return _buildShimmerProductCard();
        },
      ),
    );
  }

  Widget _buildShimmerProductCard() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    // Calculate the remaining space we have
                    final availableHeight = constraints.maxHeight;
                    // Distribute the space proportionally
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: double.infinity,
                          height: availableHeight * 0.3,
                          color: Colors.white,
                        ),
                        SizedBox(height: availableHeight * 0.1),
                        Container(
                          width: 100,
                          height: availableHeight * 0.15,
                          color: Colors.white,
                        ),
                        Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 80,
                              height: availableHeight * 0.2,
                              color: Colors.white,
                            ),
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_bag_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No products found',
            style: GoogleFonts.poppins(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try a different search term',
            style: GoogleFonts.poppins(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        padding: const EdgeInsets.only(top: 16, bottom: 16),
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.72,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemCount: controller.filteredProducts.length,
        itemBuilder: (context, index) {
          final product = controller.filteredProducts[index];
          return _buildProductCard(product, context);
        },
      ),
    );
  }

  Widget _buildProductCard(Product product, BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToProductDetail(product, context),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[200]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: _buildProductImage(product),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(
                          height: constraints.maxHeight * 0.55,
                          child: Text(
                            product.name ?? 'Unnamed Product',
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              fontSize: 13,
                              color: Colors.black87,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const Spacer(), // Push everything to the top and bottom
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                'NGN ${product.price}',
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: const Color(0xFF354AD9),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Container(
                              width: 28,
                              height: 28,
                              decoration: BoxDecoration(
                                color: const Color(0xFFEEF0FF),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                Icons.add,
                                color: Color(0xFF354AD9),
                                size: 16,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductImage(Product product) {
    return ClipRRect(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
      child: product.images.isNotEmpty
          ? CachedNetworkImage(
        imageUrl: product.images.first,
        fit: BoxFit.cover,
        width: double.infinity,
        placeholder: (context, url) => _buildImageShimmer(),
        errorWidget: (context, url, error) => _buildDefaultImage(),
      )
          : _buildDefaultImage(),
    );
  }

  Widget _buildImageShimmer() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        color: Colors.white,
      ),
    );
  }

  Widget _buildDefaultImage() {
    return Container(
      color: const Color(0xFFF5F6FA),
      child: Center(
        child: Icon(
          Icons.image_outlined,
          size: 36,
          color: Colors.grey[400],
        ),
      ),
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
      currentIndex: 1,
      onTap: (index) {
        switch (index) {
          case 0:
            Get.toNamed('/');
            break;
          case 1:
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