import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:physio_digital/repository/clinic_repository.dart';
import 'package:physio_digital/repository/product_repository.dart';
import 'package:physio_digital/repository/therapist_repository.dart';
import 'package:physio_digital/themes/light_mode.dart';
import 'package:physio_digital/view/clinics/clinic.dart';
import 'package:physio_digital/view/clinics/listclinic/list_clinic_controller.dart';
import 'package:physio_digital/view/posts/list_posts.dart';
import 'package:physio_digital/view/products/listproduct/list_product_controller.dart';
import 'package:physio_digital/controllers/home_controller.dart';
import 'package:physio_digital/view/home/home_page.dart';
import 'package:physio_digital/view/products/listproduct/product_list_page.dart';
import 'package:physio_digital/view/profile/user_profile.dart';
import 'package:physio_digital/bindings/registration_binding.dart';
import 'package:physio_digital/view/therapists/listTherapist/list_therapist_controller.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeFirebase();
  await initializeDependencies();
  runApp(const MyApp());
}

Future<void> initializeFirebase() async {
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Firebase initialized successfully');
  } catch (e) {
    print('Error initializing Firebase: $e');
  }
}

Future<void> initializeDependencies() async {
  // Repositories
  Get.put<ProductRepository>(ProductRepositoryImpl());
  Get.put<TherapistRepository>(TherapistRepositoryImpl());
  Get.put<ClinicRepository>(ClinicRepositoryImpl());

  // Controllers
  Get.put(HomeController());
  Get.put(ListAllTherapistsController(Get.find<TherapistRepository>()));
  Get.put(ListClinicController(Get.find<ClinicRepository>()));
  Get.put(ListProductController(Get.find<ProductRepository>()));

  // Verify that repositories and controllers are registered
  print('TherapistRepository registered: ${Get.isRegistered<TherapistRepository>()}');
  print('ClinicRepository registered: ${Get.isRegistered<ClinicRepository>()}');
  print('ProductRepository registered: ${Get.isRegistered<ProductRepository>()}');
  print('ListClinicController registered: ${Get.isRegistered<ListClinicController>()}');
  print('ListProductController registered: ${Get.isRegistered<ListProductController>()}');
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/', page: () => const HomePage()),
        GetPage(name: '/marketplace', page: () => const ListProducts()),
        GetPage(name: '/clinic', page: () => const Clinic()),
        GetPage(name: '/blog', page: () => const ListPostsPage()),
        GetPage(name: '/profile', page: () => const UserProfile()),
      ],
      theme: lightMode,
      home: const HomePage(),
      initialBinding: RegistrationBinding(),
    );
  }
}