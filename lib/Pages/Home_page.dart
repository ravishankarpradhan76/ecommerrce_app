import 'package:ecommerrce_app/Modals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Cart_page.dart';
import 'product_Details.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Modals> postList = [];
  List<Modals> cartItems = []; // To store added items to the cart
  Set<int> addedItemIndexes = {}; // Set to keep track of added items by index

  // Method to fetch data from API
  Future<List<Modals>> getUserApi() async {
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));
    var data = jsonDecode(response.body.toString());

    if (response.statusCode == 200) {
      postList.clear();
      for (Map i in data) {
        postList.add(Modals.fromJson(i));
      }
      return postList;
    } else {
      return postList;
    }
  }

  // Method to add item to cart
  void addToCart(Modals product, int index) {
    setState(() {
      cartItems.add(product); // Add the product to the cart list
      addedItemIndexes.add(index); // Track the added item by its index
    });
  }

  // Method to check if item is already in cart
  bool isItemInCart(int index) {
    return addedItemIndexes.contains(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CartPage(cartItems: cartItems), // Passing cartItems
                      ),
                    );
                  },
                  child: Icon(Icons.shopping_cart_outlined),
                ),
                if (cartItems.isNotEmpty)
                  Positioned(
                    top: 0,
                    right: 0,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.red,
                      child: Text(
                        cartItems.length.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 8),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search your product',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(width: 2),
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
                    itemCount: postList.length,
                    itemBuilder: (context, index) {
                      var product = postList[index];
                      bool isInCart = isItemInCart(index);

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
                                      image: NetworkImage(product.image.toString()),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                ),
                                SizedBox(height: 15),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(product.title.toString()),
                                    Row(
                                      children: [
                                        Text(
                                          'Price =  ',
                                          style: TextStyle(fontWeight: FontWeight.bold),
                                        ),
                                        Text(product.price.toString()),
                                        SizedBox(width: 110),
                                        GestureDetector(
                                          onTap: () {
                                            if (!isInCart) {
                                              addToCart(product, index);
                                            }
                                          },
                                          child: Container(
                                            height: 40,
                                            width: 100,
                                            child: Center(
                                              child: Text(
                                                isInCart ? 'Added' : 'Add to cart',
                                                style: TextStyle(color: Colors.white),
                                              ),
                                            ),
                                            decoration: BoxDecoration(
                                              color: isInCart ? Colors.grey : Colors.green,
                                              borderRadius: BorderRadius.circular(12),
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
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
