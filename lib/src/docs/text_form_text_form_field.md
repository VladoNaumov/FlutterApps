---

## 🟦 1. `TextField` и `TextFormField` — в чём разница?

| Свойство              | `TextField`         | `TextFormField`            |
| --------------------- | ------------------- | -------------------------- |
| Используется с формой | ❌ (нужно вручную)   | ✅ встроено в `Form`        |
| `validator:`          | ❌ нет               | ✅ есть                     |
| Для одиночного поля   | ✅ Да                | ✅ Да, но особенно для форм |
| Удобен в формах       | ❌ Нужно больше кода | ✅ Более удобен             |

> 📌 **ИТОГО**: Если у тебя **форма с валидацией** — используй `TextFormField`.

---

## 🟦 2. Основные параметры `TextFormField` / `TextField`

| Параметр                              | Назначение                                  |
| ------------------------------------- | ------------------------------------------- |
| `controller:`                         | Управление текстом                          |
| `decoration:`                         | Внешний вид поля                            |
| `keyboardType:`                       | Тип клавиатуры (текст, email, число и т.д.) |
| `obscureText:`                        | Скрытие текста (например, пароль)           |
| `onChanged:`                          | Реакция на ввод                             |
| `validator:` (только `TextFormField`) | Проверка правильности ввода                 |
| `autofocus:`                          | Автофокус при открытии                      |
| `enabled:`                            | Включено/выключено поле                     |
| `readOnly:`                           | Только для чтения                           |
| `style:`                              | Стиль текста                                |
| `maxLength:`                          | Максимальная длина текста                   |
| `maxLines:`                           | Многострочное поле                          |

---

## 🟦 3. Работа с `TextEditingController`

```dart
final controller = TextEditingController();

// Связь с полем
TextFormField(controller: controller);

// Получить текст
print(controller.text);

// Установить текст
controller.text = 'Пример';

// Очистить
controller.clear();
```

🧠 **Важно**: не забывай вызывать `controller.dispose()` в `dispose()`, чтобы не было утечек памяти.

---

## 🟦 4. Валидация данных (`TextFormField` + `Form`)

```dart
final _formKey = GlobalKey<FormState>();

Form(
  key: _formKey,
  child: TextFormField(
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Это поле обязательно';
      }
      return null;
    },
  ),
);
```

🔘 Проверка:

```dart
if (_formKey.currentState!.validate()) {
  // Всё ОК
}
```

---

## 🟦 5. Удаление/Очистка формы

```dart
controller.clear();              // очистить текст
_formKey.currentState?.reset(); // сброс валидации
```

---

## 🟦 6. Примеры `keyboardType`

```dart
TextInputType.text             // по умолчанию
TextInputType.emailAddress     // email клавиатура
TextInputType.number           // только цифры
TextInputType.phone            // телефон
TextInputType.url              // URL
TextInputType.multiline        // многострочный ввод
```

---

## 🟦 7. Пример с паролем и иконкой

```dart
TextFormField(
  obscureText: true,
  decoration: InputDecoration(
    labelText: 'Пароль',
    suffixIcon: Icon(Icons.visibility_off),
  ),
)
```

---

## 🟦 8. `FocusNode` — если хочешь управлять фокусом

```dart
FocusNode focusNode = FocusNode();

TextFormField(focusNode: focusNode);

// Программно дать фокус
focusNode.requestFocus();
```

---

## 🟦 9. Стиль текста

```dart
TextFormField(
  style: TextStyle(
    color: Colors.blue,
    fontSize: 16,
    fontWeight: FontWeight.bold,
  ),
)
```

---

## 🟦 10. Автовалидаторы (по мере ввода)

```dart
TextFormField(
  autovalidateMode: AutovalidateMode.onUserInteraction,
  validator: (value) => value!.isEmpty ? 'Обязательно' : null,
)
```

---

## 🟢 Резюме: Что нужно знать новичку

✅ `TextField` — простой ввод
✅ `TextFormField` — для форм с проверкой
✅ Используй `controller` — для чтения и очистки текста
✅ Оборачивай поля в `Form` и используй `GlobalKey`
✅ Применяй `validator` для проверки
✅ Украшай `InputDecoration`
✅ Используй `keyboardType`, `obscureText`, `maxLength`, `autovalidateMode`

---
