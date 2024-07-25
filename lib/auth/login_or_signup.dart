import 'package:flutter/material.dart';
import 'package:physio_digital/view/onbording/registration/login.dart';
import 'package:physio_digital/view/onbording/registration/sign_up.dart';

class LoginOrSignup extends StatefulWidget {
  const LoginOrSignup({super.key});

  @override
  State<LoginOrSignup> createState() => _LoginOrSignupState();
}

class _LoginOrSignupState extends State<LoginOrSignup> {
  //initially show the login page
  bool showLoginPage = true;

  //toggle between login and sign up page
  void togglePage() {
    setState(() {
      showLoginPage = !showLoginPage;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showLoginPage) {
      return LoginPage( onTap: togglePage,);
    } else {
      return SignUpPage(onTap: togglePage,);
    }
  }
}
