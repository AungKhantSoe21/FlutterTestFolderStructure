import 'package:flutter/material.dart';
import 'package:flutter_test_folder_structure/screens/home.dart';


class Otp extends StatefulWidget {
  static String route = 'Otp';
  const Otp({Key? key}) : super(key: key);

  @override
  _OtpState createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          actions: [],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 500,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter OTP code'
                  ),
                )
              ),
              Container(child: ElevatedButton(onPressed: () {
                Navigator.pushNamed(context, Home.route);
              }, child: Text('Submit'))),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
