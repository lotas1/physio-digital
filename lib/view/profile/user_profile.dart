import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/controllers/home_controller.dart';
import 'package:physio_digital/view/home/buttom_bar.dart';
import 'package:physio_digital/view/profile/logout.dart';
import 'package:physio_digital/view/profile/profile_page.dart';
import 'package:physio_digital/view/profile/profile_settings.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.find();
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xFF354AD9),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(35)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 1,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            height: 200,
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.storefront,
                        color: Colors.white,
                      ),
                      SizedBox(width: 5),
                      Text(
                        'Profile',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color.fromARGB(255, 218, 218, 218),
                            width: 4.0,
                          ),
                        ),
                        child: const CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/onboard.jpg'),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ikeh Victor',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                const Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "victorikeh77@gmail.com",
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromARGB(255, 184, 184, 184),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(18.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 1,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ProfileSettings(),
                  ProfilePage(),
                  Spacer(),
                  LogoutButton(),
                ],
              ),
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
