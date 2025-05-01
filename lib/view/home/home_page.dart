import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/view/home/buttom_bar.dart';
import 'package:physio_digital/view/home/clinic_near_you.dart';
import 'package:physio_digital/view/home/informative_articles.dart';
import 'package:physio_digital/view/home/upcoming_events.dart';
// import 'package:physio_digital/view/notification/list_notifications.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });

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
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Profile and optional notification
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 26,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage:
                          const AssetImage('assets/images/onboard.jpg'),
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Expanded(
                        child: Text(
                          'Welcome back',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      // Notification bell (commented out as requested)
                      /*
                      Stack(
                        children: [
                          IconButton(
                            onPressed: () {
                              Get.to(const ListNotifications());
                            },
                            icon: const Icon(
                              Icons.notifications,
                              color: Colors.white,
                            ),
                          ),
                          Positioned(
                            right: 6,
                            top: 6,
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.red,
                                shape: BoxShape.circle,
                              ),
                              child: const Text(
                                '5',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      */
                    ],
                  ),
                  const SizedBox(height: 20),
                  // Search Bar
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Search for therapist, products...',
                      prefixIcon: const Icon(Icons.search),
                      hintStyle: const TextStyle(color: Colors.grey),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    cursorColor: Colors.grey,
                  ),
                ],
              ),
            ),

            // Main content
            Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClinicNearYou(),        // Keep original placement
                  SizedBox(height: 20),
                  UpcomingEvents(),      // Keep original placement
                  SizedBox(height: 20),
                  InformativeArticles(), // Keep original placement
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
