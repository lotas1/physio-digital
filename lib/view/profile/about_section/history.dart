import 'package:flutter/material.dart';
import 'package:physio_digital/view/profile/about_section/section_content.dart';
import 'package:physio_digital/view/profile/about_section/section_title.dart';

class History extends StatelessWidget {
  const History({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: const[
          SectionTitle(title: 'History of Physiotherapy'),
          SectionContent(
            content:
                'Physiotherapy has a long and rich history dating back to ancient civilizations. It has evolved significantly over the centuries to become a vital component of modern healthcare.',
          ),
          SectionTitle(title: 'Modern Developments'),
          SectionContent(
            content:
                'In recent decades, physiotherapy has seen numerous advancements, including the integration of new technologies and techniques to enhance patient outcomes.',
          ),
        ],
      ),
    );
  }
}