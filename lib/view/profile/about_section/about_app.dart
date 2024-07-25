import 'package:flutter/material.dart';
import 'package:physio_digital/view/profile/about_section/section_content.dart';
import 'package:physio_digital/view/profile/about_section/section_title.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            SectionTitle(title: 'About the App'),
            SectionContent(
              content:
                  'This app is designed to help users understand and engage with physiotherapy practices. It offers various resources and tools to support their journey to better health.',
            ),
            SectionTitle(title: 'Features'),
            SectionContent(
              content:
                  'The app includes features such as exercise guides, appointment scheduling, and educational articles to keep users informed and motivated.',
            ),
          ],
        ),
      ),
    );
  }
}
