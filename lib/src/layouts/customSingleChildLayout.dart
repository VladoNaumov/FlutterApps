import 'package:flutter/material.dart';

class CustSinglChild extends StatelessWidget {
  const CustSinglChild({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Layout Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: false,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('CustomSingleChildLayout'),
        ),
        body: CustomSingleChildLayoutExample(),
      ),
    );
  }
}

class CustomSingleChildLayoutExample extends StatelessWidget {
  const CustomSingleChildLayoutExample({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomSingleChildLayout(
      delegate: CenterDelegate(),
      child: Container(
        color: Colors.amber,
        width: 100,
        height: 100,
        child: const Center(child: Text('Центр')),
      ),
    );
  }
}

class CenterDelegate extends SingleChildLayoutDelegate {
  @override
  Offset getPositionForChild(Size size, Size childSize) {
    // Центрируем по горизонтали и вертикали
    return Offset(
      (size.width - childSize.width) / 2,
      (size.height - childSize.height) / 2,
    );
  }

  @override
  bool shouldRelayout(SingleChildLayoutDelegate oldDelegate) => false;
}
