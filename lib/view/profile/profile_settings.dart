import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/view/profile/profile_setting_section/view_profile.dart';

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
      try {
        return ListTile(
          leading: const Icon(Icons.person, color: Colors.black),
          title: const Text(
            'Profile Settings',
            style: TextStyle(fontSize: 16),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            Get.to(const ViewProfileSettings());
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
