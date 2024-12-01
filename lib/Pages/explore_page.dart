import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  List<dynamic> products = [];

  Future<void> getUserApi() async {
    final response = await get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
    if (response.statusCode == 200) {
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
    getUserApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Explore',
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          Row(
            children: [
              Icon(Icons.search),
              SizedBox(width: 15),
              Icon(Icons.mic),
              SizedBox(width: 15),
              Icon(Icons.camera_alt_sharp),
              SizedBox(width: 15),
              Stack(
                children: [
                  Icon(Icons.shopping_cart),
                  Positioned(
                    top: 2,
                    right: 2,
                    child: CircleAvatar(
                      radius: 5,
                      backgroundColor: Colors.red,
                      child: Text(
                        '5',
                        style: TextStyle(color: Colors.white, fontSize: 6),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: 13),
            ],
          )
        ],
      ),
      body: products.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 8,
                crossAxisSpacing: 2,
                childAspectRatio: 1,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                var product = products[index];
                return Card(
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: BorderSide(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 100,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(product['image'] ?? 'https://via.placeholder.com/150'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      SizedBox(height: 5),
                      Text(
                        product['title'] ?? 'No title available',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        '\$${product['price'] ?? 0}',
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
