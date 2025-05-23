import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Задаём тему для согласованного дизайна
      theme: ThemeData(
        primaryColor: Colors.indigo,
        textTheme: TextTheme(
          bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Красивые кнопки и анимации'), // Заголовок
          backgroundColor: Colors.indigo, // Цвет AppBar
          elevation: 4, // Тень под AppBar
        ),
        body: ButtonExamples(),
      ),
    );
  }
}

// StatefulWidget для управления состоянием (текст, счётчики, анимации)
class ButtonExamples extends StatefulWidget {
  @override
  _ButtonExamplesState createState() => _ButtonExamplesState();
}

class _ButtonExamplesState extends State<ButtonExamples>
    with SingleTickerProviderStateMixin {
  // Переменная для хранения текста надписи
  String _labelText = 'Нажми любую кнопку!';
  // Счётчики для отслеживания нажатий каждой кнопки
  int _elevatedCount = 0;
  int _outlinedCount = 0;
  int _textCount = 0;
  int _iconCount = 0;
  // Контроллер для анимации текста
  late AnimationController _textAnimationController;
  late Animation<double> _textScaleAnimation;

  @override
  void initState() {
    super.initState();
    // Инициализация анимации для текста
    _textAnimationController = AnimationController(
      duration: Duration(milliseconds: 300), // Длительность анимации
      vsync: this, // Синхронизация с экраном
    );
    _textScaleAnimation = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(
        parent: _textAnimationController,
        curve: Curves.easeInOut, // Плавная кривая анимации
      ),
    );
  }

  @override
  void dispose() {
    // Очищаем контроллер анимации
    _textAnimationController.dispose();
    super.dispose();
  }

  // Метод для обновления текста и счётчика
  void _updateLabel(String buttonName, String counterType) {
    setState(() {
      // Обновляем счётчики в зависимости от типа кнопки
      if (counterType == 'elevated') _elevatedCount++;
      if (counterType == 'outlined') _outlinedCount++;
      if (counterType == 'text') _textCount++;
      if (counterType == 'icon') _iconCount++;
      // Обновляем текст с информацией о нажатой кнопке и счётчике
      _labelText = '$buttonName: $counterType нажата $_elevatedCount раз, '
          'outlined: $_outlinedCount, text: $_textCount, icon: $_iconCount';
    });
    // Запускаем анимацию текста
    _textAnimationController.forward().then((_) {
      _textAnimationController.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0), // Отступы по краям
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Равномерное расположение
        children: [
          // Анимированный текст, который меняется при нажатии кнопок
          AnimatedBuilder(
            animation: _textAnimationController,
            builder: (context, child) {
              return Transform.scale(
                scale: _textScaleAnimation.value, // Анимация масштабирования
                child: Card(
                  elevation: 4, // Тень карточки
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      _labelText,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(height: 20), // Отступ

          // 1. ElevatedButton с ButtonStyle и анимацией
          _buildButtonCard(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12), // Закругленные углы
              clipBehavior: Clip.antiAlias, // Плавная обрезка
              child: ElevatedButton(
                onPressed: () {
                  _updateLabel('ElevatedButton', 'elevated');
                },
                style: ButtonStyle(
                  // Градиентный фон
                  backgroundBuilder: (context, states, child) => Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.indigo, Colors.blueAccent],
                      ),
                    ),
                    child: child,
                  ),
                  // Цвет текста
                  foregroundColor: WidgetStateProperty.all(Colors.white),
                  // Отступы
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  // Форма
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero, // Обрезка в ClipRRect
                    ),
                  ),
                  // Тень
                  elevation: WidgetStateProperty.all(5),
                  // Эффект нажатия
                  overlayColor: WidgetStateProperty.all(Colors.white.withOpacity(0.2)),
                ),
                child: Text('ElevatedButton'),
              ),
            ),
            label: 'Градиентная кнопка',
          ),

          // 2. OutlinedButton с ButtonStyle
          _buildButtonCard(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12), // Закругленные углы
              clipBehavior: Clip.antiAlias, // Плавная обрезка
              child: OutlinedButton(
                onPressed: () {
                  _updateLabel('OutlinedButton', 'outlined');
                },
                style: ButtonStyle(
                  // Цвет контура
                  side: WidgetStateProperty.all(
                    BorderSide(color: Colors.indigo, width: 2),
                  ),
                  // Цвет текста
                  foregroundColor: WidgetStateProperty.all(Colors.indigo),
                  // Отступы
                  padding: WidgetStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  ),
                  // Форма
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
                child: Text('OutlinedButton'),
              ),
            ),
            label: 'Контурная кнопка',
          ),

          // 3. TextButton с ButtonStyle
          _buildButtonCard(
            child: TextButton(
              onPressed: () {
                _updateLabel('TextButton', 'text');
              },
              style: ButtonStyle(
                // Цвет текста
                foregroundColor: WidgetStateProperty.all(Colors.indigo),
                // Отступы
                padding: WidgetStateProperty.all(
                  EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                ),
                // Стиль текста с подчеркиванием
                textStyle: WidgetStateProperty.all(
                  TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                  ),
                ),
                // Эффект нажатия
                overlayColor: WidgetStateProperty.all(Colors.indigo.withOpacity(0.1)),
              ),
              child: Text('TextButton'),
            ),
            label: 'Текстовая кнопка',
          ),

          // 4. IconButton с ButtonStyle и анимацией
          _buildButtonCard(
            child: ClipOval(
              clipBehavior: Clip.antiAlias, // Круглая обрезка
              child: Container(
                color: Colors.indigo.withOpacity(0.1), // Лёгкий фон
                child: IconButton(
                  onPressed: () {
                    _updateLabel('IconButton', 'icon');
                  },
                  icon: Icon(Icons.star),
                  style: ButtonStyle(
                    // Цвет иконки
                    foregroundColor: WidgetStateProperty.all(Colors.yellow),
                    // Эффект нажатия
                    overlayColor: WidgetStateProperty.all(Colors.yellow.withOpacity(0.3)),
                  ),
                  iconSize: 40,
                  tooltip: 'Нажми на звезду',
                ),
              ),
            ),
            label: 'Иконка-кнопка',
          ),
        ],
      ),
    );
  }

  // Вспомогательный метод для создания карточки с кнопкой и подписью
  Widget _buildButtonCard({required Widget child, required String label}) {
    return Card(
      elevation: 4, // Тень карточки
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Закругленные углы
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            child, // Кнопка
            SizedBox(height: 8), // Отступ
            Text(
              label,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
          ],
        ),
      ),
    );
  }
}

