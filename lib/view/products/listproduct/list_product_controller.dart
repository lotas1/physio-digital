import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/model/product/product.dart';
import 'package:physio_digital/repository/product_repository.dart';

class ListProductController extends GetxController {
  final ProductRepository productRepository;

  ListProductController(this.productRepository);

  final RxList<Product> products = <Product>[].obs;
  final RxBool isLoading = true.obs;
  final RxBool isDeleting = false.obs;
  final RxInt hoveredIndex = RxInt(-1);

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      products.value = await productRepository.getAllProducts();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      isDeleting.value = true;
      await productRepository.removeProduct(productId);
      await fetchProducts(); // Refresh the list after deletion
      Get.snackbar('Success', 'Product deleted successfully', colorText: Colors.green);
    } catch (e) {
      Get.snackbar('Error', 'Failed to delete product: ${e.toString()}');
    } finally {
      isDeleting.value = false;
    }
  }

  void setHoveredIndex(int index) {
    hoveredIndex.value = index;
  }
}