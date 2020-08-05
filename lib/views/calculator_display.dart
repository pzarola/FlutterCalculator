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
    return Container(
      height: deviceHeight(context) / 8,
      width: (MediaQuery.of(context).size.width -
          4 -
          ((MediaQuery.of(context).size.width / 25) * 2)),
      color: snow,
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.width / 25),
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
