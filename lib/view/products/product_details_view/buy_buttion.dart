import 'package:flutter/material.dart';
import 'package:physio_digital/model/product/product.dart';
import 'package:physio_digital/view/components/my_button.dart';
import 'package:url_launcher/url_launcher.dart';

class BuyNowButton extends StatelessWidget {
  final Product product;

  const BuyNowButton({Key? key, required this.product}) : super(key: key);

  Future<void> _launchWhatsApp(BuildContext context) async {
    final String whatsappUrl = "https://wa.me/+2349032543740/?text=" +
        Uri.encodeComponent(
          "Product: ${product.name}\n"
              "Price: ₦${product.price}\n"
              "Details: ${product.details}\n"
              "Image: ${product.images.isNotEmpty ? product.images.first : 'No image available'}",
        );

    final Uri uri = Uri.parse(whatsappUrl);

    try {
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        throw 'Could not launch WhatsApp';
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: MyButton(
        text: 'Buy Now',
        onTap: () => _launchWhatsApp(context),
      ),
    );
  }
}