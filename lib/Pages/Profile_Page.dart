import 'package:flutter/material.dart';
import 'dart:math'; // For rotation if needed

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextStyle titleStyle = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.bold,
    color: Colors.black87,
    letterSpacing: 0.1,
  );

  Widget buildDivider() {
    return Divider(
      color: Colors.black12,
      thickness: 1.1,
    );
  }

  Widget buildProfileRow(String asset, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Image.asset(asset, height: 15, width: 15),
          SizedBox(width: 15),
          Text(text, style: titleStyle),
          Spacer(),
          Icon(Icons.arrow_forward_ios_rounded, size: 16),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(
                  'https://i.pinimg.com/736x/cb/f1/0a/cbf10ab63c7b9d973dcbd02f7778bf70.jpg'),
            ),
            Text(
              'Ravi Shankar Pradhan',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, letterSpacing: 0.1),
            ),
            Text(
              'ravishankarpradhan76@gmail.com',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
                letterSpacing: 0.2,
              ),
            ),
            SizedBox(height: 25),
            buildProfileRow('assets/user.png', 'My Profile'),
            buildDivider(),
            buildProfileRow('assets/marker.png', 'My Address'),
            buildDivider(),
            buildProfileRow('assets/shopping-bag.png', 'My Orders'),
            buildDivider(),
            buildProfileRow('assets/credit-card.png', 'My Cards'),
            buildDivider(),
            buildProfileRow('assets/settings.png', 'Settings'),
            buildDivider(),
            buildProfileRow('assets/sign-out-alt.png', 'Log Out'),
            buildDivider(),
          ],
        ),
      ),
    );
  }
}
