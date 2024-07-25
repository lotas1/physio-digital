import 'package:get/get.dart';
import 'package:physio_digital/controllers/onboarding/registration/forget_password/confirm_forget_password_controllers.dart';
import 'package:physio_digital/controllers/onboarding/registration/forget_password/create_new_password_controllers.dart';
import 'package:physio_digital/controllers/onboarding/registration/forget_password/forget_password_controllers.dart';
import 'package:physio_digital/controllers/onboarding/registration/forget_password/forget_password_verification_controllers.dart';

class ForgetPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetPasswordController>(() => ForgetPasswordController());
    Get.lazyPut<ForgetPasswordVerificationController>(() => ForgetPasswordVerificationController());
    Get.lazyPut<ConfirmForgetPasswordController>(() => ConfirmForgetPasswordController());
    Get.lazyPut<CreateNewPasswordController>(() => CreateNewPasswordController());
  }
}