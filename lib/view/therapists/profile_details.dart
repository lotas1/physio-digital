import 'package:flutter/material.dart';
import 'package:physio_digital/model/therapist/therapist.dart';

class ProfileDetails extends StatelessWidget {
  final Therapist therapist;
  
  const ProfileDetails({Key? key, required this.therapist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Background',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Text(
          therapist.about ?? 'No background information available.',
        ),
        const SizedBox(height: 16),
        const Text(
          'Education',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        Text(
          therapist.education ?? 'No education information available.',
        ),
      ],
    );
  }
}
