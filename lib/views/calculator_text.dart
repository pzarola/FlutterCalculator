import 'package:flutter/material.dart';

class CalculatorText extends StatelessWidget {
  final String text;

  CalculatorText(this.text);
  @override
  Widget build(BuildContext context) {
    String _text;
    _text = text ?? " ";
    return Text(
      _text,
      style: TextStyle(fontSize: 30),
    );
  }
}
