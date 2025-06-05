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
                'Master of Physiotherapy from the University of Health Sciences with extensive training in musculoskeletal therapy.',
          ),
          SectionTitle(title: 'Experience'),
          SectionContent(
            content:
                'Over 10 years of clinical experience helping patients recover mobility and improve their quality of life.',
          ),
          SectionTitle(title: 'Specializations'),
          SectionContent(
            content:
                'Sports injuries, post-operative rehabilitation, and chronic pain management.',
          ),
        ],
      ),
    );
  }
}