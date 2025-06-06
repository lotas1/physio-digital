import 'package:flutter/material.dart';
import 'package:physio_digital/model/therapist/therapist.dart';

class ContactInfoSection extends StatelessWidget {
  final Therapist therapist;
  
  const ContactInfoSection({Key? key, required this.therapist}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contact Info',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Text(therapist.phone ?? 'Phone not provided'),
        const SizedBox(height: 4),
        Text(therapist.email ?? 'Email not provided'),
      ],
    );
  }
}
