import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:physio_digital/model/clinic/clinic.dart';
import 'package:url_launcher/url_launcher.dart';

class ClinicDetails extends StatelessWidget {
  final Clinic clinic;
  
  const ClinicDetails({Key? key, required this.clinic}) : super(key: key);

  Future<void> _launchWhatsAppForAppointment(BuildContext context) async {
    String services = clinic.services.isNotEmpty 
        ? clinic.services.join(', ') 
        : 'General Services';
    
    String availability = clinic.availability.isNotEmpty 
        ? clinic.availability.join('\n') 
        : 'Please inquire about availability';

    String contactInfo = '';
    if (clinic.phone != null && clinic.phone!.isNotEmpty) {
      contactInfo += 'Phone: ${clinic.phone!}\n';
    }
    if (clinic.email != null && clinic.email!.isNotEmpty) {
      contactInfo += 'Email: ${clinic.email!}\n';
    }

    final String whatsappUrl = "https://wa.me/+2348115789924/?text=" +
        Uri.encodeComponent(
          "🏥 CLINIC APPOINTMENT REQUEST\n\n"
              "Clinic: ${clinic.name ?? 'Unnamed Clinic'}\n\n"
              "Services: $services\n\n"
              "Availability:\n$availability\n\n"
              "Contact Information:\n$contactInfo\n"
              "Description: ${clinic.description ?? 'No description available'}\n\n"
              "I would like to schedule an appointment at this clinic. Please let me know the available slots and booking procedure.",
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
      backgroundColor: const Color(0xFFF8F9FD),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            _buildProfileHeader(context),

            // Main Content Card
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildContactInfoSection(),
                      const Divider(height: 32),
                      _buildServiceSection(),
                      const Divider(height: 32),
                      _buildInfoSection(),
                      const Divider(height: 32),
                      _buildAvailabilitySection(),
                    ],
                  ),
                ),
              ),
            ),

            // Appointment Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => _launchWhatsAppForAppointment(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF354AD9),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 2,
                  ),
                  child: const Text(
                    'Schedule Appointment',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  // Profile Header
  Widget _buildProfileHeader(BuildContext context) {
    return Stack(
      children: [
        // Background gradient instead of image (to avoid asset errors)
        Container(
          height: 220,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0xFF354AD9),
                const Color(0xFF151C3B),
              ],
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  const Color(0xFF1A1F38).withValues(alpha: 0.5),
                  const Color(0xFF1A1F38).withValues(alpha: 0.8),
                ],
              ),
            ),
          ),
        ),

        // Back button
        Positioned(
          top: MediaQuery.of(context).padding.top + 16,
          left: 16,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ),

        // Clinic name and logo
        Positioned(
          bottom: 24,
          left: 24,
          right: 24,
          child: Row(
            children: [
              Container(
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(color: Colors.white, width: 2),
                  color: Colors.white,
                ),
                child: clinic.images.isNotEmpty
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: clinic.images.first,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Icon(
                            Icons.local_hospital,
                            color: Color(0xFF354AD9),
                            size: 32,
                          ),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.local_hospital,
                            color: Color(0xFF354AD9),
                            size: 32,
                          ),
                        ),
                      )
                    : const Icon(
                        Icons.local_hospital,
                        color: Color(0xFF354AD9),
                        size: 32,
                      ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      clinic.name ?? 'Unnamed Clinic',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    if (clinic.services.isNotEmpty)
                      Row(
                        children: [
                          const Icon(Icons.local_hospital, color: Colors.white, size: 16),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              clinic.services.first,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // Contact Info Section
  Widget _buildContactInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Contact Information',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1F38),
          ),
        ),
        const SizedBox(height: 16),
        if (clinic.phone != null && clinic.phone!.isNotEmpty)
          _buildInfoRow(
            Icons.phone_outlined,
            clinic.phone!,
            const Color(0xFF354AD9),
          ),
        if (clinic.phone != null && clinic.phone!.isNotEmpty && clinic.email != null && clinic.email!.isNotEmpty)
          const SizedBox(height: 12),
        if (clinic.email != null && clinic.email!.isNotEmpty)
          _buildInfoRow(
            Icons.email_outlined,
            clinic.email!,
            const Color(0xFF354AD9),
          ),
      ],
    );
  }

  // Service Section
  Widget _buildServiceSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Services',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1F38),
          ),
        ),
        const SizedBox(height: 16),
        if (clinic.services.isNotEmpty)
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: clinic.services.map((service) => _buildServiceChip(service)).toList(),
          )
        else
          const Text(
            'No services listed',
            style: TextStyle(
              color: Color(0xFF4A4E69),
              fontSize: 15,
            ),
          ),
      ],
    );
  }

  Widget _buildServiceChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF0FB),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Color(0xFF354AD9),
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Info Section
  Widget _buildInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'About Clinic',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1F38),
          ),
        ),
        const SizedBox(height: 12),
        Text(
          clinic.description ?? 'No description available for this clinic.',
          style: const TextStyle(
            color: Color(0xFF4A4E69),
            fontSize: 15,
            height: 1.5,
          ),
        ),
      ],
    );
  }

  // Availability Section
  Widget _buildAvailabilitySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Availability',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1F38),
          ),
        ),
        const SizedBox(height: 16),
        if (clinic.availability.isNotEmpty)
          Column(
            children: clinic.availability
                .map((schedule) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: _buildInfoRow(
                        Icons.access_time,
                        schedule,
                        const Color(0xFF354AD9),
                      ),
                    ))
                .toList(),
          )
        else
          const Text(
            'No availability information provided',
            style: TextStyle(
              color: Color(0xFF4A4E69),
              fontSize: 15,
            ),
          ),
      ],
    );
  }



  Widget _buildInfoRow(IconData icon, String text, Color iconColor) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: iconColor,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 15,
              color: Color(0xFF4A4E69),
            ),
          ),
        ),
      ],
    );
  }
}