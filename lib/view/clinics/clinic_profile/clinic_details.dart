import 'package:flutter/material.dart';
import 'package:physio_digital/view/clinics/clinic_profile/clinic_ability_section.dart';
import 'package:physio_digital/view/clinics/clinic_profile/clinic_contact_info_section.dart';
import 'package:physio_digital/view/clinics/clinic_profile/clinic_info_section.dart';
import 'package:physio_digital/view/clinics/clinic_profile/clinic_profile_header.dart';
import 'package:physio_digital/view/clinics/clinic_profile/clinic_servic_section.dart';
// import 'package:physio_consult/views/user/therapists/availability_section.dart';
// import 'package:physio_consult/views/user/therapists/contact_info.dart';
// import 'package:physio_consult/views/user/therapists/service_section.dart';

class ClinicDetails extends StatelessWidget {
  const ClinicDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ClinicProfileHeader(),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(139, 194, 201, 244),
                    borderRadius: BorderRadius.circular(11),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClinicContactInfoSection(),
                        SizedBox(height: 16),
                        ClinicServicSection(),
                        SizedBox(height: 16),
                        ClinicInfoSection(),
                        SizedBox(height: 16),
                        ClinicAbilitySection(),
                        // SizedBox(height: 16),
                        // ReviewsSection(),
                      ],
                    ),
                  ),
                  
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                onPressed: (){},
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
