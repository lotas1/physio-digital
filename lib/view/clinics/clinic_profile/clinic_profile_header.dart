import 'package:flutter/material.dart';

class ClinicProfileHeader extends StatelessWidget {
  const ClinicProfileHeader({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0),
      child: Stack(

        children: [
          // Background image
          Image.asset(
            'assets/images/onboard.jpg',
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
          ),
          // Overlay to darken the image
          Container(
            width: double.infinity,
            height: 200,
            color: const Color.fromARGB(255, 18, 20, 34).withOpacity(0.7),
          ),
          // Back arrow
          Positioned(
            top: 16,
            left: 16,
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 24,
              ),
            ),
          ),
          // Profile info
          Positioned(
            bottom: 16,
            left: 16,
            child: Row(
              children: [
                // Profile image
                Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    image: DecorationImage(
                      image: AssetImage(
                          'assets/images/clinic_logo.jpeg'), // Make sure this image exists in your assets
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Profile name
                const Text(
                  'Dr Felix clinic Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
