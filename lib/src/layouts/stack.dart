import 'package:flutter/material.dart';

class MyStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stack Example')),
        body: Center(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(width: 200, height: 200, color: Colors.blue),
              Positioned(
                top: 10,
                left: 10,
                child: Container(width: 100, height: 100, color: Colors.red),
              ),
              Positioned(
                bottom: 10,
                right: 10,
                child: Text('Overlay', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}