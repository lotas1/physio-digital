import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/auth/auth_gate.dart';
import 'package:physio_digital/bindings/registration_binding.dart';
// import 'package:physio_digital/controllers/home_controller.dart';
import 'package:physio_digital/firebase_options.dart';
import 'package:physio_digital/themes/light_mode.dart';
import 'package:physio_digital/view/clinics/clinic.dart';
import 'package:physio_digital/view/home/home_page.dart';
import 'package:physio_digital/view/posts/list_posts.dart';
import 'package:physio_digital/view/products/product_list_page.dart';
import 'package:physio_digital/view/profile/user_profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final HomeController homeController = Get.put(HomeController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: [
      GetPage(name: '/', page: () => const HomePage()),
      GetPage(name: '/marketplace', page: () => const ProductListPage()),
      GetPage(name: '/clinic', page: () => const Clinic()),
      GetPage(name: '/blog', page: () => const ListPostsPage()),
      GetPage(name: '/profile', page: () => const UserProfile()),
      ],
      theme: lightMode,
      home: const AuthGate(),

      initialBinding: RegistrationBinding(),
    );
  }
}
