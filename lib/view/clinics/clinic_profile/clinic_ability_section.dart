import 'package:flutter/material.dart';

class ClinicAbilitySection extends StatelessWidget {
  const ClinicAbilitySection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Availability',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Row(
          children: [
            Icon(
              Icons.date_range,
              size: 20,
            ),
            SizedBox(width: 8),
            Text('Mon, Tues, Wed, Thu, Friday, Sat'),
          ],
        )
      ],
    );
  }
}
