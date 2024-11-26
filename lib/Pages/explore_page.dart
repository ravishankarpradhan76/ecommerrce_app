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


  Future<void> getUserApi(dynamic http) async {
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Explore',style: TextStyle(fontSize: 18),),
        actions: [Row(
          children: [
            Icon(Icons.search),
            SizedBox(width: 15,),
            Icon(Icons.mic),
            SizedBox(width: 15,),
            Icon(Icons.camera_alt_sharp),
            SizedBox(width: 15,),
            Stack(
              children: [
                Icon(Icons.shopping_cart),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: CircleAvatar(
                      radius: 6,
                      backgroundColor: Colors.red,
                      child: Text('5',
                        style: TextStyle(color: Colors.white, fontSize: 8),
                      ),
                    ),
                  ),
              ],
            ),
            SizedBox(width: 13,),
          ],
        )],
      ),
      body: products.isEmpty?  Center(child: CircularProgressIndicator())
          :SingleChildScrollView(
        child: Column(
          children: [
            GridView.builder(
            shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 2,
                    childAspectRatio: 1),
            itemCount: products.length,
            itemBuilder: (context, index) {
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
                  children: [
                    Container(
                      height: 30,
                      width: 200,
                      color: Colors.white60,
                    )
                  ],
                ),
              );
            }
                ),
          ],
        ),
          )
    );
  }
}
