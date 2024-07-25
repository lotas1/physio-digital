import 'package:flutter/material.dart';
import 'package:physio_digital/models/products/product_model.dart';
import 'package:url_launcher/url_launcher.dart';

class BuyNowButton extends StatelessWidget {
  final Product product;

  const BuyNowButton({super.key, required this.product});

  void _launchWhatsApp(BuildContext context) async {
    final Uri whatsappUrl = Uri.parse(
      "https://wa.me/whatsappphonenumber/?text="
      "Product: ${product.name}\n"
      "Price: \$${product.price}\n"
      "Details: ${product.details}\n"
      "Image: ${product.imageUrl}",
    );
    
    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Could not launch WhatsApp")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () => _launchWhatsApp(context),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF354AD9) ,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          padding:const EdgeInsets.symmetric(vertical: 16.0),
        ),
        child: const Text(
          'Buy Now',
          style: TextStyle(fontSize: 16.0, color: Colors.white),
        ),
      ),
    );
  }
}
