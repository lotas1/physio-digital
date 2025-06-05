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
    {
      'title': 'Latest Advancements in Physical Therapy',
      'category': 'news',
      'date': 'Feb 22, 2024',
      'description': 'Explore the cutting-edge technologies changing the landscape of rehabilitation...'
    },
    {
      'title': 'Summer Internship Program Now Open',
      'category': 'Internships',
      'date': 'Feb 23, 2024',
      'description': 'Applications are now being accepted for our prestigious summer internship program...'
    },
    {
      'title': 'International Physiotherapy Conference 2024',
      'category': 'Conference',
      'date': 'Feb 24, 2024',
      'description': 'Join leading experts from around the world to discuss latest research findings...'
    },
    {
      'title': 'Senior Physiotherapist Position Available',
      'category': 'Jobs',
      'date': 'Feb 25, 2024',
      'description': 'We are seeking an experienced physiotherapist to join our growing team...'
    },
    {
      'title': 'Webinar: Optimizing Recovery After Sports Injuries',
      'category': 'webinars',
      'date': 'Feb 26, 2024',
      'description': 'Learn advanced techniques for treating and rehabilitating common sports injuries...'
    },
    {
      'title': 'Community Health Fair Coming This Weekend',
      'category': 'Events',
      'date': 'Feb 27, 2024',
      'description': 'Free health screenings and consultations available at our annual health fair...'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildCategoryList(),
            _buildRecentHeader(),
            // FIX 2: Wrap in Expanded to solve overflow issue
            _buildPostsList(),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 2),
            blurRadius: 6,
          ),
        ],
      ),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFFEEF0FB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.article_rounded,
              color: Color(0xFF354AD9),
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          const Text(
            'Health & Wellness Blog',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1A1F38),
            ),
          ),
          const Spacer(),
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFFEEF0FB),
              borderRadius: BorderRadius.circular(12),
            ),
            child: IconButton(
              onPressed: () => print('search'),
              icon: const Icon(
                Icons.search_rounded,
                color: Color(0xFF354AD9),
                size: 24,
              ),
              splashRadius: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 16),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        // FIX 1: Fixed Obx usage - Moved Row outside of Obx
        child: Row(
          children: categories.map((category) => _buildCategoryButton(category)).toList(),
        ),
      ),
    );
  }

  Widget _buildCategoryButton(String category) {
    // FIX 1: Correctly implementing Obx by wrapping just the part that needs to be reactive
    return Obx(() {
      final isActive = category == activeCategory.value;
      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: InkWell(
          onTap: () => activeCategory.value = category,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isActive
                  ? const Color(0xFF354AD9)
                  : const Color(0xFFEEF0FB),
              borderRadius: BorderRadius.circular(30),
              boxShadow: isActive
                  ? [
                BoxShadow(
                  color: const Color(0xFF354AD9).withOpacity(0.3),
                  blurRadius: 8,
                  offset: const Offset(0, 3),
                )
              ]
                  : null,
            ),
            child: Text(
              category[0].toUpperCase() + category.substring(1),
              style: TextStyle(
                color: isActive
                    ? Colors.white
                    : const Color(0xFF354AD9),
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
          ),
        ),
      );
    });
  }

  Widget _buildRecentHeader() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 4,
                height: 20,
                decoration: BoxDecoration(
                  color: const Color(0xFF354AD9),
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                "Recent Articles",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF1A1F38),
                ),
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF354AD9),
              padding: EdgeInsets.zero,
              minimumSize: Size.zero,
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
            child: const Text(
              "View All",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostsList() {
    // FIX 1: Correctly implementing Obx
    return Expanded(
      child: Obx(() {
        final filteredPosts = activeCategory.value == 'see all'
            ? allPosts
            : allPosts.where((post) => post['category'] == activeCategory.value).toList();

        if (filteredPosts.isEmpty) {
          return _buildEmptyState();
        }

        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
          itemCount: filteredPosts.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) => _buildPostItem(filteredPosts[index], context),
        );
      }),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.article_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'No articles found',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Try selecting a different category',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPostItem(Map<String, dynamic> post, BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => ViewArticlePage(post: post)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
              child: Container(
                height: 140,
                width: double.infinity,
                color: _getCategoryColor(post['category']).withOpacity(0.2),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Center(
                      child: Icon(
                        _getCategoryIcon(post['category']),
                        size: 64,
                        color: _getCategoryColor(post['category']).withOpacity(0.5),
                      ),
                    ),
                    Positioned(
                      top: 12,
                      left: 12,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: _getCategoryColor(post['category']),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Text(
                          post['category'] ?? 'Uncategorized',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    post['title'] ?? 'Untitled',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF1A1F38),
                      height: 1.3,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    post['description'] ?? 'No description available',
                    style: const TextStyle(
                      color: Color(0xFF4A4E69),
                      fontSize: 14,
                      height: 1.4,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today_rounded,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 6),
                      Text(
                        post['date'] ?? 'No date',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Read More',
                        style: TextStyle(
                          color: const Color(0xFF354AD9),
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.arrow_forward_rounded,
                        size: 14,
                        color: Color(0xFF354AD9),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getCategoryIcon(String? category) {
    switch (category?.toLowerCase()) {
      case 'news':
        return Icons.newspaper;
      case 'internships':
        return Icons.school;
      case 'events':
        return Icons.event;
      case 'jobs':
        return Icons.work;
      case 'webinars':
        return Icons.videocam;
      case 'conference':
        return Icons.groups;
      default:
        return Icons.article;
    }
  }

  Color _getCategoryColor(String? category) {
    switch (category?.toLowerCase()) {
      case 'news':
        return const Color(0xFF4285F4); // Blue
      case 'internships':
        return const Color(0xFF34A853); // Green
      case 'events':
        return const Color(0xFFFBBC05); // Yellow
      case 'jobs':
        return const Color(0xFFEA4335); // Red
      case 'webinars':
        return const Color(0xFF9C27B0); // Purple
      case 'conference':
        return const Color(0xFF00ACC1); // Cyan
      default:
        return const Color(0xFF354AD9); // Default blue
    }
  }

  Widget _buildBottomNavigationBar() {
    // FIX 1: Fixed Obx implementation
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
            Get.toNamed('/about');
            break;
        }
      },
    ));
  }
}