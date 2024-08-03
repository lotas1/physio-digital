import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:physio_digital/services/auth/auth_service.dart';
import 'package:physio_digital/view/components/alert_dialog.dart';
import 'package:physio_digital/view/components/my_button.dart';
import 'package:physio_digital/view/components/my_text_field.dart';

class SignUpPage extends StatefulWidget {
  final void Function()? onTap;

  const SignUpPage({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;

  void signUp(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    final _auth = AuthService();

    if (_passwordController.text == _confirmPasswordController.text) {
      try {
        await _auth.signUpWithEmailPassword(
          _emailController.text,
          _passwordController.text,
        );
        // Show success dialog
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ElegantAlertDialog(
              title: 'Success',
              message: 'Your account has been created successfully!',
              onConfirm: () {
                // Navigate to login page or perform any other action
                // Navigator.of(context).pop(); // Close the dialog
                // widget.onTap?.call(); // Navigate to login page
              },
            );
          },
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return ElegantAlertDialog(
              title: 'Error',
              message: e.toString(),
              onConfirm: () {
                // Navigator.of(context).pop(); // Close the dialog
              },
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return ElegantAlertDialog(
            title: 'Password Mismatch',
            message: 'The passwords you entered do not match. Please try again.',
            onConfirm: () {
              // Navigator.of(context).pop(); // Close the dialog
            },
          );
        },
      );
    }

    setState(() {
      _isLoading = false;
    });
  }

  void google() {
    // Implement Google sign-up logic here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 50.0),
            const Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                'Sign Up',
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
            MyTextField(
              controller: _confirmPasswordController,
              hintText: 'Confirm Password',
              obscureText: true,
            ),
            const SizedBox(height: 16.0),
            MyButton(
              text: 'Sign Up',
              onTap: () => signUp(context),
              isLoading: _isLoading,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account? ',
                  style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    'Log in',
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
              text: 'SignUp with Google',
              icon: FontAwesomeIcons.google,
              onTap: google,
              isLoading: false,
            )
          ],
        ),
      ),
    );
  }
}