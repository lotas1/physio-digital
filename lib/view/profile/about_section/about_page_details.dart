import 'package:flutter/material.dart';
import 'package:physio_digital/view/profile/about_section/about_app.dart';
import 'package:physio_digital/view/profile/about_section/about_physio.dart';
import 'package:physio_digital/view/profile/about_section/history.dart';

class AboutPageDetails extends StatefulWidget {
  const AboutPageDetails({Key? key}) : super(key: key);

  @override
  AboutPageDetailsState createState() => AboutPageDetailsState();
}

class AboutPageDetailsState extends State<AboutPageDetails> {
  final List<String> categories = [
    'About Physiotherapist',
    'History',
    'About App',
  ];

  String activeCategory = 'About Physiotherapist';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(26, 53, 75, 217),
        // toolbarHeight: 100,
        centerTitle: true,
        title: const Text('About', style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            SizedBox(
              height: 25,
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
                        backgroundColor: isActive
                            ? const Color.fromARGB(110, 53, 75, 217)
                            : Colors.white,
                        foregroundColor: isActive
                            ? const Color.fromARGB(230, 53, 75, 217)
                            : Colors.black,
                      ),
                      child: Text(category),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: Center(
                child: _buildCategoryView(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryView() {
    switch (activeCategory) {
      case 'About PhysioTherapist':
        return const AboutPhysio();
      case 'History':
        return const History();
      case 'About App':
        return const AboutApp();
      default:
        return const AboutPhysio();
    }
  }
}
