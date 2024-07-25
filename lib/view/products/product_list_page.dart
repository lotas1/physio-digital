import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/controllers/home_controller.dart';
import 'package:physio_digital/view/home/buttom_bar.dart';
import 'package:physio_digital/view/products/product_grid_list.dart';

class ProductListPage extends StatefulWidget {
  const ProductListPage({Key? key}) : super(key: key);

  @override
  ProductListPageState createState() => ProductListPageState();
}

class ProductListPageState extends State<ProductListPage> {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
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
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {
                      print('search');
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          const Row(
            children: [
              SizedBox(
                width: 10,
                height: 40,
              ),
              Text(
                'Products',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 10),
          const Expanded(
            child: ProductGridList(),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => CustomBottomNavigationBar(
          currentIndex: homeController.currentIndex.value,
          onTap: (index) {
            homeController.changeIndex(index);
            switch (index) {
              case 0:
                Get.toNamed('/');
                break;
              case 1:
                Get.toNamed('/marketplace');
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
        ),
      ),
    );
  }
}
