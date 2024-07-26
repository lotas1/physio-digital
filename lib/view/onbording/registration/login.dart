import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:physio_digital/auth/auth_service.dart';
import 'package:physio_digital/view/components/my_button.dart';
import 'package:physio_digital/view/components/my_text_field.dart';

class LoginPage extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // go to sign up page
  final void Function()? onTap;

  LoginPage({
    super.key,
    required this.onTap,
  });

  void login(BuildContext context) async {
    // auth service
    final authService = AuthService();

    //try login
    try {
      await authService.SignInWithEmailPassword(
          _emailController.text, _passwordController.text);
    }

    // catch any errors
    catch (e) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('invalid email or password'),
        ),
      );
    }
  }

  void google() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50.0),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'LogIn',
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            const SizedBox(height: 100.0),
            MyTextField(
              controller: _emailController,
              hintText: 'Enter your Email',
              obscureText: false,
            ),
            const SizedBox(height: 16.0),
            MyTextField(
              controller: _passwordController,
              hintText: 'Enter Password',
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            MyButton(
              text: 'LogIn',
              onTap: () => login(context),
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member? ',
                  style:
                      TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                GestureDetector(
                  onTap: onTap,
                  child: Text(
                    'SignUp Now',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16.0),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    '__________________',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 0.3,
                      height: 1.4,
                      textBaseline: TextBaseline.alphabetic,
                      decoration: TextDecoration.none,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Text(
                    'or',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    '__________________',
                    style: TextStyle(
                      color: Colors.grey,
                      letterSpacing: 0.3,
                      height: 1.4,
                      textBaseline: TextBaseline.alphabetic,
                      decoration: TextDecoration.none,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16.0),
            MyButton(
                text: 'LogIn with Google',
                icon: FontAwesomeIcons.google,
                onTap: google)
          ],
        ),
      ),
    );
  }
}
