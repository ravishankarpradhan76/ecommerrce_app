import 'package:flutter/material.dart';
import 'package:ecommerrce_app/Modals.dart';  // Assuming Modals class is present

class CartPage extends StatelessWidget {
  final List<Modals> cartItems;  // This will hold the items passed from HomePage

  CartPage({required this.cartItems});  // Constructor to pass cartItems

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart', style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500)),
        automaticallyImplyLeading: false,
      ),
      body: cartItems.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) {
          var product = cartItems[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Image.network(
                      product.image.toString(),
                      width: 60,
                      height: 60,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 20),
                    // Use Expanded to make the text fit within the available space
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.title.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            maxLines: 2,  // Limit title to 2 lines
                            overflow: TextOverflow.ellipsis,  // Truncate if overflow
                          ),
                          Text('Price: \$${product.price.toString()}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
