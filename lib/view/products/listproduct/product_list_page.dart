import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/model/product/product.dart';
import 'package:physio_digital/view/home/buttom_bar.dart';
import 'package:physio_digital/view/products/listproduct/list_product_controller.dart';

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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(26, 53, 75, 217),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          const Icon(Icons.storefront),
          const SizedBox(width: 5),
          const Text(
            'Market',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => print('search'),
          ),
        ],
      ),
    );
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
      // } else if (productController.error != null) {
      //   return Center(child: Text('Error: ${productController.error}'));
      } else {
        return GridView.builder(
          padding: const EdgeInsets.all(8.0),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.8,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: controller.products.length,
          itemBuilder: (context, index) {
            final product = controller.products[index];
            return _buildProductCard(product);
          },
        );
      }
    });
  }

  Widget _buildProductCard(Product product) {
    return Card(
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
    );
  }

  Widget _buildProductImage(Product product) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
          child: product.images.isNotEmpty
              ? Image.network(
            product.images.first,
            width: double.infinity,
            height: 130,
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Center(
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                      : null,
                ),
              );
            },
            errorBuilder: (context, error, stackTrace) => Image.asset(
              'assets/images/default_image.jpg',
              width: double.infinity,
              height: 130,
              fit: BoxFit.cover,
            ),
          )
              : Image.asset(
            'assets/images/default_image.jpg',
            width: double.infinity,
            height: 130,
            fit: BoxFit.cover,
          ),
        ),
      ],
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