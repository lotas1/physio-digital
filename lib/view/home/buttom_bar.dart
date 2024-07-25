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

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();

    return Obx(
      () =>  Container(
      height: 75.0,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 41, 51, 100),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: SafeArea(
        child: BottomNavigationBar(
         currentIndex: homeController.currentIndex.value,
          onTap: (index) {
            onTap(index);
          },
          items: [
            BottomNavigationBarItem(
              icon: CustomIcon(
                icon: FontAwesomeIcons.house,
                isActive: homeController.currentIndex.value == 0,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                icon: FontAwesomeIcons.store,
                isActive: homeController.currentIndex.value == 1,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                icon: FontAwesomeIcons.stethoscope,
                isActive: homeController.currentIndex.value == 2,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                icon: FontAwesomeIcons.book,
                isActive: homeController.currentIndex.value == 3,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: CustomIcon(
                icon: FontAwesomeIcons.houseChimneyMedical,
                isActive: homeController.currentIndex.value == 4,
              ),
              label: '',
            ),
          ],
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ),
    ));
  }
}

class CustomIcon extends StatelessWidget {
  final IconData icon;
  final bool isActive;

  const CustomIcon({
    Key? key,
    required this.icon,
    required this.isActive,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        if (isActive)
          Container(
            width: 40.0,
            height: 40.0,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: Color.fromARGB(141, 74, 92, 181),
              shape: BoxShape.circle,
            ),
          ),
        Icon(
          icon,
          size: 18,
          color: isActive ? Colors.white : Colors.grey,
        ),
      ],
    );
  }
}
