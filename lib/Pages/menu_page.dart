import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // List to hold product data
  List<dynamic> products = [];

  Future<void> getUserApi() async {
  final response = await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
    if (response.statusCode == 200) {
      // Decode and assign the data to the products list
      setState(() {
        products = jsonDecode(response.body.toString());
      });
    } else {
      print('Failed to load data');
    }
  }

  @override
  void initState() {
    super.initState();
    getUserApi();  // Fetch data when the page is initialized
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            decoration: InputDecoration(
              hintText: 'Search or ask a questi...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
                ),
              filled: true,
              fillColor: Colors.white
            ),
          ),
        ),
        actions: [ Icon(Icons.qr_code_2_sharp),],
        backgroundColor: Colors.teal[200],

      ),
      body: products.isEmpty?
      Center(child: CircularProgressIndicator()):
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder( gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 items per row
            crossAxisSpacing: 5, // Spacing between columns
            mainAxisSpacing: 5, // Spacing between rows
            childAspectRatio: 1,),
          itemCount: products.length,
          itemBuilder: (context, index) {
            var product = products[index];
            return Card(
                elevation: 1,
                shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10), // Rounded corners
            side: BorderSide(
            color: Colors.teal, // Outline color
            width: 1, // Outline width
            ),
            ),

              child: ListTile(
                title: Column(
                  children: [
                    Text(product['title'].toString()),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
