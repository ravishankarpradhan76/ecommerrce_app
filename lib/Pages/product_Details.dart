import 'package:ecommerrce_app/Modals.dart';
import 'package:flutter/material.dart';

class ProductDetails extends StatelessWidget {
  final Modals product;

  ProductDetails({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title.toString()),  // Display product title in AppBar
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(product.image.toString()),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              SizedBox(height: 20),
              Text(product.title.toString(), style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              SizedBox(height: 20),
              Text(product.category.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
              SizedBox(height: 10),
              Text('Price: \$${product.price.toString()}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
              SizedBox(height: 10),
              Text(
                product.description.toString(),
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                },
                child: Text("Add to Cart"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
