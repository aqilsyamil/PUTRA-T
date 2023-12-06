import 'package:flutter/material.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Navigation',
          style: TextStyle(
            color: Colors.white, // Set the title font color to white
            fontWeight: FontWeight.bold, // Set the title font weight to bold
          ),
        ),
        backgroundColor: Color(0xFF13E573), // Set the background color of the AppBar
      ),
      body: Center(
        child: Text('Navigation Page'),
      ),
    );
  }
}
