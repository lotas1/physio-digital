import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final IconData? icon;  

  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(15.0),
        margin: const EdgeInsets.symmetric(horizontal: 25),

        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,  // Ensure the Row takes only the space needed
            children: <Widget>[
              if (icon != null)  // Check if an icon is provided
                Padding(
                  padding: const EdgeInsets.only(right: 8.0), // Add some space between icon and text
                  child: Icon(
                    icon,
                    color: Colors.white,
                  ),
                ),
              Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
