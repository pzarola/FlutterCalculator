import 'package:flutter/material.dart';
import 'package:calculator/util/helper_methods.dart';
import 'package:calculator/style/Colors.dart';
import '../style/calculator_constants.dart';
import '../util/helper_methods.dart';
import 'calculator_text.dart';

class CalculatorDisplay extends StatefulWidget {
  final String output;

  const CalculatorDisplay({Key key, this.output}) : super(key: key);
  @override
  _CalculatorDisplayState createState() => _CalculatorDisplayState();
}

class _CalculatorDisplayState extends State<CalculatorDisplay> {
  @override
  Widget build(BuildContext context) {
    double _displayWidth, _displayHeight;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      _displayHeight = deviceHeight(context) / 4.8;
      _displayWidth = deviceWidth(context) - 4;
    } else {
      _displayHeight = deviceHeight(context) / 8;
      _displayWidth = deviceWidth(context) - 25;
    }

    return Padding(
      padding: EdgeInsets.all(buttonPadding),
      child: Container(
        height: _displayHeight,
        width: _displayWidth,
        color: snow,
          child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CalculatorText(widget.output),
            ],
          ),
      ),
    );
  }
}
