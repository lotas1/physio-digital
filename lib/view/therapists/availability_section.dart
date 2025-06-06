import 'package:flutter/material.dart';
import 'package:physio_digital/model/therapist/therapist.dart';

class AvailabilitySection extends StatelessWidget {
  final Therapist therapist;
  
  const AvailabilitySection({Key? key, required this.therapist}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Availability',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        therapist.availability.isNotEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ...therapist.availability.map((time) => Padding(
                        padding: const EdgeInsets.only(bottom: 4),
                        child: Text(
                          time,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.black87,
                          ),
                        ),
                      )),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF354AD9),
                    ),
                    child: const Text(
                      'Book now',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                ],
              )
            : const Text(
                'No availability information',
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
      ],
    );
  }
}
