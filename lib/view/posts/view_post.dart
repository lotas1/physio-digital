import 'package:flutter/material.dart';

class ViewArticlePage extends StatelessWidget {
  const ViewArticlePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(26, 53, 75, 217),
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            'Blog',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextButton(
              onPressed: null,
              style: TextButton.styleFrom(
                backgroundColor: const Color.fromARGB(36, 53, 75, 217),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                ),
              ),
              child: const Text(
                "News",
                style: TextStyle(
                  color: Color(0xFF354AD9),
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: null,
              style: TextButton.styleFrom(
                  padding: const EdgeInsets.all(0),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero)),
              child: const Text(
                "Stretching can increase your tolerance for pain",
                style: TextStyle(
                  color: Color(0xFF101828),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: 15,
                ),
                Padding(padding: EdgeInsets.only(left: 5)),
                Text(
                  "Feb 22, 2024",
                  style: TextStyle(fontSize: 13),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: const DecorationImage(
                  image: AssetImage("assets/images/onboard.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Expanded(
              child: Text(
                'Your long article text goes here. It should be long enough to require scrolling. '
                'This text will be scrollable and will be positioned under the image. '
                'Continue adding more text to simulate a long article. '
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. '
                'Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. '
                'Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. '
                'Mauris massa. Vestibulum lacinia arcu eget nulla. '
                'Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. '
                'Curabitur sodales ligula in libero. Sed dignissim lacinia nunc. Curabitur tortor.'
                'Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. '
                'Maecenas mattis. Sed convallis tristique sem. Proin ut ligula vel nunc egestas porttitor. '
                'Morbi lectus risus, iaculis vel, suscipit quis, luctus non, massa. '
                'Fusce ac turpis quis ligula lacinia aliquet. Mauris ipsum. '
                'Nulla metus metus, ullamcorper vel, tincidunt sed, euismod in, nibh. '
                'Quisque volutpat condimentum velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, '
                'per inceptos himenaeos. Nam nec ante. Sed lacinia, urna non tincidunt mattis, tortor neque adipiscing diam, '
                'a cursus ipsum ante quis turpis. Nulla facilisi. '
                'Ut fringilla. Suspendisse potenti. Nunc feugiat mi a tellus consequat imperdiet. '
                'Vestibulum sapien. Proin quam. Etiam ultrices. '
                'Suspendisse in justo eu magna luctus suscipit. '
                'Sed lectus. Integer euismod lacus luctus magna. '
                'Quisque cursus, metus vitae pharetra auctor, sem massa mattis sem, at interdum magna augue eget diam. '
                'Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; '
                'Morbi lacinia molestie dui. Praesent blandit dolor. Sed non quam. '
                'In vel mi sit amet augue congue elementum. Morbi in ipsum sit amet pede facilisis laoreet. '
                'Donec lacus nunc, viverra nec, blandit vel, egestas et, augue. '
                'Vestibulum tincidunt malesuada tellus. Ut ultrices ultrices enim. '
                'Curabitur sit amet mauris. Morbi in dui quis est pulvinar ullamcorper. '
                'Nulla facilisi. Integer lacinia sollicitudin massa. Cras metus. '
                'Sed aliquet risus a tortor. Integer id quam. '
                'Morbi mi. Quisque nisl felis, venenatis tristique, dignissim in, ultrices sit amet, augue. '
                'Proin sodales libero eget ante. Nulla quam. Aenean laoreet. '
                'Vestibulum nisi lectus, commodo ac, facilisis ac, ultricies eu, pede. '
                'Ut orci risus, accumsan porttitor, cursus quis, aliquet eget, justo. '
                'Sed pretium blandit orci. Ut eu diam at pede suscipit sodales.',
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
