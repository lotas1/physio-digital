import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/model/therapist/therapist.dart';
import 'package:physio_digital/view/therapists/listTherapist/list_therapist_controller.dart';
import 'package:physio_digital/repository/therapist_repository.dart';

class TherapistView extends StatelessWidget {
  const TherapistView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ListAllTherapistsController>(
      init: ListAllTherapistsController(Get.find<TherapistRepository>()),
      builder: (controller) {
        return RefreshIndicator(
          onRefresh: controller.refreshTherapists,
          child: Obx(() {
            if (controller.isLoading.value) {
              return const Center(child: CircularProgressIndicator());
            } else if (controller.errorMessage.isNotEmpty) {
              return Center(child: Text(controller.errorMessage.value));
            } else if (controller.therapists.isEmpty) {
              return const Center(child: Text('No therapists found'));
            } else {
              return ListView.builder(
                itemCount: controller.therapists.length,
                itemBuilder: (context, index) {
                  final therapist = controller.therapists[index];
                  return TherapistCard(therapist: therapist);
                },
              );
            }
          }),
        );
      },
    );
  }
}

class TherapistCard extends StatelessWidget {
  final Therapist therapist;

  const TherapistCard({
    Key? key,
    required this.therapist,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to therapist profile screen
        // Get.to(() => TherapistProfileScreen(therapist: therapist));
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: therapist.images.isNotEmpty
                ? NetworkImage(therapist.images.first)
                : const AssetImage('assets/images/default_profile.png') as ImageProvider,
          ),
          title: Text(therapist.name ?? 'Unknown'),
          subtitle: Text(therapist.education ?? 'Physiotherapist'),
          // Uncomment this if you want to add a delete functionality
          // trailing: IconButton(
          //   icon: const Icon(Icons.delete),
          //   onPressed: () {
          //     Get.defaultDialog(
          //       title: 'Confirm Deletion',
          //       content: const Text('Are you sure you want to delete this therapist?'),
          //       textConfirm: 'Delete',
          //       textCancel: 'Cancel',
          //       confirmTextColor: Colors.white,
          //       onConfirm: () {
          //         Get.back();
          //         Get.find<ListAllTherapistsController>().deleteTherapist(therapist.id!);
          //       },
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}