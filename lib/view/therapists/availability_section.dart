import 'package:flutter/material.dart';
import 'package:physio_digital/model/therapist/therapist.dart';
import 'package:url_launcher/url_launcher.dart';

class AvailabilitySection extends StatelessWidget {
  final Therapist therapist;
  
  const AvailabilitySection({Key? key, required this.therapist}) : super(key: key);

  Future<void> _launchWhatsAppForBooking(BuildContext context) async {
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
          "📅 THERAPIST BOOKING REQUEST\n\n"
              "Therapist: ${therapist.name ?? 'Unnamed Therapist'}\n\n"
              "Services: $services\n\n"
              "Education: ${therapist.education ?? 'Not specified'}\n\n"
              "Available Times:\n$availability\n\n"
              "Contact Information:\n$contactInfo\n"
              "About: ${therapist.about ?? 'No information available'}\n\n"
              "I would like to book an appointment with this therapist. Please confirm the available time slots and proceed with the booking.",
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
                    onPressed: () => _launchWhatsAppForBooking(context),
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
