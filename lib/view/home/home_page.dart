import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/view/home/buttom_bar.dart';
import 'package:physio_digital/view/home/clinic_near_you.dart';
import 'package:physio_digital/view/home/informative_articles.dart';
import 'package:physio_digital/view/home/upcoming_events.dart';
import 'package:physio_digital/view/notification/list_notifications.dart';
// import 'package:physio_consult/controllers/home_controller.dart';

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
    try {
      return Scaffold(
        backgroundColor: const Color(0xFFF5F5F5),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF354AD9),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 218, 218, 218),
                                  width: 4.0,
                                ),
                              ),
                              child: const CircleAvatar(
                                backgroundImage:
                                    AssetImage('assets/images/onboard.jpg'),
                              ),
                            ),
                          ),
                          const Spacer(),
                          const Spacer(),
                          const Spacer(),
                          const Spacer(),
                          const Spacer(),
                          const Spacer(),
                          Expanded(
                            child: Stack(
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
                                  right: 0,
                                  child: Container(
                                    padding: const EdgeInsets.all(1),
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    constraints: const BoxConstraints(
                                      minWidth: 12,
                                      minHeight: 12,
                                    ),
                                    child: const Text(
                                      '5',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 8,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Row(
                        children: [
                          Text.rich(
                            TextSpan(
                                text: "Good day, ",
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Color.fromARGB(255, 184, 184, 184)),
                                children: [
                                  TextSpan(
                                    text: 'Christian 👋',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  )
                                ]),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for therapist, products',
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                        ),
                        cursorColor: const Color.fromARGB(255, 128, 128, 128),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.all(13.0),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClinicNearYou(),
                    UpcomingEvents(),
                    InformativeArticles(),
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
    } catch (e) {
      return const Scaffold(
        body: Center(
          child: Text('An error occurred'),
        ),
      );
    }
  }
}

