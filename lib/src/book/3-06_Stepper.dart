// Импортируем библиотеку Flutter для создания интерфейса приложения
import 'package:flutter/material.dart';

// Точка входа в приложение — функция main запускает приложение
void main() => runApp(MyApp());

// Класс MyApp — главный виджет приложения, наследуется от StatefulWidget (виджет с изменяемым состоянием)
class MyApp extends StatefulWidget {
  @override
  // Создаём состояние для MyApp, исправлено название класса состояния
  _MyAppState createState() => _MyAppState();
}

// Класс _MyAppState управляет состоянием виджета MyApp
class _MyAppState extends State<MyApp> {
  // Переменная для хранения текущего шага в Stepper
  int _currentStep = 0;

  @override
  // Метод build определяет, как будет выглядеть экран
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Playground", // Заголовок приложения
      home: Scaffold(
        // Scaffold задаёт структуру экрана
        appBar: AppBar(
          title: Text("Flutter Playground"), // Заголовок в верхней панели
        ),
        body: Stepper(
          // Тип Stepper — вертикальный (шаги отображаются сверху вниз)
          type: StepperType.vertical,
          // Текущий активный шаг
          currentStep: _currentStep,
          // Действие при нажатии кнопки "Continue"
          onStepContinue: _currentStep < 2
              ? () => setState(() => _currentStep += 1)
              : null, // Если не последний шаг, переходим к следующему
          // Действие при нажатии кнопки "Cancel"
          onStepCancel: _currentStep > 0
              ? () => setState(() => _currentStep -= 1)
              : null, // Если не первый шаг, возвращаемся назад
          // Список шагов
          steps: [
            Step(
              title: Text("Get Ready"), // Заголовок шага
              isActive: true, // Шаг активен (выделяется визуально)
              content: Text("Let's begin..."), // Содержимое шага
            ),
            Step(
              title: Text("Get Set"),
              isActive: true,
              content: Text("Ok, just a little more..."),
            ),
            Step(
              title: Text("Go!"),
              isActive: true,
              content: Text("And, we're done!"),
            ),
          ],
        ),
      ),
    );
  }
}

/*
Этот код создаёт Flutter-приложение с экраном, на котором отображается виджет Stepper (пошаговый интерфейс). Stepper состоит из трёх шагов ("Get Ready", "Get Set", "Go!"), которые отображаются вертикально. Пользователь может переключаться между шагами с помощью кнопок "Continue" и "Cancel". Текущее состояние шага хранится в переменной _currentStep и обновляется с помощью setState.
Разбор ключевых компонентов
Точка входа (main):
Функция main запускает приложение, вызывая runApp с виджетом MyApp.

Класс MyApp и StatefulWidget:
MyApp наследуется от StatefulWidget, так как интерфейс должен обновляться при изменении текущего шага (_currentStep).

Состояние управляется в классе _MyAppState.

Переменная состояния:
_currentStep: Целое число (int), хранящее индекс текущего шага (0, 1 или 2). Изначально равно 0 (первый шаг).

Метод build:
Создаёт интерфейс с помощью MaterialApp и Scaffold.

appBar отображает заголовок "Flutter Playground".

Stepper — основной виджет, который отображает шаги.

Виджет Stepper:
type: StepperType.vertical: Шаги отображаются вертикально (есть также StepperType.horizontal для горизонтального отображения).

currentStep: _currentStep: Указывает, какой шаг активен.

onStepContinue: Вызывается при нажатии кнопки "Continue". Если текущий шаг не последний (_currentStep < 2), увеличивает _currentStep на 1, вызывая setState для обновления интерфейса.

onStepCancel: Вызывается при нажатии кнопки "Cancel". Если текущий шаг не первый (_currentStep > 0), уменьшает _currentStep на 1.

steps: Список из трёх шагов (Step), каждый из которых содержит:
title: Заголовок шага (например, "Get Ready").

content: Содержимое шага (в данном случае, простой Text).

isActive: true: Делает шаг визуально выделенным (можно настроить для динамического управления).

Что делает приложение
Показывает экран с заголовком "Flutter Playground" в верхней панели (AppBar).

Отображает пошаговый интерфейс (Stepper) с тремя шагами: "Get Ready", "Get Set" и "Go!".

Пользователь может:
Переходить к следующему шагу, нажимая "Continue" (кнопка отключена на последнем шаге).

Возвращаться к предыдущему шагу, нажимая "Cancel" (кнопка отключена на первом шаге).

Каждый шаг содержит текстовое сообщение.


* */