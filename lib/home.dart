import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F7FE), // Light blue background
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.health_and_safety, color: Colors.blue), // MindCare Logo
            SizedBox(width: 8),
            Text(
              'MindCare',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              'Login',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Transform Mental Healthcare\nManagement',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Streamline your mental health practice with our comprehensive platform. '
                      'Manage assessments, appointments, and patient care all in one place.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.black87),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                          ),
                          onPressed: () {},
                          child: Row(
                            children: [
                              Text('Get Started',
                                  style: TextStyle(fontSize: 16)),
                              SizedBox(width: 5),
                              Icon(Icons.arrow_right_alt),
                            ],
                          ),
                        ),
                        SizedBox(width: 12),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15),
                            side: BorderSide(color: Colors.black),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Take Assessment',
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Footer(), // Footer at the bottom
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF111827), // Dark background color
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "MindCare",
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Transforming mental healthcare\nmanagement for professionals\nand patients.",
            style: TextStyle(color: Colors.white70),
          ),
          Divider(color: Colors.white24, thickness: 1, height: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FooterSection(title: "Product", links: ["Features", "Pricing"]),
              SizedBox(height: 15),
              FooterSection(title: "Company", links: ["About", "Contact"]),
              SizedBox(height: 15),
              FooterSection(title: "Legal", links: ["Privacy", "Terms"]),
            ],
          ),
          SizedBox(height: 15),
          Center(
            child: Text(
              "© 2024 MindCare. All rights reserved.",
              style: TextStyle(color: Colors.white54, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  final String title;
  final List<String> links;

  FooterSection({required this.title, required this.links});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: links.map((link) => FooterLink(text: link)).toList(),
        ),
      ],
    );
  }
}

class FooterLink extends StatelessWidget {
  final String text;

  FooterLink({required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: GestureDetector(
        onTap: () {}, // Add navigation if needed
        child: Text(
          text,
          style: TextStyle(color: Colors.white70, fontSize: 14),
        ),
      ),
    );
  }
}
