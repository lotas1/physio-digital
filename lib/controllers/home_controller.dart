import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  var displayName = ''.obs;

  @override
  void onInit() {
    super.onInit();
    _loadUserName();
  }

  void _loadUserName() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final nameFromEmail = user.email?.split('@').first ?? "User";
      displayName.value = user.displayName ?? nameFromEmail;
    }
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}

