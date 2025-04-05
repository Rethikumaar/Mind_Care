import 'package:flutter/material.dart';

class PriceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Simple Pricing')),
      backgroundColor: Colors.blue,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            PricingCard(
              title: "Basic",
              price: "Free",
              features: [
                "Basic mental health assessments",
                "Personal progress tracking",
                "Educational resources",
                "Community support"
              ],
              buttonText: "Choose Basic",
              buttonColor: Colors.black,
              textColor: Colors.white,
            ),
            SizedBox(height: 20),
            PricingCard(
              title: "Professional",
              price: "\$49/month",
              features: [
                "Advanced assessment tools",
                "Priority appointment booking",
                "Detailed analytics",
                "Telehealth integration",
                "24/7 support"
              ],
              buttonText: "Choose Professional",
              buttonColor: Colors.black,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class PricingCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> features;
  final String buttonText;
  final Color buttonColor;
  final Color textColor;

  PricingCard({
    required this.title,
    required this.price,
    required this.features,
    required this.buttonText,
    required this.buttonColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 5),
            Text(price,
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: features
                  .map((feature) => Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Row(
                          children: [
                            Icon(Icons.check, color: Colors.green),
                            SizedBox(width: 8),
                            Expanded(
                                child: Text(feature,
                                    style: TextStyle(fontSize: 16))),
                          ],
                        ),
                      ))
                  .toList(),
            ),
            SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: buttonColor,
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                child: Text(buttonText,
                    style: TextStyle(fontSize: 18, color: textColor)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