/*

Объяснение кода:
StatefulWidget и состояние:
  ButtonExamples — это StatefulWidget, а _ButtonExamplesState управляет состоянием.
  Переменные _labelText, _elevatedCount, _outlinedCount, _textCount, _iconCount хранят текст надписи и счётчики нажатий для каждой кнопки.
  Метод _updateLabel обновляет текст и счётчик через setState, чтобы интерфейс перерисовался.
Анимация текста:
  Используется AnimationController и Tween для создания анимации масштабирования текста при каждом нажатии кнопки.
  SingleTickerProviderStateMixin нужен для синхронизации анимации.
  _textAnimationController.forward().then((_) => _textAnimationController.reverse()) запускает анимацию увеличения текста и возвращает его в исходный размер.
  AnimatedBuilder и Transform.scale применяют анимацию к тексту в карточке.
Кнопки и стили:
ElevatedButton:
  Использует ButtonStyle с градиентным фоном (backgroundBuilder), белым текстом, тенью и эффектом нажатия (overlayColor).
  Обёрнута в ClipRRect с Clip.antiAlias для плавной обрезки углов.
  Увеличивает _elevatedCount и обновляет текст.
OutlinedButton:
  ButtonStyle задаёт индиго-контур, текст и закругленные углы.
  Обёрнута в ClipRRect для обрезки.
  Увеличивает _outlinedCount.
TextButton:
  ButtonStyle задаёт индиго-текст с подчеркиванием и эффект нажатия.
  Без обрезки, так как это текстовая кнопка.
  Увеличивает _textCount.
IconButton:
  Обёрнута в ClipOval с Clip.antiAlias для круглой обрезки.
  ButtonStyle задаёт жёлтую иконку и эффект нажатия.
  Увеличивает _iconCount.
Дизайн:
  Кнопки помещены в карточки (Card) с тенями и закруглениями для современного вида.
  Текст отображается в карточке с анимацией масштабирования.
  Тема (ThemeData) задаёт индиго как основной цвет для согласованности.
ClipBehavior:
  Используется Clip.antiAlias для ElevatedButton, OutlinedButton (в ClipRRect) и IconButton (в ClipOval) для плавной обрезки.
  Демонстрирует, как обрезка улучшает внешний вид кнопок с фонами или градиентами.
Как это выглядит:
  Вверху экрана — анимированный текст в карточке, изначально "Нажми любую кнопку!".
  При нажатии любой кнопки текст обновляется, показывая, какая кнопка нажата и сколько раз (например, "ElevatedButton: elevated нажата 2 раз, outlined: 1, text: 0, icon: 3").
  Текст увеличивается и возвращается в исходный размер при каждом нажатии (анимация).
Кнопки:
  ElevatedButton: Градиентная (индиго-синяя), с тенью и белым текстом.
  OutlinedButton: Индиго-контур, закругленная.
  TextButton: Индиго-текст с подчеркиванием.
  IconButton: Жёлтая звезда в круге с лёгким фоном.
  Все кнопки в карточках с тенями и подписями.

*/