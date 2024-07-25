import 'package:flutter/material.dart';

class ClinicContactInfoSection extends StatelessWidget {
  const ClinicContactInfoSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Location',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(
              Icons.location_on_outlined,
              size: 20,
            ),
            SizedBox(width: 8),
            Text('First Street junction, Onitsha, Nigeria'),
          ],
        ),
        SizedBox(height: 8),
        Text(
          'Contact info',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(
              Icons.phone_outlined,
              size: 20,
            ),
            SizedBox(width: 8),
            Text('+234-5455-45332'),
          ],
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(
              Icons.email_outlined,
              size: 20,
            ),
            SizedBox(width: 8),
            Text('johndoe@gmail.com'),
          ],
        ),
      ],
    );
  }
}
