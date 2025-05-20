import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: Home()));
  }
}

class Home extends StatelessWidget {
  Future<void> _selectDate(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2017),
      lastDate: DateTime(2025),
    );

    if (selectedDate != null) {
      print("Selected date: $selectedDate");
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (selectedTime != null) {
      print("Selected time: $selectedTime");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            ElevatedButton(
              child: Text("Test DatePicker"),
              onPressed: () => _selectDate(context),
            ),
            ElevatedButton(
              child: Text("Test TimePicker"),
              onPressed: () => _selectTime(context),
            ),
          ],
        ),
      ),
    );
  }
}

