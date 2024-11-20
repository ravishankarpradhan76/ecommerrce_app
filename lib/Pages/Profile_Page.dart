import 'package:flutter/material.dart';

import '../Widgets/round_option.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 56, // Adjust the height to fit inside AppBar
            width: double.infinity, // Take full width
            color: Colors.teal,
            child: Center( // Centering the text inside the Container
              child: Text(
                'Ravi Shankar Pradhan',
                style: TextStyle(
                  fontSize: 18, // Adjust font size for better appearance
                  color: Colors.white, // Text color
                ),
              ),
            ),
          ),
        ),
        backgroundColor: Colors.teal[200],
      ),

    );
  }
}