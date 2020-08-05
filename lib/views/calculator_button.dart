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
            fontSize: containerWidth(context) * .08,
            color: snow,
          ),
        ),
      );
    } else {
      _button = RaisedButton.icon(
        splashColor: splashColor,
        icon: new Icon(
          _icon,
          size: containerWidth(context) * .08,
          color: snow,
        ),
        label: new Text(""),
        color: buttonColor,
        onPressed: onPressed,
      );
    }
    return SizedBox(
        height: deviceHeight(context) / 12,
        width: containerWidth(context) / 4,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: _button,
        ));
  }
}
