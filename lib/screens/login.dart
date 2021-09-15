import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  static String route = 'Login';
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      filled: true,
                      icon: Icon(Icons.phone),
                      hintText: 'Please enter your phone number',
                      labelText: 'Phone Number',
                      prefixText: '+95'),
                  keyboardType: TextInputType.number,
                ),
              ),
              ElevatedButton(onPressed: () {}, child: Text('Submit')),
            ],
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
