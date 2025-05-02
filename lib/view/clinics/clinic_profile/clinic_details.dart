import 'package:flutter/material.dart';

class ClinicDetails extends StatelessWidget {
  const ClinicDetails({Key? key}) : super(key: key);

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
                      color: Colors.black.withOpacity(0.05),
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
                  onPressed: () {},
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
                  const Color(0xFF1A1F38).withOpacity(0.5),
                  const Color(0xFF1A1F38).withOpacity(0.8),
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
              color: Colors.white.withOpacity(0.2),
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
                child: const Icon(
                  Icons.local_hospital,
                  color: Color(0xFF354AD9),
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Dr Felix Clinic',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.local_hospital, color: Colors.white, size: 16),
                      SizedBox(width: 4),
                      Text(
                        'Orthopedic',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
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
          'Location & Contact',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Color(0xFF1A1F38),
          ),
        ),
        const SizedBox(height: 16),
        _buildInfoRow(
          Icons.location_on_outlined,
          'First Street junction, Onitsha, Nigeria',
          const Color(0xFF354AD9),
        ),
        const SizedBox(height: 12),
        _buildInfoRow(
          Icons.phone_outlined,
          '+234-5455-45332',
          const Color(0xFF354AD9),
        ),
        const SizedBox(height: 12),
        _buildInfoRow(
          Icons.email_outlined,
          'johndoe@gmail.com',
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
        Wrap(
          spacing: 10.0,
          runSpacing: 10.0,
          children: [
            _buildServiceChip('Massage therapy'),
            _buildServiceChip('Acupuncture'),
            _buildServiceChip('Physical Therapy'),
            _buildServiceChip('Rehabilitation'),
          ],
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
        const Text(
          'Dr. Felix Clinic offers comprehensive physiotherapy services with state-of-the-art facilities and experienced professionals. Our approach focuses on personalized treatment plans to ensure optimal recovery and well-being for all patients.',
          style: TextStyle(
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
        _buildInfoRow(
          Icons.date_range,
          'Mon - Sat: 8:00 AM - 6:00 PM',
          const Color(0xFF354AD9),
        ),
        const SizedBox(height: 12),
        _buildWeekdayAvailability(),
      ],
    );
  }

  Widget _buildWeekdayAvailability() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildDayIndicator('M', true),
        _buildDayIndicator('T', true),
        _buildDayIndicator('W', true),
        _buildDayIndicator('T', true),
        _buildDayIndicator('F', true),
        _buildDayIndicator('S', true),
        _buildDayIndicator('S', false),
      ],
    );
  }

  Widget _buildDayIndicator(String day, bool available) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: available ? const Color(0xFFEEF0FB) : const Color(0xFFE5E5E5),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          day,
          style: TextStyle(
            color: available ? const Color(0xFF354AD9) : const Color(0xFF9E9E9E),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
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