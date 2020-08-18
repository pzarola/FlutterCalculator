import 'package:calculator/style/Colors.dart';
import 'package:calculator/views/calculator_button.dart';
import 'package:calculator/views/calculator_class.dart';
import 'package:flutter/material.dart';
import 'calculator_display.dart';
import 'package:calculator/util/operator_extension.dart';

// TODO: Fix on rotate....
// TODO: Pick a symbol for top right
// TODO: Should the erase button be red?
// TODO: Create list of strings for output - display only first 4 on screen.
// TODO: Drawer on right hand side for history?
// TODO: Fix bug in +/-
class CalculatorLandscape extends StatefulWidget {
  @override
  _CalculatorLandscapeState createState() => _CalculatorLandscapeState();
}

class _CalculatorLandscapeState extends State<CalculatorLandscape> {
  Color numberButtonColor = raisnBlack.shade100;
  CalculatorClass calculator = new CalculatorClass();
  Color splashColor;
  @override
  Widget build(BuildContext context) {
    void _onOperatorPress(String op) {
      setState(() {
        if (calculator.onOperatorPress(op)) splashColor = rubyRed;
      });
    }

    void _processNumberPress(String number) {
      setState(() {
        calculator.processNumberPress(number);
      });
    }

    void _clear() {
      setState(() {
        calculator.clear();
        splashColor = raisnBlack.shade100;
      });
    }

    void _back() {
      setState(() {
        calculator.back();
      });
    }

    void _insertDecimal() {
      setState(() {
        calculator.insertDecimal();
      });
    }

    void _changeSignOfNumber() {
      setState(() {
        calculator.changeSignOfNumber();
      });
    }

    void _calculate() {
      setState(() {
        calculator.calculate();
      });
    }

    return Scaffold(
      backgroundColor: raisnBlack.shade900,
      appBar: new AppBar(
        title: Text("Calculator"),
      ),
      body: new Container(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new Row(
              children: [
                CalculatorDisplay(output: calculator.output),
              ],
            ),
            new Row(
              children: [
                CalculatorButton(
                  text: "C",
                  buttonColor: rubyRed,
                  onPressed: _clear,
                ),
                CalculatorButton(
                  text: "^",
                  onPressed: () => {},
                ),
                CalculatorButton(
                  icon: Icons.arrow_back,
                  onPressed: _back,
                ),
                CalculatorButton(
                  text: Operator.multpilication.operator,
                  splashColor: splashColor,
                  onPressed: () {
                    _onOperatorPress(Operator.multpilication.operator);
                  },
                ),
              ],
            ),
            new Row(
              children: [
                CalculatorButton(
                  text: "7",
                  buttonColor: numberButtonColor,
                  onPressed: () {
                    _processNumberPress("7");
                  },
                ),
                CalculatorButton(
                  text: "8",
                  buttonColor: numberButtonColor,
                  onPressed: () {
                    _processNumberPress("8");
                  },
                ),
                CalculatorButton(
                  text: "9",
                  buttonColor: numberButtonColor,
                  onPressed: () {
                    _processNumberPress("9");
                  },
                ),
                CalculatorButton(
                  text: Operator.subtraction.operator,
                  splashColor: splashColor,
                  onPressed: () {
                    _onOperatorPress(Operator.subtraction.operator);
                  },
                ),
              ],
            ),
            new Row(
              children: [
                CalculatorButton(
                  text: "4",
                  buttonColor: numberButtonColor,
                  onPressed: () {
                    _processNumberPress("4");
                  },
                ),
                CalculatorButton(
                  text: "5",
                  buttonColor: numberButtonColor,
                  onPressed: () {
                    _processNumberPress("5");
                  },
                ),
                CalculatorButton(
                  text: "6",
                  buttonColor: numberButtonColor,
                  onPressed: () {
                    _processNumberPress("6");
                  },
                ),
                CalculatorButton(
                  text: Operator.addition.operator,
                  splashColor: splashColor,
                  onPressed: () {
                    _onOperatorPress(Operator.addition.operator);
                  },
                ),
              ],
            ),
            new Row(
              children: [
                CalculatorButton(
                  text: "1",
                  buttonColor: numberButtonColor,
                  onPressed: () {
                    _processNumberPress("1");
                  },
                ),
                CalculatorButton(
                  text: "2",
                  buttonColor: numberButtonColor,
                  onPressed: () {
                    _processNumberPress("2");
                  },
                ),
                CalculatorButton(
                  text: "3",
                  buttonColor: numberButtonColor,
                  onPressed: () {
                    _processNumberPress("3");
                  },
                ),
                CalculatorButton(
                  text: Operator.division.operator,
                  splashColor: splashColor,
                  onPressed: () {
                    _onOperatorPress(Operator.division.operator);
                  },
                ),
                CalculatorButton(
                    text: "",
                    buttonColor: polishedPine.shade900,
                    onPressed: () {}),
                CalculatorButton(
                    text: "",
                    buttonColor: polishedPine.shade900,
                    onPressed: () {}),
                CalculatorButton(
                    text: "",
                    buttonColor: polishedPine.shade900,
                    onPressed: () {}),
              ],
            ),
            new Row(
              children: [
                CalculatorButton(
                  text: "0",
                  buttonColor: numberButtonColor,
                  onPressed: () {
                    _processNumberPress("0");
                  },
                ),
                CalculatorButton(
                  text: ".",
                  buttonColor: numberButtonColor,
                  onPressed: _insertDecimal,
                ),
                CalculatorButton(
                  text: "+/-",
                  buttonColor: numberButtonColor,
                  onPressed: _changeSignOfNumber,
                ),
                CalculatorButton(
                    text: "=",
                    buttonColor: polishedPine.shade900,
                    onPressed: _calculate),
                CalculatorButton(
                    text: "",
                    buttonColor: polishedPine.shade900,
                    onPressed: () {}),
                CalculatorButton(
                    text: "",
                    buttonColor: polishedPine.shade900,
                    onPressed: () {}),
                CalculatorButton(
                    text: "",
                    buttonColor: polishedPine.shade900,
                    onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
