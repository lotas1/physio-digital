import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'dart:async';

class HomeController extends GetxController {
  var currentIndex = 0.obs;
  var displayName = ''.obs;
  var _greeting = ''.obs;
  String get greeting => _greeting.value;
  
  Timer? _greetingTimer;
  static const Duration _greetingUpdateInterval = Duration(minutes: 30);

  @override
  void onInit() {
    super.onInit();
    _loadUserName();
    _updateGreeting();
    _startGreetingTimer();
  }

  @override
  void onClose() {
    _greetingTimer?.cancel();
    super.onClose();
  }

  void _loadUserName() {
    final user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final nameFromEmail = user.email?.split('@').first ?? "User";
      displayName.value = user.displayName ?? nameFromEmail;
    }
  }

  void _updateGreeting() {
    final hour = DateTime.now().hour;
    String newGreeting;
    
    if (hour < 12) {
      newGreeting = 'Good Morning! 🌅';
    } else if (hour < 17) {
      newGreeting = 'Good Afternoon! ☀️';
    } else {
      newGreeting = 'Good Evening! 🌙';
    }
    
    _greeting.value = newGreeting;
  }

  void _startGreetingTimer() {
    _greetingTimer = Timer.periodic(_greetingUpdateInterval, (_) {
      _updateGreeting();
    });
  }

  void changeIndex(int index) {
    currentIndex.value = index;
  }
}

