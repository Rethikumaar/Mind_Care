import 'package:flutter/material.dart';
import 'package:mindcare/patient_dashboard.dart';
import 'bottom_nav_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MindCare',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: PatientDashboard(), // Load the bottom navigation bar
    );
  }
}
