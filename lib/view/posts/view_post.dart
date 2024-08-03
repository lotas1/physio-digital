import 'package:flutter/material.dart';
import 'package:photo_view/photo_view.dart';

class ViewArticlePage extends StatelessWidget {
  final Map<String, dynamic> post;

  const ViewArticlePage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(26, 53, 75, 217),
        centerTitle: true,
        title: const Text(
          'Blog',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(context),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildCategory(),
                  const SizedBox(height: 10),
                  _buildTitle(),
                  const SizedBox(height: 10),
                  _buildDate(),
                  const SizedBox(height: 15),
                  _buildContent(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return GestureDetector(
      onTap: () => _showFullScreenImage(context),
      child: Hero(
        tag: 'articleImage',
        child: Image.network(
          post['imageUrl'] ?? 'https://via.placeholder.com/400x200',
          fit: BoxFit.cover,
          height: 200,
          width: double.infinity,
        ),
      ),
    );
  }

  Widget _buildCategory() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(
        post['category'] ?? 'Uncategorized',
        style: TextStyle(
          color: Colors.blue[700],
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildTitle() {
    return Text(
      post['title'] ?? 'Untitled',
      style: const TextStyle(
        color: Color(0xFF101828),
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _buildDate() {
    return Row(
      children: [
        const Icon(Icons.calendar_today, size: 14, color: Colors.grey),
        const SizedBox(width: 4),
        Text(
          post['date'] ?? 'No date',
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildContent() {
    return Text(
      '''
Stretching is a fundamental aspect of physical fitness and wellness that often goes underappreciated. Recent studies have shown that regular stretching can not only improve flexibility and range of motion but also increase one's tolerance for pain. This finding has significant implications for individuals dealing with chronic pain conditions, athletes looking to enhance their performance, and anyone seeking to improve their overall physical well-being.

The Science Behind Stretching and Pain Tolerance

Research conducted at the University of Colorado Boulder has shed light on the relationship between stretching and pain perception. The study, published in the Journal of Physiology, found that consistent stretching over time can lead to a decrease in pain sensitivity. This phenomenon is attributed to several factors:

1. Neuroplasticity: Regular stretching can actually change how the brain and nervous system process pain signals. Over time, the nervous system becomes less reactive to the discomfort associated with stretching, effectively raising one's pain threshold.

2. Improved Blood Flow: Stretching increases blood circulation to muscles and joints. Better blood flow means more oxygen and nutrients are delivered to these areas, potentially reducing inflammation and associated pain.

3. Release of Endorphins: Like other forms of exercise, stretching can trigger the release of endorphins, the body's natural pain-relieving chemicals. These endorphins not only help reduce the perception of pain but also contribute to an overall sense of well-being.

4. Muscle Tension Reduction: Chronic muscle tension can be a source of pain for many individuals. Regular stretching helps to relax tense muscles, potentially alleviating pain caused by muscle tightness.

Implementing an Effective Stretching Routine

To reap the pain-tolerance benefits of stretching, consistency is key. Here are some tips for incorporating an effective stretching routine into your daily life:

• Start Slowly: If you're new to stretching, begin with gentle, short stretches and gradually increase the duration and intensity over time.

• Focus on Major Muscle Groups: Pay attention to areas like the back, shoulders, hips, and legs. These large muscle groups often contribute significantly to overall flexibility and pain perception.

• Hold Stretches: For static stretching, hold each position for 15-30 seconds. This allows time for the muscle to relax and extend.

• Breathe Deeply: Proper breathing helps relax the body and increases the effectiveness of stretches. Inhale deeply and exhale slowly as you stretch.

• Stretch Regularly: Aim to stretch at least 3-5 times a week, if not daily, for optimal results.

• Warm Up First: Light activity before stretching can help warm up muscles, making them more pliable and less prone to injury.

Benefits Beyond Pain Tolerance

While the focus of recent research has been on pain tolerance, the benefits of regular stretching extend far beyond this aspect:

1. Improved Posture: Stretching can help correct muscle imbalances that lead to poor posture, potentially reducing chronic pain associated with postural issues.

2. Enhanced Athletic Performance: Greater flexibility can lead to improved performance in various sports and physical activities.

3. Stress Reduction: The meditative aspects of stretching, combined with deep breathing, can help reduce stress and promote relaxation.

4. Better Range of Motion: Increased flexibility translates to a better range of motion in joints, which can make daily activities easier and reduce the risk of injury.

5. Improved Circulation: Enhanced blood flow from stretching can contribute to better overall health and faster recovery from exercise.

Precautions and Considerations

While stretching offers numerous benefits, it's important to approach it mindfully:

• Avoid Overstretching: Pushing too hard can lead to injury. Stretch to the point of mild tension, not pain.

• Consult a Professional: If you have existing injuries or chronic conditions, consult with a healthcare provider or physical therapist before starting a new stretching routine.

• Stay Consistent: The benefits of stretching, including increased pain tolerance, come with regular practice over time. Don't expect immediate results.

• Listen to Your Body: If a particular stretch causes sharp pain or discomfort, back off and try a gentler approach.

Conclusion

The discovery that stretching can increase pain tolerance adds another compelling reason to incorporate regular stretching into our daily routines. Whether you're an athlete looking to push your limits, someone dealing with chronic pain, or simply aiming to improve your overall health and flexibility, a consistent stretching practice can yield significant benefits. As with any fitness regimen, the key lies in patience, consistency, and listening to your body. Start small, stay committed, and you may find that the simple act of stretching not only makes you more flexible but also more resilient to life's physical challenges.

Remember, while stretching can be a powerful tool for managing and increasing tolerance to pain, it should be part of a comprehensive approach to health and wellness. Always consult with healthcare professionals for persistent pain issues and to develop a stretching routine that's tailored to your individual needs and conditions.
      ''',
      style: const TextStyle(fontSize: 16, height: 1.6),
    );
  }

  void _showFullScreenImage(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Scaffold(
        body: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Center(
            child: Hero(
              tag: 'articleImage',
              child: PhotoView(
                imageProvider: NetworkImage(post['imageUrl'] ?? 'https://via.placeholder.com/400x200'),
                minScale: PhotoViewComputedScale.contained,
                maxScale: PhotoViewComputedScale.covered * 2,
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
