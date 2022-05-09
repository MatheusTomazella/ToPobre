import 'package:expensesapp/components/charts/expenses_chart.dart';
import 'package:expensesapp/constants/chart_types.dart';
import 'package:expensesapp/models/chart_model.dart';
import 'package:flutter/material.dart';

import 'package:expensesapp/models/expenses_table.dart';

class ChartsTab extends StatelessWidget {
  final ExpensesTable table;

  const ChartsTab({Key? key, required this.table}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            ExpensesChart(
              table: table,
              chartModel:
                  ChartModel(title: '', type: CHART_TYPES.SPENT_VS_TOTAL_PIE),
            ),
          ],
        ),
      ),
    ));
  }
}
