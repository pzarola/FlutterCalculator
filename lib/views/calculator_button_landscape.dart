import 'package:calculator/style/Colors.dart';
import 'package:flutter/material.dart';
import 'package:calculator/util/helper_methods.dart';
import 'package:calculator/style/calculator_constants.dart';

import '../style/calculator_constants.dart';
import 'calculator_button.dart';
class CalculatorButtonLandscape extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color splashColor;
  final IconData icon;
  VoidCallback onPressed;

  CalculatorButtonLandscape(
      {Key key,
      this.text,
      this.buttonColor = raisnBlack,
      this.icon,
      this.splashColor,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).orientation == Orientation.landscape)
      return CalculatorButton(text: this.text, 
      buttonColor: this.buttonColor, 
      splashColor: this.splashColor, 
      icon: this.icon, 
      onPressed: this.onPressed,);  
    else {
      return Container(height: 0, width: 0);
    }
  }
}
