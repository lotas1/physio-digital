import 'package:flutter/material.dart';
import 'package:physio_digital/model/therapist/therapist.dart';

class ServicesSection extends StatelessWidget {
  final Therapist therapist;
  
  const ServicesSection({Key? key, required this.therapist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Services',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 8),
        therapist.services.isNotEmpty
            ? Wrap(
                spacing: 8,
                runSpacing: 4,
                children: therapist.services.map((service) {
                  return Chip(
                    label: Text(service),
                    backgroundColor: const Color(0xFFEEF0FF),
                    labelStyle: const TextStyle(
                      color: Color(0xFF354AD9),
                      fontWeight: FontWeight.w500,
                    ),
                  );
                }).toList(),
              )
            : const Text(
                'No services listed',
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
      ],
    );
  }
}
