import 'package:flutter/material.dart';
import 'Pages/Home_page.dart';
import 'Pages/LogIn_page.dart';
import 'Pages/SignUp_Page.dart';
import 'Pages/navigater.dart';
import 'Pages/razorpay_payment.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: RazorpayPayment(),
    );
  }
}