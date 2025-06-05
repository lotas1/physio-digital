import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/services/auth/login_or_signup.dart';
import 'package:physio_digital/view/components/my_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  void goToSignUp() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasCompletedOnboarding', true);
    Get.to(const LoginOrSignup());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/onboard.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withValues(alpha: .5),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to Physio Digital',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  'Connect with a therapist today',
                  style: TextStyle(fontSize: 16.0, color: Colors.white),
                ),
                const SizedBox(height: 32.0),
                MyButton(text: 'Get Started', onTap: goToSignUp),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
