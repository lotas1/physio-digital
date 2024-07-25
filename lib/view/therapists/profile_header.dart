import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // CircleAvatar(
        //   // radius: 30,
        //   backgroundImage:
        //       AssetImage('assets/images/onboard.jpg'), // Add your image asset
        // ),
        Container(
          width: 65,
          height: 65,
          decoration: const BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.all(Radius.circular(10)),
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/onboard.jpg'), // Make sure this image exists in your assets
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 16),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Physiotherapist'),
            Text(
              'Dr. Samantha Williams',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Awka, Nigeria'),
            // Row(
            //   children: [
            //     Icon(Icons.star, color: Colors.orange),
            //     Text('4.0'),
            //   ],
            // ),
          ],
        ),
      ],
    );
  }
}
