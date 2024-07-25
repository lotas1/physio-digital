import 'package:get/get.dart';
import 'package:physio_digital/controllers/create_password/account_verification_controllers.dart';
import 'package:physio_digital/controllers/create_password/create_password_controllers.dart';

class CreatePasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountVerificationController>(() => AccountVerificationController());
    Get.lazyPut<CreatePasswordController>(() => CreatePasswordController());
  }
}