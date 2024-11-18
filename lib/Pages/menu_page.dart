import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<UserModel> userList = [];

  // Function to fetch the API data
  Future<void> getUserApi() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        userList = data.map<UserModel>((item) => UserModel.fromJson(item)).toList();
      });
    } else {
      // Handle error if API request fails
      print('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    getUserApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[200],
        title: Text('Menu Page'),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: getUserApi(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
                  return ListView.builder(
                    itemCount: userList.length,
                    itemBuilder: (context, index) {
                      final user = userList[index];
                      return ListTile(
                        leading: Image.network(user.imageUrl, width: 50, height: 50, fit: BoxFit.cover),
                        title: Text(user.title),
                        subtitle: Text('\$${user.price.toString()}'),
                        onTap: () {
                          // Handle item tap if needed
                        },
                      );
                    },
                  );
                } else {
                  return Center(child: Text('Failed to load data'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class UserModel {
  final String title;
  final String imageUrl;
  final double price;

  UserModel({required this.title, required this.imageUrl, required this.price});

  // Factory method to convert JSON data to UserModel
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      title: json['title'] ?? 'No Title',
      imageUrl: json['image'] ?? '',
      price: json['price']?.toDouble() ?? 0.0,
    );
  }
}
