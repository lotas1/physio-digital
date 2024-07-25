import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/view/therapists/therapist_details.dart';

class TherapistView extends StatelessWidget {
  const TherapistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: const [
          TherapistCard(
            name: 'Dr. Alic Michealson',
            profession: 'Physiotherapist',
            distance: '600km away',
            rating: 4.5,
            imageUrl: 'assets/images/onboard.jpg',
          ),
          TherapistCard(
            name: 'Dr. Alic Michealson',
            profession: 'Physiotherapist',
            distance: '600km away',
            rating: 4.5,
            imageUrl: 'assets/images/onboard.jpg',
          ),
          TherapistCard(
            name: 'Dr. Alic Michealson',
            profession: 'Physiotherapist',
            distance: '600km away',
            rating: 4.5,
            imageUrl: 'assets/images/onboard.jpg',
          ),
          TherapistCard(
            name: 'Dr. Alic Michealson',
            profession: 'Physiotherapist',
            distance: '600km away',
            rating: 4.5,
            imageUrl: 'assets/images/onboard.jpg',
          ),
          TherapistCard(
            name: 'Dr. Alic Michealson',
            profession: 'Physiotherapist',
            distance: '600km away',
            rating: 4.5,
            imageUrl: 'assets/images/onboard.jpg',
          ),
          TherapistCard(
            name: 'Dr. Alic Michealson',
            profession: 'Physiotherapist',
            distance: '600km away',
            rating: 4.5,
            imageUrl: 'assets/images/onboard.jpg',
          ),
          TherapistCard(
            name: 'Dr. Alic Michealson',
            profession: 'Physiotherapist',
            distance: '600km away',
            rating: 4.5,
            imageUrl: 'assets/images/onboard.jpg',
          ),
          TherapistCard(
            name: 'Dr. Alic Michealson',
            profession: 'Physiotherapist',
            distance: '600km away',
            rating: 4.5,
            imageUrl: 'assets/images/onboard.jpg',
          ),
          TherapistCard(
            name: 'Dr. Alic Michealson',
            profession: 'Physiotherapist',
            distance: '600km away',
            rating: 4.5,
            imageUrl: 'assets/images/onboard.jpg',
          ),
        ],
      ),
    );
  }
}

class TherapistCard extends StatelessWidget {
  final String name;
  final String profession;
  final String distance;
  final double rating;
  final String imageUrl;

  const TherapistCard({
    super.key,
    required this.name,
    required this.profession,
    required this.distance,
    required this.rating,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Get.to(TherapistDetailPage(name: name, profession: profession, distance: distance, rating: rating, imageUrl: imageUrl));
        Get.to(const TherapistProfileScreen());
      },
      child: Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: AssetImage(imageUrl),
          ),
          title: Text(name),
          subtitle: Text(profession),
          //rating will be implemented in version 2.0
          // trailing: Column(
          //   children: [
          //     Row(
          //       mainAxisSize: MainAxisSize.min,
          //       children: [
          //         const Icon(Icons.star, color: Colors.yellow),
          //         const SizedBox(width: 4),
          //         Text(rating.toString()),
          //       ],
          //     ),
          //     Text(distance),
          //   ],
          // ),
        ),
      ),
    );
  }
}
