import 'package:flutter/material.dart';
import 'home.dart';
import 'features.dart';
import 'price.dart';
import 'Testimonial.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    FeaturesScreen(),
    PriceScreen(),
    TestimonialScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Features'),
          BottomNavigationBarItem(
              icon: Icon(Icons.attach_money), label: 'Pricing'),
          BottomNavigationBarItem(
              icon: Icon(Icons.reviews), label: 'Testimonials'),
        ],
      ),
    );
  }
}
