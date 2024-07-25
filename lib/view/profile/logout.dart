import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextButton.icon(
        onPressed: () {
          print('logout');
        },
        icon: const Icon(Icons.logout, color: Colors.red),
        label: const Text(
          'Log out',
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}
