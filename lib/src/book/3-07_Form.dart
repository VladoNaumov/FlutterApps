import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class LoginData {
  String username = "";
  String password = "";
}

class _MyAppState extends State<MyApp> {
  final LoginData _loginData = LoginData();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext inContext) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(50.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  validator: (String? inValue) {
                    if (inValue == null || inValue.isEmpty) {
                      return "Please enter username";
                    }
                    return null;
                  },
                  onSaved: (String? inValue) {
                    _loginData.username = inValue ?? "";
                  },
                  decoration: InputDecoration(
                    hintText: "none@none.com",
                    labelText: "Username (eMail address)",
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  validator: (String? inValue) {
                    if (inValue == null || inValue.length < 10) {
                      return "Password must be >=10 in length";
                    }
                    return null;
                  },
                  onSaved: (String? inValue) {
                    _loginData.password = inValue ?? "";
                  },
                  decoration: InputDecoration(
                    hintText: "Password",
                    labelText: "Password",
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  child: Text("Log In!"),
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      _formKey.currentState?.save();
                      print("Username: ${_loginData.username}");
                      print("Password: ${_loginData.password}");
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
