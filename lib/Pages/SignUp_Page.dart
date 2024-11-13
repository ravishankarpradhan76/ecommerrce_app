import 'package:flutter/material.dart';

import '../Widgets/round_button.dart';
import 'LogIn_page.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  /// Controllers
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>(); // Global key for form validation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            // Wrap the form elements with Form widget for validation
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account,',
                  style: TextStyle(
                    fontSize: 24.0, // font size
                    fontWeight: FontWeight.bold, // font weight
                    color: Colors.black87, // text color
                    letterSpacing: 1, // letter spacing
                    fontFamily: 'Roboto', // font family
                  ),
                ),
                Text(
                  'Sign up to get started!',
                  style: TextStyle(
                    fontSize: 20.0, // font size
                    fontWeight: FontWeight.bold, // font weight
                    color: Colors.black38, // text color
                    letterSpacing: 1.2, // letter spacing
                    fontFamily: 'Roboto', // font family
                  ),
                ),
                SizedBox(height: 40),
        
                // Full Name TextField
                TextFormField(
                  controller: fullNameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Enter your full name',
                    labelText: 'Full Name',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your full name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Enter your email',
                    labelText: 'Email ID',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Enter your password',
                    labelText: 'Password',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    } else if (value.length < 6) {
                      return 'Password must be at least 6 characters long';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 40),
                RoundButton(
                    title: 'LogIn',
                    onTap: () {
                      if (_formKey.currentState?.validate() == true) {
                        print("'Account created successfully!");
                        login();
                      }
                    }),
                SizedBox(height: 200,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 65),
                  child: Row(
                    children: [
                      Text('I am already a member,', style: TextStyle(
                    fontSize: 13.0, // font size
                    fontWeight: FontWeight.bold, // font weight
                    color: Colors.black54,
                    fontFamily: 'Roboto', // font family
                  ),),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LogInPage()),
                          );
                        },
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontSize: 13.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.pink,
                            fontFamily: 'Roboto',
                          ),
                        ),
                      ),
        
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void login() {}
}
