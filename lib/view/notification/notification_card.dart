import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:physio_digital/view/notification/view_notification.dart';

class NotificationCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final String time;

  const NotificationCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.time,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    try {
      return InkWell(
        onTap: () {
          Get.to(const ViewNotification());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Tapped on $title')),
          );
        },
        child: Card(
          child: ListTile(
            leading: Icon(icon),
            title: Text(
              title,
              style: const TextStyle(
                color: Colors.black,
              ),
            ),
            subtitle: Text(subtitle),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(time),
              ],
            ),
          ),
        ),
      );
    } catch (e) {
      return const Scaffold(
        body: Center(
          child: Text('An error occurred'),
        ),
      );
    }
  }
}
