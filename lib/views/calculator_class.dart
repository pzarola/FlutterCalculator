import 'package:calculator/util/operator_extension.dart';

class CalculatorClass {
  String output = "";
  double firstOperand;
  double secondOperand;
  String operator;
  bool _equalPressed;

  CalculatorClass() {
    output = "";
    firstOperand = null;
    secondOperand = null;
    operator = "";
  }
  bool isNumeric(String s) {
    if (s == null) return false;
    return double.parse(s) != null;
  }

  String formatDouble(double d) {
    if (d % 1 == 0)
      return d.toStringAsFixed(0);
    else
      return d.toString();
  }

  void processNumberPress(String number) {
    // if (firstOperand == null && secondOperand == null && output != "") {
    //   output = "";
    // }
    if (_equalPressed == true) {
      _equalPressed = false;
      output = "";
    }
    output = output + number;
  }

  void clear() {
    output = "";
    firstOperand = null;
    secondOperand = null;
  }

  void back() {
    if (output.length > 0) {
      output = output.substring(0, output.length - 1);
    } else if (output != "" && output.length == 0) {
      output = output;
      output = output.substring(0, output.length - 1);
      output = "";
    }
  }

  void insertDecimal() {
    if (!output.contains('.')) output = output + ".";
  }

  void changeSignOfNumber() {
    if (output.startsWith("-"))
      output = output.replaceAll("-", "");
    else
      output = "-" + output;
  }

  bool onOperatorPress(String op) {
    if (firstOperand == null && isNumeric(output)) {
      firstOperand = double.parse(output);
      output = output + " " + op + " ";
      operator = op;
      return true;
    } else {
      return false;
    }
  }

  void calculate() {
    secondOperand = double.parse(
        output.substring(formatDouble(firstOperand).length + 3, output.length));
    double answer = _calculate(firstOperand, secondOperand, operator);
    output = output + " = " + formatDouble(answer);
    firstOperand = null;
    secondOperand = null;
    operator = "";
    _equalPressed = true;
  }

  double _calculate(
      double firstOperand, double secondOperand, String operator) {
    if (operator == Operator.addition.operator) {
      return (firstOperand + secondOperand);
    } else if (operator == Operator.division.operator) {
      return (firstOperand / secondOperand);
    } else if (operator == Operator.multpilication.operator) {
      return (firstOperand * secondOperand);
    } else if (operator == Operator.subtraction.operator) {
      return (firstOperand - secondOperand);
    }
    return -9999999999999999999.9999;
  }
}
