import 'package:flutter/material.dart';

double containerWidth(BuildContext context) {
  return (MediaQuery.of(context).size.width -
      ((MediaQuery.of(context).size.width / 25) * 2));
}

double deviceHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}
