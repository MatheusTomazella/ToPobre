import 'package:expensesapp/constants/color.dart';
import 'package:expensesapp/utils/color_utils.dart';
import 'package:flutter/material.dart';

import '../constants/strings.dart';

class ExpenseTag {
  String _name = StringConsts.DEFAULT_EXPENSE_TAG_NAME;
  Color _color = colorFromRgbString(ColorConsts.DEFAULT_TAG_COLOR_STRING);

  ExpenseTag.fromColor({required String name, required Color color}) {
    setName(name);
    setColor(color);
  }
  ExpenseTag.fromRgbString({required String name, required String rgbString}) {
    setName(name);
    setColor(rgbString.toColor());
  }

  String getName() => _name;
  void setName(String name) {
    if (name.isEmpty) throw Exception("Tag name cannot be empty");
    _name = name;
  }

  Color getColor() => _color;
  void setColor(Color color) => _color = color;
}
