import 'package:flutter/material.dart';
import 'package:physio_digital/model/therapist/therapist.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:physio_digital/view/therapists/availability_section.dart';
import 'package:physio_digital/view/therapists/contact_info.dart';
import 'package:physio_digital/view/therapists/location_section.dart';
import 'package:physio_digital/view/therapists/profile_details.dart';
import 'package:physio_digital/view/therapists/profile_header.dart';
import 'package:physio_digital/view/therapists/service_section.dart';
// import 'package:physio_consult/views/user/therapist/review_section.dart';
// import 'package:physio_consult/views/user/therapist/shedule_appointmen.dart';

class TherapistProfileScreen extends StatelessWidget {
  final Therapist therapist;
  
  const TherapistProfileScreen({Key? key, required this.therapist}) : super(key: key);

  Future<void> _launchWhatsAppForAppointment(BuildContext context) async {
    String services = therapist.services.isNotEmpty 
        ? therapist.services.join(', ') 
        : 'General Physiotherapy';
    
    String availability = therapist.availability.isNotEmpty 
        ? therapist.availability.join('\n') 
        : 'Please inquire about availability';

    String contactInfo = '';
    if (therapist.phone != null && therapist.phone!.isNotEmpty) {
      contactInfo += 'Phone: ${therapist.phone!}\n';
    }
    if (therapist.email != null && therapist.email!.isNotEmpty) {
      contactInfo += 'Email: ${therapist.email!}\n';
    }
    if (therapist.location != null && therapist.location!.isNotEmpty) {
      contactInfo += 'Location: ${therapist.location!}\n';
    }

    final String whatsappUrl = "https://wa.me/+2348115789924/?text=" +
        Uri.encodeComponent(
          "👩‍⚕️ THERAPIST APPOINTMENT REQUEST\n\n"
              "Therapist: ${therapist.name ?? 'Unnamed Therapist'}\n\n"
              "Services: $services\n\n"
              "Education: ${therapist.education ?? 'Not specified'}\n\n"
              "Availability:\n$availability\n\n"
              "Contact Information:\n$contactInfo\n"
              "About: ${therapist.about ?? 'No information available'}\n\n"
              "I would like to schedule an appointment with this therapist. Please let me know the available slots and booking procedure.",
        );

    final Uri uri = Uri.parse(whatsappUrl);

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch WhatsApp';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(26, 53, 75, 217),
        centerTitle: true,
        title: const Text(
          "Therapist",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ProfileHeader(therapist: therapist),
              const SizedBox(height: 16),
              ProfileDetails(therapist: therapist),
              const SizedBox(height: 16),
              ServicesSection(therapist: therapist),
              const SizedBox(height: 16),
              AvailabilitySection(therapist: therapist),
              const SizedBox(height: 16),
              LocationSection(therapist: therapist),
              const SizedBox(height: 16),
              ContactInfoSection(therapist: therapist),
              const SizedBox(height: 16),
              // ReviewsSection(),
              // SizedBox(height: 16),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                onPressed: () => _launchWhatsAppForAppointment(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF354AD9),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20)
                ),
                child: const Text(
                  'Schedule Appointment',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
                ],
              ),
              const SizedBox(height: 26),

            ],
          ),
        ),
      ),
    );
  }
}
