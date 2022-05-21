import 'package:expensesapp/components/charts/expenses_chart.dart';
import 'package:expensesapp/components/dialogs/new_chart_dialog.dart';
import 'package:expensesapp/constants/strings.dart';
import 'package:flutter/material.dart';

import 'package:expensesapp/models/expenses_table.dart';

class ChartsTab extends StatelessWidget {
  final ExpensesTable table;

  const ChartsTab({Key? key, required this.table}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var charts = table.chartList
        .map((model) => ExpensesChart(table: table, chartModel: model))
        .toList();

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            ...charts,
            const SizedBox(height: 20),
            FractionallySizedBox(
              widthFactor: 0.8,
              child: OutlinedButton(
                onPressed: () {
                  showNewChartDialog(context: context, table: table);
                },
                child: const Text(StringConsts.ADD_CHART_BUTTON),
                style: OutlinedButton.styleFrom(
                    primary: Colors.greenAccent,
                    side: const BorderSide(color: Colors.greenAccent)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    ));
  }
}
