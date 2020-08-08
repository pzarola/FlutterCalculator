import 'package:calculator/style/Colors.dart';
import 'package:flutter/material.dart';
import 'package:calculator/util/helper_methods.dart';

class CalculatorButton extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final Color splashColor;
  final IconData icon;
  VoidCallback onPressed;

  CalculatorButton(
      {Key key,
      this.text,
      this.buttonColor = raisnBlack,
      this.icon,
      this.splashColor,
      @required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double _buttonHeight, _buttonWidth, _fontSize, _buttonPadding;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      _buttonHeight = deviceHeight(context) / 12;
      _buttonWidth = containerWidth(context) / 4;
      _fontSize = containerWidth(context) * .08;
      _buttonPadding = 2;
    } else {
      _buttonHeight = deviceHeight(context) / 9;
      _buttonWidth = containerWidth(context) / 6;
      _fontSize = deviceHeight(context) * .05;
      _buttonPadding = 2;
    }
    //todo: Better error handling? (assert on 15)
    assert((icon != null) ^ (text != null));
    IconData _icon = icon;

    RaisedButton _button;
    if (text != null) {
      _button = RaisedButton(
        color: buttonColor,
        splashColor: splashColor,
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: _fontSize,
            color: snow,
          ),
        ),
      );
    } else {
      _button = RaisedButton.icon(
        splashColor: splashColor,
        icon: new Icon(
          _icon,
          size: _fontSize,
          color: snow,
        ),
        label: new Text(""),
        color: buttonColor,
        onPressed: onPressed,
      );
    }
    return SizedBox(
        height: _buttonHeight,
        width: _buttonWidth,
        child: Padding(
          padding: EdgeInsets.all(_buttonPadding),
          child: _button,
        ));
  }
}
