import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(backgroundColor: Colors.black, color: Colors.white,strokeWidth: 2),
              SizedBox(height:15),
              Text('Loading ...', style: TextStyle(color: Colors.black),)
            ],
          )),
        );
  }
}