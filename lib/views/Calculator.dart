import 'package:calculator/style/Colors.dart';
import 'package:calculator/style/calculator_constants.dart';
import 'package:calculator/views/calculator_button.dart';
import 'package:calculator/views/calculator_button_landscape.dart';
import 'package:calculator/views/calculator_text.dart';
import 'package:flutter/material.dart';
import 'calculator_display.dart';
import 'package:calculator/util/helper_methods.dart';

import 'calculator_display.dart';

// TODO: Fix on rotate....
// TODO: Pick a symbol for top right
// TODO: Should the erase button be red?
// TODO: Create list of strings for output - display only first 4 on screen.
// TODO: Drawer on right hand side for history?

enum Operator { multpilication, division, addition, subtraction }

extension operatorExtension on Operator {
  String get operator {
    switch (this) {
      case Operator.addition:
        return "+";
      case Operator.division:
        return "÷";
      case Operator.multpilication:
        return "×";
      case Operator.subtraction:
        return "−";
      default:
        return "";
    }
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String output = "";

  double firstOperand;
  double secondOperand;
  String operator;

  Color splashColor = raisnBlack.shade100;

  @override
  Widget build(BuildContext context) {
    Color numberButtonColor = raisnBlack.shade300;

    bool isNumeric(String s) {
      if (s == null) return false;
      return double.parse(s) != null;
    }

    void _onOperatorPress(String op) {
      setState(() {
        if (firstOperand == null && isNumeric(output)) {
          firstOperand = double.parse(output);
          output = output + " " + op + " ";
          splashColor = rubyRed;
          operator = op;
        } else {}
      });
    }

    void _processNumberPress(String number) {
      setState(() {
        output = output + number;
      });
    }

    void _clear() {
      setState(() {
        output = "";
        firstOperand = null;
        secondOperand = null;
        splashColor = raisnBlack.shade100;
      });
    }

    void _back() {
      setState(() {
        if (output.length > 0) {
          output = output.substring(0, output.length - 1);
        } else if (output != "" && output.length == 0) {
          output = output;
          output = output.substring(0, output.length - 1);
          output = "";
        }
      });
    }

    void _insertDecimal() {
      setState(() {
        if (!output.contains('.')) output = output + ".";
      });
    }

    void _changeSignOfNumber() {
      setState(() {
        if (output.startsWith("-"))
          output = output.replaceAll("-", "");
        else
          output = "-" + output;
      });
    }

    String _formatDouble(double d) {
      if (d % 1 == 0)
        return d.toStringAsFixed(0);
      else
        return d.toString();
    }

    void _calculate() {
      secondOperand = double.parse(output.substring(
          _formatDouble(firstOperand).length + 3, output.length));

      setState(() {
        double answer;
        if (operator == Operator.addition.operator) {
          answer = (firstOperand + secondOperand);
        } else if (operator == Operator.division.operator) {
          answer = firstOperand / secondOperand;
        } else if (operator == Operator.multpilication.operator) {
          answer = firstOperand * secondOperand;
        } else if (operator == Operator.subtraction.operator) {
          answer = firstOperand - secondOperand;
        }
        output = output + " = " + _formatDouble(answer);
      });
    }

    return Scaffold(
      backgroundColor: raisnBlack.shade900,
      appBar: new AppBar(
        title: Text("Calculator"),
      ),
      body: new Container(
          child:  
        new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            new Row(
              children: [
                CalculatorDisplay(
                  output: output
                ),
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
//                if (MediaQuery.of(context).orientation == Orientation.landscape)
                 CalculatorButtonLandscape(
                     text: "=",
                     buttonColor: polishedPine.shade900,
                     onPressed: _calculate),
//                if (MediaQuery.of(context).orientation == Orientation.landscape)
                                     CalculatorButtonLandscape(
                     text: "=",
                     buttonColor: polishedPine.shade900,
                     onPressed: _calculate),                    
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
