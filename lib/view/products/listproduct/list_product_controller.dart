import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:physio_digital/model/product/product.dart';
import 'package:physio_digital/repository/product_repository.dart';

class ListProductController extends GetxController {
  final ProductRepository productRepository;

  ListProductController(this.productRepository);

  final RxList<Product> products = <Product>[].obs;
  final RxList<Product> filteredProducts = <Product>[].obs;
  final RxBool isLoading = true.obs;
  final RxBool isDeleting = false.obs;
  final RxInt hoveredIndex = RxInt(-1);
  final RxBool isPreloading = true.obs;
  final RxString searchQuery = ''.obs;
  final RxBool isSearchExpanded = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
    preloadImages();
  }

  Future<void> fetchProducts() async {
    try {
      isLoading.value = true;
      products.value = await productRepository.getAllProducts();
      resetSearch();
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch products: ${e.toString()}');
    } finally {
      isLoading.value = false;
    }
  }

  void resetSearch() {
    searchQuery.value = '';
    filteredProducts.value = List.from(products);
  }

  void searchProducts(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      resetSearch();
    } else {
      filteredProducts.value = products.where((product) =>
      (product.name != null && product.name!.toLowerCase().contains(query.toLowerCase())) ||
          (product.details != null && product.details!.toLowerCase().contains(query.toLowerCase()))
      ).toList();
    }
  }

  void toggleSearch() {
    isSearchExpanded.toggle();
    if (!isSearchExpanded.value) {
      resetSearch();
    }
  }

  Future<void> preloadImages() async {
    try {
      isPreloading.value = true;
      List<String> imageUrls = await productRepository.getAllProductImageUrls();
      for (String url in imageUrls) {
        await precacheImage(CachedNetworkImageProvider(url), Get.context!);
      }
    } catch (e) {
      print('Error preloading images: $e');
    } finally {
      isPreloading.value = false;
    }
  }

  Future<void> deleteProduct(String productId) async {
    try {
      isDeleting.value = true;
      await productRepository.removeProduct(productId);
      await fetchProducts(); // This will reset the search and show all products
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