import 'package:flutter/material.dart';

class MyRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Row Example')),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(width: 80, height: 80, color: Colors.red),
              Container(width: 80, height: 80, color: Colors.green),
              Container(width: 80, height: 80, color: Colors.blue),
            ],
          ),
        ),
      ),
    );
  }
}