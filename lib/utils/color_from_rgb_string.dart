import 'package:expensesapp/constants/color.dart';
import 'package:flutter/material.dart';

Color colorFromRgbString(String rgbString) {
  List<String> rgbList = rgbString.split(',');
  if (rgbList.length != 3) {
    return colorFromRgbString(ColorConsts.DEFAULT_TAG_COLOR_STRING);
  }
  int r = int.parse(rgbList[0]);
  int g = int.parse(rgbList[1]);
  int b = int.parse(rgbList[2]);
  return Color.fromARGB(1, r, g, b);
}
