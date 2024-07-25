import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/view/profile/profile_setting_section/edit_form.dart';
import 'package:physio_digital/view/profile/profile_setting_section/edit_profile.dart';

class ViewProfileSettings extends StatelessWidget {
  const ViewProfileSettings({super.key});

  @override
  Widget build(BuildContext context) {
    // return GetBuilder<AboutPageController>(builder: (ctrl) {
      try {
        return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Setting', style: TextStyle(fontWeight: FontWeight.bold),),
              actions: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {
                    Get.to(const EditProfile());
                  },
                ),
              ],
            ),
            body: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(8),
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.black.withOpacity(0.1),
                    //     blurRadius: 10,
                    //     spreadRadius: 1,
                    //     offset: Offset(0, 3),
                    //   ),
                    // ],
                  ),
                  width: double.infinity,
                  child: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ProfileField(label: 'Full name', value: 'Cameroon Winch'),
                      SizedBox(height: 10),
                      ProfileField(label: 'Username', value: '@Cameroon007'),
                      SizedBox(height: 10),
                      ProfileField(
                          label: 'Your email',
                          value: 'CameroonWinch@yopmailcom'),
                      SizedBox(height: 10),
                      ProfileField(label: 'Phone number', value: '09043453434'),
                      SizedBox(height: 10),
                      ProfileField(label: 'Gender', value: 'Male'),
                      SizedBox(height: 10),

                      ProfileField(label: 'Age', value: '23'),
                    ],
                  ),
                ),
              ],
            ));
      } catch (e) {
        return const Scaffold(
          body: Center(
            child: Text('An error occurred'),
          ),
        );
      }
    // });
  }
}
