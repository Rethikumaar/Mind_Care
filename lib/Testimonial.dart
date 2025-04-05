import 'package:flutter/material.dart';

class TestimonialScreen extends StatelessWidget {
  final List<Map<String, String>> testimonials = [
    {
      "quote":
          "This platform has transformed how we deliver mental health care to our patients.",
      "name": "Dr. Sarah Johnson",
      "title": "Clinical Psychologist"
    },
    {
      "quote":
          "The assessment tools and tracking features have made a real difference in my practice.",
      "name": "Dr. Michael Chen",
      "title": "Psychiatrist"
    },
    {
      "quote":
          "MindCare’s scheduling system is a game changer! I can manage appointments effortlessly.",
      "name": "Dr. Emily Davis",
      "title": "Therapist"
    },
    {
      "quote":
          "The integration of analytics has helped me track patient progress better than ever.",
      "name": "Dr. Robert Wilson",
      "title": "Mental Health Specialist"
    },
    {
      "quote":
          "The patient engagement tools have significantly improved client interactions in my clinic.",
      "name": "Dr. Lisa Carter",
      "title": "Licensed Counselor"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Testimonials"),
        backgroundColor: Colors.blue,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              "What Professionals Say",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
              itemCount: testimonials.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: TestimonialCard(
                    quote: testimonials[index]["quote"]!,
                    name: testimonials[index]["name"]!,
                    title: testimonials[index]["title"]!,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final String quote;
  final String name;
  final String title;

  TestimonialCard({
    required this.quote,
    required this.name,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '"$quote"',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
            SizedBox(height: 10),
            Text(
              name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
