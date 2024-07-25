import 'package:get/get.dart';

class AccountVerificationController extends GetxController {
  
  @override
  // ignore: unnecessary_overrides
  void onInit() {
    super.onInit();
  }

  // Variables to manage the OTP inputs
  var otpFields = List<String>.filled(4, "").obs;

  // Function to handle OTP input changes
  void updateOtpField(int index, String value) {
    otpFields[index] = value;
    update(); // Triggers the update in GetBuilder
  }

  // Function to handle OTP resend
  void resendOtp() {
    // Implement your resend OTP logic here
  }

  // Function to handle OTP verification
  
}
