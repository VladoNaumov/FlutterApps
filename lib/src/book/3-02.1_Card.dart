import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Playground",
      home: Scaffold(
        appBar: AppBar(title: Text("Flutter Playground!")),
        body: Center(
          child: Card(
            color: Colors.blue[50],
            elevation: 8.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text(
                    "My Card",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(),
                ListTile(
                  title: Text("Child1"),
                  onTap: () => print("Нажат Child1"),
                ),
                Divider(),
                ListTile(
                  title: Text("Child2"),
                  onTap: () => print("Нажат Child2"),
                ),
                Divider(),
                ListTile(
                  title: Text("Child3"),
                  onTap: () => print("Нажат Child3"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}