import 'package:flutter/material.dart';

class ChartDataModel {
  final double domain;
  final double measure;
  final String? label;
  final Color? color;

  const ChartDataModel(this.domain, this.measure, {this.label, this.color});
}
