import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/view/components/my_button.dart';
import 'package:physio_digital/view/profile/profile_setting_section/my_profile.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  void editProfile() {}

  @override
  Widget build(BuildContext context) {
    try {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Edit Profile'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Get.to(const EditProfile());
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
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
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const ProfileField(
                      label: 'Full name',
                      value: 'Cameroon Winch',
                    ),
                    const ProfileField(
                      label: 'Username',
                      value: '@Cameroon007',
                    ),
                    const ProfileField(
                      label: 'Contact info(phone)',
                      value: '09043453434',
                    ),
                    const ProfileField(
                      label: 'Your email',
                      value: 'CameroonWinch@yopmail.com',
                    ),
                    const ProfileField(
                      label: 'Location',
                      value: '090234534323',
                    ),
                    const ProfileField(
                      label: 'Gender',
                      value: 'Male',
                    ),
                    const ProfileField(
                      label: 'Age',
                      value: '23',
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: double.infinity,
                      child: MyButton(
                        text: 'Proceed',
                        onTap: editProfile,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
