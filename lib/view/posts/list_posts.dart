import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/controllers/home_controller.dart';
import 'package:physio_digital/view/home/buttom_bar.dart';
import 'package:physio_digital/view/posts/view_post.dart';

class ListPostsPage extends StatefulWidget {
  const ListPostsPage({Key? key}) : super(key: key);

  @override
  ListPostsPageState createState() => ListPostsPageState();
}

class ListPostsPageState extends State<ListPostsPage> {
  final HomeController homeController = Get.find();
  final RxString activeCategory = 'see all'.obs;
  final List<String> categories = [
    'see all',
    'news',
    'Internships',
    'Events',
    'Jobs',
    'webinars',
    'Conference'
  ];

  // Simulated posts data
  final List<Map<String, dynamic>> allPosts = [
    {'title': 'News Article 1', 'category': 'news', 'date': 'Feb 22, 2024'},
    {'title': 'Internship Opportunity', 'category': 'Internships', 'date': 'Feb 23, 2024'},
    {'title': 'Upcoming Conference', 'category': 'Conference', 'date': 'Feb 24, 2024'},
    {'title': 'Job Opening', 'category': 'Jobs', 'date': 'Feb 25, 2024'},
    {'title': 'Webinar Announcement', 'category': 'webinars', 'date': 'Feb 26, 2024'},
    {'title': 'Event Invitation', 'category': 'Events', 'date': 'Feb 27, 2024'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildHeader(),
          _buildCategoryList(),
          _buildRecentHeader(),
          _buildPostsList(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Container(
      color: const Color.fromARGB(26, 53, 75, 217),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
        child: Row(
          children: [
            const Icon(Icons.article),
            const SizedBox(width: 10),
            const Text(
              'Blog',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            IconButton(
              onPressed: () => print('search'),
              icon: const Icon(Icons.search, color: Colors.black),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryList() {
    return Container(
      color: const Color.fromARGB(26, 53, 75, 217),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
        child: Column(
          children: [
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) => _buildCategoryButton(categories[index]),
              ),
            ),
            const SizedBox(height: 10), // Added space below the category buttons
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String category) {
    return Obx(() => Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: TextButton(
        onPressed: () => activeCategory.value = category,
        style: TextButton.styleFrom(
          backgroundColor: category == activeCategory.value ? const Color(0xFF354AD9) : Colors.white,
          foregroundColor: category == activeCategory.value ? Colors.white : Colors.black,
        ),
        child: Text(category),
      ),
    ));
  }

  Widget _buildRecentHeader() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          "Recent",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildPostsList() {
    return Expanded(
      child: Obx(() {
        final filteredPosts = activeCategory.value == 'see all'
            ? allPosts
            : allPosts.where((post) => post['category'] == activeCategory.value).toList();
        return ListView.builder(
          itemCount: filteredPosts.length,
          itemBuilder: (context, index) => _buildPostItem(filteredPosts[index], context),
        );
      }),
    );
  }

  Widget _buildPostItem(Map<String, dynamic> post, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewArticlePage(post: post,)));
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
        color: Colors.white,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue[50], // Light blue background
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      post['category'] ?? 'Uncategorized',
                      style: TextStyle(
                        color: Colors.blue[700],
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    post['title'] ?? 'Untitled',
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    post['description'] ?? 'No description available',
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        post['date'] ?? 'No date',
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(width: 16),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: post['imageUrl'] != null
                  ? Image.network(
                post['imageUrl']!,
                width: 100,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: 100,
                    height: 100,
                    color: Colors.grey[300],
                    child: const Icon(Icons.error, color: Colors.white),
                  );
                },
              )
                  : Container(
                width: 100,
                height: 100,
                color: Colors.grey[300],
                child: const Icon(Icons.image, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(() => CustomBottomNavigationBar(
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
    ));
  }
}