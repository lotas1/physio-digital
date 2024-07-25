import 'package:flutter/material.dart';

class ClinicInfoSection extends StatelessWidget {
  const ClinicInfoSection({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Clinic Info',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Text(
          'NStep Recumbent Cross Trainer T4R combines a natural sitting position with a smooth stepping motion to work all major muscle groups during exercise.',
        ),
        // const SizedBox(height: 8),
        // TextButton(
        //   onPressed: () {
        //     // Add your onPressed functionality here
        //   },
        //   child: const Text('See more'),
        // ),
      ],
    );
  }
}
