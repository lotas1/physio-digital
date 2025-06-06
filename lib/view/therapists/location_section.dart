import 'package:flutter/material.dart';
import 'package:physio_digital/model/therapist/therapist.dart';

class LocationSection extends StatelessWidget {
  final Therapist therapist;
  
  const LocationSection({Key? key, required this.therapist}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Location',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Text(therapist.location ?? 'Location not specified'),
      ],
    );
  }
}
