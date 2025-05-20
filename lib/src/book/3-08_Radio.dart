import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _checkboxValue = false;
  bool _switchValue = false;
  double _sliderValue = 0.3;
  int _radioValue = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.all(50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Checkbox(
                  value: _checkboxValue,
                  onChanged: (bool? inValue) {
                    setState(() {
                      _checkboxValue = inValue ?? false;
                    });
                  },
                ),
                Switch(
                  value: _switchValue,
                  onChanged: (bool? inValue) {
                    setState(() {
                      _switchValue = inValue ?? false;
                    });
                  },
                ),
                Slider(
                  min: 0,
                  max: 20,
                  value: _sliderValue,
                  onChanged: (double inValue) {
                    setState(() {
                      _sliderValue = inValue;
                    });
                  },
                ),
                Row(
                  children: [
                    Radio<int>(
                      value: 1,
                      groupValue: _radioValue,
                      onChanged: (int? inValue) {
                        setState(() {
                          _radioValue = inValue ?? 1;
                        });
                      },
                    ),
                    Text("Option 1")
                  ],
                ),
                Row(
                  children: [
                    Radio<int>(
                      value: 2,
                      groupValue: _radioValue,
                      onChanged: (int? inValue) {
                        setState(() {
                          _radioValue = inValue ?? 1;
                        });
                      },
                    ),
                    Text("Option 2")
                  ],
                ),
                Row(
                  children: [
                    Radio<int>(
                      value: 3,
                      groupValue: _radioValue,
                      onChanged: (int? inValue) {
                        setState(() {
                          _radioValue = inValue ?? 1;
                        });
                      },
                    ),
                    Text("Option 3")
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
