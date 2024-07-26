import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/auth/login_or_signup.dart';
import 'package:physio_digital/view/components/my_button.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  void goToSignUp() {
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
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  height: 80.0,
                ),
                const SizedBox(height: 300.0),
                const Text(
                  'Welcome to PhysioDigital',
                  style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
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
