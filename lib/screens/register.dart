import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '/screens/login.dart';

class Register extends StatefulWidget {
  static String route = "Register";

  @override
  RegisterState createState() => RegisterState();
}

class RegisterState extends State<Register> {
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  
  RegExp emailValidate = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  Future<void> registerUser() async {
    try {
      // ignore: unused_local_variable
      UserCredential user = await _auth.createUserWithEmailAndPassword(
          email: emailTextController.text,
          password: passwordTextController.text);
      _auth.currentUser!.sendEmailVerification();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child: registerForm()),
      ),
    );
  }

  Widget registerForm() {
    return Form(
      key: _formKey,
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 70,
            ),
            SizedBox(
              height: 90,
              child: Text(
                "Register Form",
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 30
                ),
              ),
            ),
            Text("Enter your email", style: TextStyle(color: Colors.black),),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue)
              ),
              child: TextFormField(
                  controller: emailTextController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill email text!';
                    } else if (!value.contains(emailValidate)) {
                      return 'Invalid Email Address';
                    }
                    return null;
                  }),
            ),
            const SizedBox(
              height: 30,
            ),
            Text("Enter your password", style: TextStyle(color: Colors.black),),
            Container(
              width: MediaQuery.of(context).size.width * 0.8,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue)
              ),
              child: TextFormField(
                  controller: passwordTextController,
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please fill password text!';
                    } else if (value.length != 6) {
                      return 'Enter only 6 digit';
                    }
                    return null;
                  }),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    registerUser().then(
                      (value) => ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Click verification link at your inbox to complete!'
                          )
                        ),
                      )
                    );
                  }
                  else{
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Email already in use!'
                          )
                        ),
                      );
                  }
                },
                child: const Text('Sign Up')),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, Login.route),
              child: Text("Already registered? Go to Login.")
            )
          ],
        ),
      ),
    );
  }
}
