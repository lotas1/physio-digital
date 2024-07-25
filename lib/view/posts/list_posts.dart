import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/controllers/home_controller.dart';
import 'package:physio_digital/view/home/buttom_bar.dart';
import 'package:physio_digital/view/posts/view_post.dart';

class ListPostsPage extends StatefulWidget {
  const ListPostsPage({super.key});

  @override
  ListPostsPageState createState() => ListPostsPageState();
}

class ListPostsPageState extends State<ListPostsPage> {
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    final List<String> categories = [
      'news',
      'Internships',
      'Events',
      'Jobs',
      'webinars',
      'Conference'
    ];

    String activeCategory = '';

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: const Color.fromARGB(26, 53, 75, 217),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 15.0),
                  child: Row(
                    children: [
                      const Icon(Icons.article),
                      const SizedBox(width: 10),
                      const Text(
                        'Blog',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {
                          print('clinic');
                        },
                        icon: const Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  height: 30,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      final isActive = category == activeCategory;
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              activeCategory = category;
                            });
                          },
                          style: TextButton.styleFrom(
                            backgroundColor:
                                isActive ? Colors.blue : Colors.white,
                            foregroundColor:
                                isActive ? Colors.white : Colors.black,
                          ),
                          child: Text(category),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Recent",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: 200,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextButton(
                                  onPressed: null,
                                  style: TextButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromARGB(36, 53, 75, 217),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(6)),
                                    ),
                                  ),
                                  child: Text(
                                    category,
                                    style: const TextStyle(
                                      color: Color(0xFF354AD9),
                                    ),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(const ViewArticlePage());
                                  },
                                  style: TextButton.styleFrom(
                                      padding: const EdgeInsets.all(0),
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.zero)),
                                  child: const Text(
                                    "Stretching can increase your tolerance for pain",
                                    style: TextStyle(
                                      color: Color(0xFF101828),
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(vertical: 5),
                                  child: Text(
                                      'Some people with back pain see immediate...'),
                                ),
                                const Row(
                                  children: [
                                    Icon(Icons.calendar_today),
                                    Padding(padding: EdgeInsets.only(left: 5)),
                                    Text("Feb 22, 2024"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
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
