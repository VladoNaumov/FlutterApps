import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TextInputFormatter Пример',
      home: Scaffold(
        appBar: AppBar(title: Text('TextInputFormatter Пример')),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [

                // Только цифры
                TextField(
                  decoration: InputDecoration(labelText: 'Только цифры'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
                SizedBox(height: 16),

                //  Только латинские буквы (большие и маленькие)
                TextField(
                  decoration: InputDecoration(labelText: 'Только A-Z, a-z'),
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z]')),
                  ],
                ),
                SizedBox(height: 16),

                //  Запрещаем спецсимволы @, #, $, %
                TextField(
                  decoration: InputDecoration(labelText: 'Без спецсимволов @#\$%'),
                  inputFormatters: [
                    FilteringTextInputFormatter.deny(RegExp(r'[@#\$%]')),
                  ],
                ),
                SizedBox(height: 16),

                //  Формат ввода номера телефона: +7 (___) ___-__-__
                TextField(
                  decoration: InputDecoration(labelText: 'Телефон: +7 (___) ___-__-__'),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    // Сначала разрешаем только цифры
                    FilteringTextInputFormatter.digitsOnly,
                    // Затем применяем кастомный форматтер
                    PhoneInputFormatter(),
                  ],
                ),
                SizedBox(height: 16),

                //  Формат даты: дд.мм.гггг
                TextField(
                  decoration: InputDecoration(labelText: 'Дата: дд.мм.гггг'),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    DateInputFormatter(),
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

//  Форматтер телефона: +7 (999) 123-45-67
class PhoneInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String digits = newValue.text.replaceAll(RegExp(r'\D'), '');

    if (digits.isEmpty) return newValue;

    String formatted = '+7 ';
    if (digits.length >= 1) formatted += '(';
    if (digits.length >= 1) formatted += digits.substring(0, digits.length.clamp(0, 3));
    if (digits.length >= 4) formatted += ') ';
    if (digits.length >= 4) formatted += digits.substring(3, digits.length.clamp(3, 6));
    if (digits.length >= 7) formatted += '-';
    if (digits.length >= 7) formatted += digits.substring(6, digits.length.clamp(6, 8));
    if (digits.length >= 9) formatted += '-';
    if (digits.length >= 9) formatted += digits.substring(8, digits.length.clamp(8, 10));

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

// Форматтер даты: 31.12.2025
class DateInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    String digits = newValue.text.replaceAll(RegExp(r'\D'), '');

    String formatted = '';
    if (digits.length >= 1) formatted += digits.substring(0, digits.length.clamp(0, 2));
    if (digits.length >= 3) formatted += '.' + digits.substring(2, digits.length.clamp(2, 4));
    if (digits.length >= 5) formatted += '.' + digits.substring(4, digits.length.clamp(4, 8));

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
