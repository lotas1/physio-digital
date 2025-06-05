import 'package:flutter/material.dart';
import 'package:physio_digital/view/notification/notification_card.dart';

class ListNotifications extends StatelessWidget {
  const ListNotifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Notifications'),
      ),
      body: const Column(
        children: [
          NotificationCard(
            icon: Icons.notifications,
            title: 'New Update',
            subtitle: 'We have new app update',
            time: '1hr ago',
          ),
          NotificationCard(
            icon: Icons.notifications,
            title: 'New Feature',
            subtitle: 'Check out our new feature',
            time: '2hr ago',
          ),
        ],
      ),
    );
  }
}


