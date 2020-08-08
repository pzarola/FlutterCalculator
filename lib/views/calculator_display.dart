import 'package:flutter/material.dart';
import 'package:calculator/util/helper_methods.dart';
import 'package:calculator/style/Colors.dart';
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
    double _displayWidth, _displayHeight, _displayPaddingFactor;
    if (MediaQuery.of(context).orientation == Orientation.portrait) {
      _displayHeight = deviceHeight(context) / 8;
      _displayWidth = (MediaQuery.of(context).size.width -
          4 -
          ((MediaQuery.of(context).size.width / 25) * 2));
      _displayPaddingFactor = 25;
    } else {
      _displayHeight = deviceHeight(context) / 12;
      _displayWidth = containerWidth(context);
      _displayPaddingFactor = 0;
    }

    return Container(
      height: _displayHeight,
      width: _displayWidth,
      color: snow,
      child: Padding(
        padding: EdgeInsets.all(
            MediaQuery.of(context).size.width / _displayPaddingFactor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CalculatorText(widget.output),
          ],
        ),
      ),
    );
  }
}
