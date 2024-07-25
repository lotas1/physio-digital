import 'package:get/get.dart';
import 'package:physio_digital/controllers/onboarding/onboarding_controllers.dart';
import 'package:physio_digital/controllers/onboarding/registration/login_Controller.dart';
import 'package:physio_digital/controllers/onboarding/registration/sign_up_controllers.dart';

class RegistrationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
    Get.lazyPut<SignUpcontroller>(() => SignUpcontroller());
    Get.lazyPut<LoginController>(() => LoginController());
    // Add more dependencies related to registration here
  }
}
