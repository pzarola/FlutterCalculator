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