import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:physio_digital/services/auth/auth_service.dart';
import 'package:physio_digital/view/components/alert_dialog.dart';
import 'package:physio_digital/view/components/my_button.dart';
import 'package:physio_digital/view/components/my_text_field.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;

  const LoginPage({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isLoading = false;

  void login(BuildContext context) async {
    setState(() {
      _isLoading = true;
    });

    final authService = AuthService();

    try {
      await authService.SignInWithEmailPassword(
          _emailController.text, _passwordController.text);
      // The AuthService should handle navigation after successful login
      // If it doesn't, you can add navigation logic here
      // For example:
      // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return ElegantAlertDialog(
            title: 'Login Failed',
            message: 'Invalid email or password. Please try again.',
            onConfirm: () {
              // Navigator.of(context).pop(); // Close the dialog
            },
          );
        },
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void google() {
    // Implement Google sign-in logic here
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
              isLoading: _isLoading,
            ),
            const SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Not a member? ',
                  style: TextStyle(color: Theme.of(context).colorScheme.secondary),
                ),
                GestureDetector(
                  onTap: widget.onTap,
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
              onTap: google,
              isLoading: false,
            )
          ],
        ),
      ),
    );
  }
}