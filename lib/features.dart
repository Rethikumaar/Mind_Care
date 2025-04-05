import 'package:flutter/material.dart';

class FeaturesScreen extends StatelessWidget {
  final List<Feature> features = [
    Feature(
      icon: Icons.psychology,
      title: 'Mental Health Assessment',
      description:
          'Access validated screening tools including PHQ-9 for depression and anxiety assessments.',
    ),
    Feature(
      icon: Icons.groups,
      title: 'Connect with Professionals',
      description:
          'Find and connect with qualified mental health professionals in your area.',
    ),
    Feature(
      icon: Icons.security,
      title: 'Secure & Private',
      description:
          'Your data is protected with enterprise-grade security and encryption.',
    ),
    Feature(
      icon: Icons.favorite,
      title: 'Continuous Support',
      description:
          'Track your progress and receive ongoing support through your wellness journey.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Text(
          'Powerful Features',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.builder(
          itemCount: features.length,
          itemBuilder: (context, index) {
            return FeatureCard(feature: features[index]);
          },
        ),
      ),
    );
  }
}

class Feature {
  final IconData icon;
  final String title;
  final String description;

  Feature({required this.icon, required this.title, required this.description});
}

class FeatureCard extends StatelessWidget {
  final Feature feature;

  const FeatureCard({required this.feature});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(feature.icon, size: 40, color: Colors.blue),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    feature.title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    feature.description,
                    style: TextStyle(fontSize: 14, color: Colors.black87),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
