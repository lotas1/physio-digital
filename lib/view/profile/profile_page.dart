import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/view/profile/about_section/about_page_details.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
        try {
          return ListTile(
            leading: const Icon(Icons.work_history),
            title: const Text(
              'About Physiotherapy',
              style: TextStyle(fontSize: 16),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () {
              Get.to(const AboutPageDetails());
            },
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
