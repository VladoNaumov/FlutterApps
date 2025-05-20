import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Playground",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Playground!"),
        ),
        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(
                decoration: BoxDecoration(color: Colors.blue),
                child: Text(
                  "Menu",
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              ListTile(
                leading: Icon(Icons.announcement),
                title: Text("Item 1"),
                onTap: () {
                  Navigator.pop(context);
                  print("Нажат Item 1");
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.cake),
                title: Text("Item 2"),
                onTap: () {
                  Navigator.pop(context);
                  print("Нажат Item 2");
                },
              ),
              Divider(),
              ListTile(
                leading: Icon(Icons.cloud),
                title: Text("Item 3"),
                onTap: () {
                  Navigator.pop(context);
                  print("Нажат Item 3");
                },
              ),
            ],
          ),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text("Child1", style: TextStyle(fontSize: 20)),
              Text("Child2", style: TextStyle(fontSize: 20)),
              Text("Child3", style: TextStyle(fontSize: 20)),
            ],
          ),
        ),
      ),
    );
  }
}