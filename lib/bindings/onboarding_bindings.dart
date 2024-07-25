import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:physio_digital/controllers/onboarding/onboarding_controllers.dart';
import 'package:physio_digital/controllers/onboarding/registration/login_Controller.dart';
import 'package:physio_digital/controllers/onboarding/registration/sign_up_controllers.dart';

class OnboardingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnboardingController>(() => OnboardingController());
    Get.lazyPut<SignUpcontroller>(() => SignUpcontroller());
    Get.lazyPut<LoginController>(() => LoginController());
  }
}
