import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../Widgets/round_button.dart';
import 'Home_page.dart';
import 'SignUp_Page.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  /// form key
  final _formKey = GlobalKey<FormState>();

  ///controller
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ///Api
  String? responseMessage;
  bool? isLoading;

  Future<void> login() async {
    setState(() {
      isLoading = true;
    });
    var url = Uri.parse(ApiUrls.loginUrl);

    Map<String, String> requestBody = {
      'email': emailController.text,
      'password': passwordController.text,
    };

    try {
      print(url);
      print(requestBody.toString());
      var response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(requestBody),
      );
      print(response.body.toString()); // नेटवर्क कॉल को दिखाने के लिए
      setState(() {
        isLoading = false;
      });
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        setState(() {
          responseMessage = "Login Successful. Token: ${data['token']}";
        });
        showToast(context, responseMessage, Colors.green);

        // लॉगिन सफल होने के बाद नेविगेट करें
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),  // HomePage पर नेविगेट करें
        );
      } else {
        var errorResponse = jsonDecode(response.body);
        setState(() {
          responseMessage = errorResponse['error']; // एरर मेसेज दिखाएं
        });
        showToast(context, responseMessage, Colors.red);
      }
    } catch (e, _) {
      setState(() {
        isLoading = false;
      });
      setState(() {
        responseMessage = "Error: $e $_";
      });
      showToast(context, responseMessage, Colors.red);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Wel Come,',
                    style: TextStyle(
                      fontSize: 24.0, // font size
                      fontWeight: FontWeight.bold, // font weight
                      color: Colors.black87, // text color
                      letterSpacing: 1, // letter spacing
                      fontFamily: 'Roboto', // font family
                    ),
                  ),
                  Text(
                    'Sign in to countinue!',
                    style: TextStyle(
                      fontSize: 20.0, // font size
                      fontWeight: FontWeight.bold, // font weight
                      color: Colors.black38, // text color
                      letterSpacing: 1.2, // letter spacing
                      fontFamily: 'Roboto', // font family
                    ),
                  ),
                  SizedBox(height: 70),
                  TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 3,
                          )
                        ),
                        hintText: 'Enter your email',
                        labelText: 'Email ID'
                      ),
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                            .hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      }),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            width: 3,
                          )
                      ),
                      hintText: 'Enter password',
                      labelText: 'Password'
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      } else if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 14,),
                  Padding(
                    padding: const EdgeInsets.only(left: 200),
                    child: Text('Forgot Password?',style: TextStyle(fontWeight: FontWeight.w700),),
                  ),
                  const SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
                },
                child:
                  RoundButton(
                      title: 'LogIn',
                      onTap: () {
                        if (_formKey.currentState?.validate() == true) {
                          print("You tapped on login button");
                          login();
                        }
                      }),),
                  SizedBox(height: 200,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 65),
                    child: Row(
                      children: [
                        Text('I am a new user,', style: TextStyle(
                          fontSize: 14.0, // font size
                          fontWeight: FontWeight.w900, // font weight
                          color: Colors.black54,
                          fontFamily: 'Roboto', // font family
                        ),),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignupPage()),
                            );
                          },
                          child: Text(
                            'Sign Up',
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
        ));
  }

  void showToast(
      BuildContext context, String? responseMessage, MaterialColor green) {}
}

class ApiUrls {
  static String baseUrl = "https://dummyjson.com";
  static String productUrl = "/products";
  static String getPosts = "/posts";
  static const loginUrl = "https://reqres.in/api/login";
}
