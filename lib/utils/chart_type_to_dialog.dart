import 'package:expensesapp/components/dialogs/tag_chart_dialog.dart';
import 'package:expensesapp/constants/chart_types.dart';
import 'package:expensesapp/models/chart_model.dart';
import 'package:expensesapp/models/expenses_table.dart';
import 'package:flutter/material.dart';

Future<void> Function(
    {required BuildContext context,
    required ChartModel model,
    required ExpensesTable table})? chartTypeToDialog(CHART_TYPES type) {
  if (type == CHART_TYPES.TAG_PIE || type == CHART_TYPES.TAG_BAR) {
    return showTagChartDialog;
  }
  return null;
}
