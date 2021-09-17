import 'package:flutter/material.dart';
import 'package:flutter_test_folder_structure/screens/home.dart';
import 'package:flutter_test_folder_structure/screens/login.dart';


class Otp extends StatefulWidget {
  static String route = 'Otp';
  const Otp({Key? key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  final otpController = TextEditingController();

  submitOtp() {
    if(otpController.text == '123456') {
      Navigator.pushNamed(context, Home.route);
    }
    else {
      Navigator.pushNamed(context, Login.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 500,
                child: TextField(
                  controller: otpController,
                  decoration: InputDecoration(
                    hintText: 'Enter OTP code'
                  ),
                )
              ),
              Container(child: ElevatedButton(onPressed: () {
                submitOtp();
              }, child: Text('Submit'))),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
