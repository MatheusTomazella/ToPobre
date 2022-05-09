// ignore_for_file: constant_identifier_names

import 'package:expensesapp/components/charts/spent_vs_income_pie_chart.dart';
import 'package:expensesapp/components/charts/spent_vs_total_pie_chart.dart';
import 'package:expensesapp/constants/chart_types.dart';
import 'package:expensesapp/models/chart_model.dart';
import 'package:expensesapp/models/expenses_table.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExpensesChart extends StatelessWidget {
  ExpensesTable table;
  ChartModel chartModel;

  ExpensesChart({Key? key, required this.table, required this.chartModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? chartWidget;

    switch (chartModel.type) {
      case CHART_TYPES.SPENT_VS_TOTAL_PIE:
        chartWidget =
            SpentVsTotalPieChart(table: table, chartModel: chartModel);
        break;
      case CHART_TYPES.SPENT_VS_INCOME_PIE:
        chartWidget =
            SpentVsIncomePieChart(table: table, chartModel: chartModel);
        break;
      case CHART_TYPES.PREVIOUS_CURRENT_COMPARISON_BAR:
        // TODO: Handle this case.
        break;
      case CHART_TYPES.TAG_PIE:
        // TODO: Handle this case.
        break;
      case CHART_TYPES.TAG_BAR:
        // TODO: Handle this case.
        break;
    }
    if (chartWidget == null) return const Text("Failed to render chart");
    return Column(
      children: [
        const SizedBox(height: 20),
        Text(
          chartModel.title,
          style: const TextStyle(
            color: Colors.black54,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(
          height: 300,
          child: chartWidget,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
