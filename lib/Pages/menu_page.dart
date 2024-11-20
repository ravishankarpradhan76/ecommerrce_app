import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<dynamic> products = [];

  Future<void> getUserApi() async {
    final response =
        await http.get(Uri.parse('https://api.escuelajs.co/api/v1/products'));
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
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 43,
            child: TextFormField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search or ask a question...',
                hintStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                suffixIcon: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.camera_alt_outlined),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(Icons.mic),
                      onPressed: () {},
                    ),
                  ],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Icon(Icons.qr_code_2_sharp),
          ),
        ],
        backgroundColor: Colors.teal[200],
      ),
      body: products.isEmpty
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    GridView.builder(
                      shrinkWrap:
                          true, // Ensure grid does not take up too much space
                      physics:
                          NeverScrollableScrollPhysics(), // Prevents grid from scrolling
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 5,
                        mainAxisSpacing: 5,
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
                              color: Colors.teal,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  product['title'].toString(),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 8),
                                Image(
                                  image: NetworkImage(product['images'][0]),
                                  height: 80,
                                  width: 90,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    // Display the TextFormField only after the last product
                    if (products.isNotEmpty)
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.2), // Shadow color
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    offset:
                                        Offset(-1, 1), // Shadow position (x, y)
                                  ),
                                ],
                              ),
                              height: 48,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Switch Accounts',
                                  hintStyle: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                  suffixIcon: Icon(Icons.chevron_right_rounded),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors
                                          .teal, // Border color when the field is not focused
                                      width: 1,
                                    ),
                                  ),
                                  // Border color when the field is focused
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors
                                          .blue, // Border color when focused
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.2), // Shadow color
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    offset:
                                        Offset(-1, 1), // Shadow position (x, y)
                                  ),
                                ],
                              ),
                              height: 48,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Sign Out',
                                  hintStyle: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w400),
                                  suffixIcon: Icon(Icons.chevron_right_rounded),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors
                                          .teal, // Border color when the field is not focused
                                      width: 1,
                                    ),
                                  ),
                                  // Border color when the field is focused
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors
                                          .blue, // Border color when focused
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black
                                        .withOpacity(0.2), // Shadow color
                                    spreadRadius: 3,
                                    blurRadius: 5,
                                    offset:
                                        Offset(-1, 1), // Shadow position (x, y)
                                  ),
                                ],
                              ),
                              height: 48,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  hintText: 'Customer Service',
                                  hintStyle: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                  suffixIcon: Icon(Icons.chevron_right_rounded),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white70,
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors
                                          .teal, // Border color when the field is not focused
                                      width: 1,
                                    ),
                                  ),
                                  // Border color when the field is focused
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                    borderSide: BorderSide(
                                      color: Colors
                                          .blue, // Border color when focused
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 13,bottom: 90),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.info,
                                  color: Colors.teal[300],
                                  size: 25,
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Looking for the app settings? They have moved',style: TextStyle(
                                          fontSize: 14, fontWeight: FontWeight.w400),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'to',style: TextStyle(
                                            fontSize: 14, fontWeight: FontWeight.w400),
                                        ),
                                        Icon(Icons.lock_outline,size: 17,)
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          color: Colors.white,
        ),
        height: 75,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Row(
            children: [
              _buildBottomNavItem('Orders'),
              SizedBox(width: 9),
              _buildBottomNavItem('Buy Again'),
              SizedBox(width: 9),
              _buildBottomNavItem('Account'),
              SizedBox(width: 9),
              _buildBottomNavItem('Lists'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavItem(String label) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.black12,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black87,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}
