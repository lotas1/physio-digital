import 'package:flutter/material.dart';

class ReviewsSection extends StatelessWidget {
  const ReviewsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Reviews',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        ListTile(
          leading: CircleAvatar(
            backgroundImage:
                AssetImage('assets/images/onboard.jpg'), // Add your image asset
          ),
          title: Text('Jame olive'),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange),
                  Text('4.0'),
                ],
              ),
              Text(
                  'Absolutely love this coffee! The aroma is rich and inviting, and the taste is smooth and bold.'),
            ],
          ),
        ),
        TextButton(
          onPressed: null,
          child: Text('See all rating'),
        ),
      ],
    );
  }
}
