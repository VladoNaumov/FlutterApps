import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Home()));
  }
}

class Home extends StatelessWidget {
  Future<void> _showIt(BuildContext inContext) async {
    final String? selectedFood = await showDialog<String>(
      context: inContext,
      builder: (BuildContext inContext) {
        return SimpleDialog(
          title: Text("What's your favorite food?"),
          children: [
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(inContext, "brocolli");
              },
              child: Text("Brocolli"),
            ),
            SimpleDialogOption(
              onPressed: () {
                Navigator.pop(inContext, "steak");
              },
              child: Text("Steak"),
            ),
          ],
        );
      },
    );

    if (selectedFood != null) {
      switch (selectedFood) {
        case "brocolli":
          print("Brocolli");
          break;
        case "steak":
          print("Steak");
          break;
        default:
          print("No food selected");
      }
    }
  }

  @override
  Widget build(BuildContext inContext) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: Text("Show it"),
          onPressed: () => _showIt(inContext),
        ),
      ),
    );
  }
}
