import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:physio_digital/controllers/home_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  // Static method to create standardized bottom navigation bar
  static Widget create() {
    final HomeController homeController = Get.find<HomeController>();
    
    return Obx(
      () => CustomBottomNavigationBar(
        currentIndex: homeController.currentIndex.value,
        onTap: (index) {
          homeController.changeIndex(index);
          _navigateToPage(index);
        },
      ),
    );
  }

  // Centralized navigation logic
  static void _navigateToPage(int index) {
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
    final HomeController homeController = Get.find<HomeController>();
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Modern color scheme
    final Color primaryBlue = const Color(0xFF1E3A8A);
    final Color backgroundColor = isDarkMode
        ? const Color(0xFF0F172A)
        : Colors.white;
    final Color inactiveColor = isDarkMode
        ? Colors.grey.shade500
        : Colors.grey.shade400;

    return Obx(
          () => Container(
        height: 70.0,
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.04),
              blurRadius: 8,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: SafeArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(0, FontAwesomeIcons.house, homeController, primaryBlue, inactiveColor),
              _buildNavItem(1, FontAwesomeIcons.store, homeController, primaryBlue, inactiveColor),
              _buildNavItem(2, FontAwesomeIcons.stethoscope, homeController, primaryBlue, inactiveColor),
              _buildNavItem(3, FontAwesomeIcons.book, homeController, primaryBlue, inactiveColor),
              _buildNavItem(4, FontAwesomeIcons.houseChimneyMedical, homeController, primaryBlue, inactiveColor),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
      int index,
      IconData icon,
      HomeController homeController,
      Color primaryBlue,
      Color inactiveColor
      ) {
    final bool isActive = homeController.currentIndex.value == index;

    return InkWell(
      onTap: () {
        homeController.currentIndex.value = index;
        onTap(index);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: isActive ? primaryBlue.withValues(alpha: 0.1) : Colors.transparent,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 18,
            color: isActive ? primaryBlue : inactiveColor,
          ),
        ),
      ),
    );
  }
}