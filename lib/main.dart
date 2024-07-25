import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/bindings/registration_binding.dart';
import 'package:physio_digital/themes/light_mode.dart';
import 'package:physio_digital/view/onbording/onboarding.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
      // getPages: [
      // GetPage(name: '/', page: () => const HomePage()),
      // GetPage(name: '/marketplace', page: () => const ProductListPage()),
      // GetPage(name: '/clinic', page: () => const Clinic()),
      // GetPage(name: '/blog', page: () => const ListPostsPage()),
      // GetPage(name: '/profile', page: () => const UserProfile()),
      // ],
      theme: lightMode,
      home: const OnboardingPage(),

      initialBinding: RegistrationBinding(),
    );
  }
}
