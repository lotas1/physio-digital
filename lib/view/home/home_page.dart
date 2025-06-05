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
            // Modern Header with Gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Theme.of(context).colorScheme.primary,
                    const Color(0xFF4A5FE7),
                  ],
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                  bottomRight: Radius.circular(35),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
                    blurRadius: 20,
                    offset: const Offset(0, 10),
                  ),
                ],
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 20, 24, 32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top Row: Profile & App Info
                      Row(
                        children: [
                          // Enhanced Profile Avatar
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.white.withValues(alpha: 0.3),
                                  Colors.white.withValues(alpha: 0.1),
                                ],
                              ),
                            ),
                            child: CircleAvatar(
                              radius: 28,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage:
                                const AssetImage('assets/images/onboard.jpg'),
                              ),
                            ),
                          ),
                          const SizedBox(width: 16),
                          
                          // Welcome Text with Time-based Greeting
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  _getTimeBasedGreeting(),
                                  style: TextStyle(
                                    color: Colors.white.withValues(alpha: 0.9),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                const Text(
                                  'Ready for your wellness journey?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.3,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          
                          // App Logo/Icon
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.white.withValues(alpha: 0.15),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: const Icon(
                              Icons.healing,
                              color: Colors.white,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                      
                      const SizedBox(height: 28),
                      
                      // Enhanced Search Bar
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: 'Search therapists, clinics, products...',
                            prefixIcon: Container(
                              padding: const EdgeInsets.all(14),
                              child: Icon(
                                Icons.search,
                                color: Theme.of(context).colorScheme.primary,
                                size: 22,
                              ),
                            ),
                            suffixIcon: Container(
                              margin: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Icon(
                                Icons.tune,
                                color: Theme.of(context).colorScheme.primary,
                                size: 20,
                              ),
                            ),
                            hintStyle: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 16,
                              horizontal: 0,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(
                                color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.3),
                                width: 2,
                              ),
                            ),
                          ),
                          cursorColor: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      
                      const SizedBox(height: 20),
                      
                      // Quick Stats Row
                      Row(
                        children: [
                          _buildQuickStat(
                            icon: Icons.local_hospital,
                            label: 'Clinics',
                            value: '50+',
                            color: Colors.orange,
                          ),
                          const SizedBox(width: 16),
                          _buildQuickStat(
                            icon: Icons.people,
                            label: 'Therapists',
                            value: '200+',
                            color: Colors.green,
                          ),
                          const SizedBox(width: 16),
                          _buildQuickStat(
                            icon: Icons.shopping_bag,
                            label: 'Products',
                            value: '1K+',
                            color: Colors.purple,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
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

  String _getTimeBasedGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning! 🌅';
    } else if (hour < 17) {
      return 'Good Afternoon! ☀️';
    } else {
      return 'Good Evening! 🌙';
    }
  }

  Widget _buildQuickStat({
    required IconData icon,
    required String label,
    required String value,
    required Color color,
  }) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: Colors.white.withValues(alpha: 0.2),
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: color.withValues(alpha: 0.2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              label,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.8),
                fontSize: 11,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
