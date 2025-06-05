import 'package:flutter/material.dart';

class ViewNotification extends StatelessWidget {
  const ViewNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Title(
          color: Colors.black,
          child: const Text('Message'),
        ),
      ),
      body: const Column(
        children: [
              SizedBox(height: 15),
          Row(
            children: [
              SizedBox(width: 5),
              Text("New Update", style: TextStyle(
                color: Colors.black,
                fontSize: 17,
              ),),
              Spacer(),
              Text('1hr ago'),
              SizedBox(width: 5),
            ],
          ),
              SizedBox(height: 15),
          Expanded(
            
            child: Padding(
              padding: EdgeInsets.all(15),
              child: Text(
                  'Your long article text goes here. It should be long enough to require scrolling. '
                  'This text will be scrollable and will be positioned under the image. '
                  'Continue adding more text to simulate a long article. '
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. '
                  'Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. '),
            ),
          )
        ],
      ),
    );
  }
}
