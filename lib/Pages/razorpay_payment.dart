import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class RazorpayPayment extends StatefulWidget {
  const RazorpayPayment({super.key});

  @override
  State<RazorpayPayment> createState() => _RazorpayPaymentState();
}

class _RazorpayPaymentState extends State<RazorpayPayment> {
  late Razorpay _razorpay;
  TextEditingController amtController = TextEditingController();

  void openCheckout(amount)async{
    amount = amount * 100;
    var options ={
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': amount,
      'name': "Ravi Shankar Pradhan",
      'prefill' : {'contact' : '9693654565','email': 'ravikyp1234@gmail.com'},
      'external' : {
        'wallets': ['paytm']
      }
    };
    try{
      _razorpay.open(options);
    }catch(e){
      debugPrint('Error : $e');
    }
  }

  void handlePayementSuccess(PaymentSuccessResponse response){
Fluttertoast.showToast(msg: "payment Successfully"+ response.paymentId!,toastLength: Toast.LENGTH_SHORT);
  }
  void handlePayementError(PaymentFailureResponse response){
    Fluttertoast.showToast(msg: "payment Failled"+ response.message!,toastLength: Toast.LENGTH_SHORT);
  }

  void handleExternalwallet(ExternalWalletResponse response){
    Fluttertoast.showToast(msg: "External Wallet"+ response.walletName!,toastLength: Toast.LENGTH_SHORT);
  }


  @override
  void dispose() {
    super.dispose();
    _razorpay.clear();
  }

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handleExternalWallet);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 100,),
            Image.network('https://media.licdn.com/dms/image/C5603AQHSAAC'
                '_aXAI9w/profile-displayphoto-shrink_200_200/0/166168516831'
                '8?e=2147483647&v=beta&t=uWQk20bvIywx0S6tskp-2EUFqvesKoVzgDd3DuiOohY',
            height: 100,
            width: 300,),
            SizedBox(height: 10,),
            Text('Welcome to Razorpay Payment Gateway Integration',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18,),
              textAlign: TextAlign.center,),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                cursorColor: Colors.white,
                autofocus: false,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  labelText: 'Enter Amaount to be paid',
                  labelStyle: TextStyle(fontSize: 15,color: Colors.white),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.white,
                    )
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    )
                    ),
                  errorStyle: TextStyle(color: Colors.redAccent, fontSize: 15),
                  ),
                controller: amtController,
                validator: (value){
                  if(value== null || value.isEmpty){
                    return 'please enter your amount to be paid';
                  }
                  return null;
                }
              ),
            ),
            SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              if(amtController.text.toString().isNotEmpty){
                setState(() {
                  int amount = int.parse(amtController.text.toString());
                  openCheckout(amount);
                });
              }
            }, child:Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('make payment'),
            ),style: ElevatedButton.styleFrom(backgroundColor: Colors.white) )
          ],
        ),
      ),
    );
  }
}
