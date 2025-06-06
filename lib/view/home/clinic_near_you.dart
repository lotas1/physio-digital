import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:physio_digital/view/clinics/listclinic/list_clinic_controller.dart';
import 'package:physio_digital/view/clinics/clinic_profile/clinic_details.dart';
import 'package:physio_digital/view/clinics/clinic_view.dart';
import 'package:physio_digital/model/clinic/clinic.dart';
import 'package:physio_digital/repository/clinic_repository.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ClinicNearYou extends GetView<ListClinicController> {
  const ClinicNearYou({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize controller if not already initialized
    if (!Get.isRegistered<ListClinicController>()) {
      Get.put(ListClinicController(Get.find()));
    }
    
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('Clinic Near you', onViewAll: () {
            Get.to(() => const ClinicsView(), transition: Transition.rightToLeft);
          }),
          Obx(() {
            if (controller.isLoading.value) {
              return _buildLoadingList();
            } else if (controller.clinics.isEmpty) {
              return _buildEmptyState();
            } else {
              return _buildClinicList();
            }
          }),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, {required VoidCallback onViewAll}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
          TextButton.icon(
            onPressed: onViewAll,
            label: const Text(
              'See all',
              style: TextStyle(color: Color.fromARGB(255, 99, 99, 99)),
            ),
            icon: const Icon(Icons.arrow_forward, size: 16),
            iconAlignment: IconAlignment.end,
            style: TextButton.styleFrom(
              iconColor: const Color.fromARGB(255, 99, 99, 99),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildClinicList() {
    // Show only first 4 clinics or all if less than 4
    final clinicsToShow = controller.clinics.length > 4 
        ? controller.clinics.take(4).toList() 
        : controller.clinics;
    
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: clinicsToShow.length,
        itemBuilder: (context, index) {
          final clinic = clinicsToShow[index];
          return _buildClinicCard(clinic);
        },
      ),
    );
  }

  Widget _buildLoadingList() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 2,
        itemBuilder: (context, index) {
          return Container(
            width: 200,
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF354AD9),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      height: 180,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_hospital_outlined,
              size: 48,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 8),
            Text(
              'No clinics found',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClinicCard(Clinic clinic) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => ClinicDetails(clinic: clinic),
          transition: Transition.rightToLeft,
        );
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
              offset: Offset(0, 1),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              _buildClinicImage(clinic),
              Positioned(
                left: 0,
                top: 0,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.grey.withValues(alpha: 0.7),
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(8)),
                  ),
                  child: const FaIcon(FontAwesomeIcons.stethoscope,
                      color: Colors.white, size: 14),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(12)),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.7),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        clinic.name ?? 'Unnamed Clinic',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        clinic.services.isNotEmpty 
                            ? clinic.services.first 
                            : 'General Services',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildClinicImage(Clinic clinic) {
    if (clinic.images.isNotEmpty) {
      return CachedNetworkImage(
        imageUrl: clinic.images.first,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
        placeholder: (context, url) => Container(
          color: Colors.grey[200],
          child: const Center(
            child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF354AD9)),
            ),
          ),
        ),
        errorWidget: (context, url, error) => _buildDefaultImage(),
      );
    } else {
      return _buildDefaultImage();
    }
  }

  Widget _buildDefaultImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: const Color(0xFFF5F6FA),
      child: const Center(
        child: Icon(
          Icons.local_hospital,
          size: 48,
          color: Color(0xFF354AD9),
        ),
      ),
    );
  }
}
