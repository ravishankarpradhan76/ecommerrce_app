import 'package:flutter/material.dart';
import 'package:ecommerrce_app/Modals.dart';
import '../Widgets/round_button.dart';
import 'LogIn_page.dart';

class CartPage extends StatefulWidget {
  final List<Modals> cartItems; // This will hold the items passed from HomePage

  CartPage({required this.cartItems}); // Constructor to pass cartItems

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  double calculateTotal() {
    double total = 0.0;
    for (var item in widget.cartItems) {
      total += item.price ?? 0; // Add price of each item to the total
    }
    return total;
  }
  double calculateDiscount(double total) {
    return total * 0.05;
  }
  double calculateFinalPrice() {
    double total = calculateTotal();
    double discount = calculateDiscount(total);
    return total - discount; // Subtract discount from total price
  }
  void _navigateToCheckout() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => LogInPage(), // Navigate to the CheckoutPage
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart',
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          // Cart items
          Expanded(
            child: widget.cartItems.isEmpty
                ? Center(child: Text('Your cart is empty'))
                : ListView.builder(
                itemCount: widget.cartItems.length,
                itemBuilder: (context, index) {
                  var product = widget.cartItems[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Card(
                      color: Colors.white,
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
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title.toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                          'Price: \$${product.price.toString()}'),
                                      Container(
                                        height: 32,
                                        width: 72,
                                        decoration: BoxDecoration(
                                            color: Colors.green,
                                            borderRadius:
                                            BorderRadius.circular(7)),
                                        child: Center(
                                            child: Text(
                                              '-   2   +',
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),

          // Promo code container
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Container(
              height: 60,
              width: double.infinity, // Use full width
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Icon(
                      Icons.qr_code,
                      size: 30,
                      color: Colors.black,
                    ),
                    SizedBox(width: 15),
                    Text('Promo Code', style: TextStyle(fontSize: 16)),
                    Spacer(),
                    Container(
                      height: 40,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          'Apply',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          // Cart summary
          SizedBox(height: 30),
          Container(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 20),
              child: Column(
                children: [
                  _buildSummaryRow('Products', calculateTotal().toStringAsFixed(2)),
                  _buildDivider(),
                  SizedBox(height: 8),
                  _buildSummaryRow('Discount (5%)', calculateDiscount(calculateTotal()).toStringAsFixed(2)),
                  _buildDivider(),
                  SizedBox(height: 8),
                  _buildSummaryRow('Total', calculateFinalPrice().toStringAsFixed(2), isTotal: true),
                ],
              ),
            ),
          ),

          // Checkout button
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: RoundButton(title: 'Checkout', onTap: _navigateToCheckout), // Pass the navigation function here
          ),
        ],
      ),
    );
  }

  // Helper method for building summary rows
  Row _buildSummaryRow(String label, String amount, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
          ),
        ),
        Text(
          '\$' + amount,
          style: TextStyle(
            fontSize: isTotal ? 16 : 14,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ],
    );
  }

  // Helper method to build a divider
  Divider _buildDivider() {
    return Divider(
      height: 5,
      thickness: 1,
    );
  }
}
