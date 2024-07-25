import 'package:flutter/material.dart';

class ClinicServicSection extends StatelessWidget {
  const ClinicServicSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Services',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          children: [
            Chip(
              label: Text(
                'Massage therapy',
                style: TextStyle(color: Colors.black),
              ),
              shape: StadiumBorder(
                side: BorderSide(color: Colors.transparent),
              ),
            ),
            Chip(
              label: Text(
                'Acupuncture',
                style: TextStyle(color: Colors.black),
              ),
              shape: StadiumBorder(
                side: BorderSide(color: Colors.transparent),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
