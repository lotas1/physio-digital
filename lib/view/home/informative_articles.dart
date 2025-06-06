import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/view/posts/list_posts.dart';

class InformativeArticles extends StatelessWidget {
  const InformativeArticles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('Informative Articles.', onViewAll: () {
          Get.to(() => const ListPostsPage(), transition: Transition.rightToLeft);
        }),
        _buildArticleList(),
      ],
    );
  }

  Widget _buildSectionTitle(String title, {required VoidCallback onViewAll}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          TextButton.icon(
            onPressed: onViewAll,
            label: const Text(
              'See all',
              style: TextStyle(color: Color.fromARGB(255, 99, 99, 99)),
            ),
            icon: const Icon(Icons.arrow_forward, size: 16),
            iconAlignment: IconAlignment.end,
            style: TextButton.styleFrom(
              iconColor: const Color.fromARGB(255, 99, 99, 99), // Text color
              backgroundColor: Colors.transparent, // Button color
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArticleList() {
    return SizedBox(
      height: 180,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          _buildArticleCard(
            'Unlocking the Benefits of Tele-Rehabilitation',
            'assets/images/onboard.jpg',
            () {},
          ),
          _buildArticleCard(
            'The Power of Physiotherapy',
            'assets/images/onboard.jpg',
            () {},
          ),
        ],
      ),
    );
  }

  Widget _buildArticleCard(String title, String imagePath, VoidCallback onTap) {
    return GestureDetector(
      onTap: () {
        //Get.to(const ViewArticlePage());
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 6,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Image.asset(
                imagePath,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(8)),
                  ),
                  child: const Icon(
                    Icons.article_sharp,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(12)),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.centerRight,
                      colors: [
                        const Color.fromARGB(255, 68, 68, 68).withValues(alpha: 0.7),
                        const Color.fromARGB(255, 68, 68, 68).withValues(alpha: 0.7),
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
