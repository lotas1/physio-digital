import 'package:flutter/material.dart';

class LocationSection extends StatelessWidget {
  const LocationSection({Key? key}) : super(key: key);
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
        Text('First Street junction, Onitsha, Nigeria'),
      ],
    );
  }
}
