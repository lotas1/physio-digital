import 'package:flutter/material.dart';
import 'package:physio_digital/view/profile/about_section/section_content.dart';
import 'package:physio_digital/view/profile/about_section/section_title.dart';

class AboutPhysio extends StatelessWidget {
  const AboutPhysio({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView(
        children: const [
          SectionTitle(title: 'Education'),
          SectionContent(
            content:
                'NuStep Recumbent Cross Trainer T4R combines a natural sitting position with a smooth stepping motion to work all major muscle groups during exercise.',
          ),
          SectionTitle(title: 'Education'),
          SectionContent(
            content:
                'NuStep Recumbent Cross Trainer T4R combines a natural sitting position with a smooth stepping motion to work all major muscle groups during exercise.',
          ),
          SectionTitle(title: 'Education'),
          SectionContent(
            content:
                'NuStep Recumbent Cross Trainer T4R combines a natural sitting position with a smooth stepping motion to work all major muscle groups during exercise.',
          ),
        ],
      ),
    );
  }
}