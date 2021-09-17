import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  const CircularLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Colors.black, strokeWidth: 2),
          SizedBox(height: 15),
          Text(
            'Loading ...',
            style: TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
