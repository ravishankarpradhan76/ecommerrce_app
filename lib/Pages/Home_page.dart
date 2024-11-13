import 'package:ecommerrce_app/Modals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'product_Details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Modals> postList = [];
  List<Modals> filteredPostList = []; // Filtered list to show after search
  TextEditingController searchController = TextEditingController(); // Search controller

  // Method to fetch data from API
  Future<List<Modals>> getUserApi() async {
    final response =
    await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      postList.clear();
      for (Map i in data) {
        postList.add(Modals.fromJson(i));
      }
      setState(() {
        filteredPostList = postList; // Initially show all products
      });
      return postList;
    } else {
      return postList;
    }
  }

  // Method to filter products based on search query
  void filterProducts(String query) {
    // If the search query is empty, show all products
    if (query.isEmpty) {
      setState(() {
        filteredPostList = postList; // Show all products when search is empty
      });
    } else {
      List<Modals> filteredList = postList.where((product) {
        return product.title!.toLowerCase().contains(query.toLowerCase());
      }).toList();

      setState(() {
        filteredPostList = filteredList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: searchController,
              onChanged: (query) {
                filterProducts(query); // Call filter on every text change
              },
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search your product',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
                future: getUserApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    return ListView.builder(
                        itemCount: filteredPostList.length, // Use filtered list here
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: 330,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              filteredPostList[index]
                                                  .image
                                                  .toString()),
                                          fit: BoxFit.fill, // Adjust the image to cover the container
                                        ),
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                    ),
                                    SizedBox(height: 15),
                                    Column(
                                      children: [
                                        Text(filteredPostList[index]
                                            .title
                                            .toString()),
                                        Row(
                                          children: [
                                            Text(
                                              'Price  =  ',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            Text(filteredPostList[index]
                                                .price
                                                .toString()),
                                            SizedBox(width: 110),
                                            GestureDetector(
                                              onTap: () {
                                                // Open ProductDetailPage when tapped
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductDetails(
                                                          product:
                                                          filteredPostList[
                                                          index], // Pass selected product data
                                                        ),
                                                  ),
                                                );
                                              },
                                              child: Container(
                                                height: 40,
                                                width: 100,
                                                child: Center(
                                                  child: Text(
                                                    'Add to cart',
                                                    style: TextStyle(
                                                        color: Colors.white),
                                                  ),
                                                ),
                                                decoration: BoxDecoration(
                                                  color: Colors.green,
                                                  borderRadius:
                                                  BorderRadius.circular(12),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        });
                  }
                }),
          ),
        ],
      ),
    );
  }
}
