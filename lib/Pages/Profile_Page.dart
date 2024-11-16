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
      appBar:AppBar(
          backgroundColor: Colors.teal[200],
          title: Text('E-commerce'),
          toolbarHeight: 80,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 12),
              child: Row(
                children: [
                  Icon(Icons.settings_outlined),
                  SizedBox(width: 20),
                  Icon(Icons.notifications_none),
                  SizedBox(width: 20),
                  Icon(Icons.search),
                ],
              ),
            ),
          ],
        ),
      body: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 17,
                backgroundColor: Colors.black12,
                child: Center(child: Icon(Icons.person_outline_outlined,color: Colors.white60,)),
              ),
              SizedBox(width: 5,),
              Text('Hello, ravi',style: TextStyle(fontSize: 16),),
              Icon(Icons.keyboard_arrow_down),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundOption(title: 'Orders',),
                RoundOption(title: 'Lists',),
                RoundOption(title: 'Account',),
                RoundOption(title: 'Buy Again',),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
