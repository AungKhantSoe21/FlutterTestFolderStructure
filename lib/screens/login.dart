import 'package:flutter/material.dart';
import '/screens/otp.dart';

class Login extends StatefulWidget {
  static String route = 'Login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final phoneNumberController = TextEditingController();

  submitPhoneNumber() {
    if(phoneNumberController.text == '9772158800' || phoneNumberController.text == '000000') {
      Navigator.pushNamed(context, Otp.route);
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
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 500,
                  child: TextFormField(
                    decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        filled: true,
                        icon: Icon(Icons.phone),
                        hintText: 'Please enter your phone number',
                        labelText: 'Phone Number',
                        prefixText: '+95'),
                    keyboardType: TextInputType.number,
                    controller: phoneNumberController,
                  ),
                ),
                ElevatedButton(onPressed: () {
                  submitPhoneNumber();
                }, child: Text('Submit')),
              ],
            ),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
