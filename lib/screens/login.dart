import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '/screens/home.dart';
import '/screens/register.dart';

class Login extends StatefulWidget {
  static String route = 'Login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  TextEditingController emailTextController = TextEditingController();
  TextEditingController passwordTextController = TextEditingController();

  RegExp emailValidate = RegExp(r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');

  Future<void> loginUser() async {
    try {
      // ignore: unused_local_variable
      UserCredential user = await _auth.signInWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text
      );
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(child: loginForm()),
      ),
    );
  }

  Widget loginForm() {
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
                "Login Form",
                style: TextStyle(
                  color: Colors.cyan,
                  fontSize: 30
                ),
              ),
            ),
            Text("Enter your Email", style: TextStyle(color: Colors.black),),
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
                  }
              ),
            ),
            SizedBox(
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
                    loginUser().then(
                      (value) => Navigator.pushNamed(context, Home.route)
                    );
                  }
                },
                child: const Text('Login')),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, Register.route),
              child: Text("Don't have account? Go to Register.")
            )
          ],
        ),
      ),
    );
  }
}
