import 'package:flutter/material.dart';

class ProfileDetails extends StatelessWidget {
  const ProfileDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Background',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        Text(
          'NStep Recumbent Cross Trainer T4R combines a natural sitting position with a smooth stepping motion to work all major muscle groups during exercise.',
        ),
        SizedBox(height: 8),
        Text(
          'Education',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        Text(
          'NStep Recumbent Cross Trainer T4R combines a natural sitting position with a smooth stepping motion to work all major muscle groups during exercise.',
        ),
      ],
    );
  }
}
