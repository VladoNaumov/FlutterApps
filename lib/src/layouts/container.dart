import 'package:flutter/material.dart';

class Example1 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter demo App ',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: false
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('Пример цвета'),
          ),
          body: Example()),
    );
  }
}

class Example extends StatelessWidget{
  const Example({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 100,
        height: 100,
        color: Colors.red,
      ),
    );
  }
}

class ExamlContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Container Example')),
        body: Center(
          child: Container(
            width: 150,
            height: 150,
            margin: EdgeInsets.all(16.0),
            padding: EdgeInsets.all(8.0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 4)],
            ),
            child: Text('Container', style: TextStyle(color: Colors.white)),
          ),
        ),
      ),
    );
  }
}