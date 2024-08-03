import 'package:flutter/material.dart';
import 'package:physio_digital/services/auth/auth_service.dart';

class LogoutButton extends StatelessWidget {
  LogoutButton({Key? key}) : super(key: key);

  void logout() {
    try {
      final AuthService _auth = AuthService();
      _auth.signOut();
    } catch (e) {
      // Handle errors here
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton.icon(
        onPressed: logout,
        icon: GestureDetector(child: const Icon(Icons.logout, color: Colors.red)),
        label: const Text(
          'Log out',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
