import 'package:expensesapp/components/charts/donut_auto_label_chart.dart';
import 'package:expensesapp/models/expenses_table.dart';
import 'package:expensesapp/utils/money_to_double.dart';
import 'package:flutter/material.dart';

import '../../models/chart_data_model.dart';
import '../../models/chart_model.dart';
import '../../utils/build_labels.dart';

class TagPieChart extends StatelessWidget {
  final ExpensesTable table;
  final ChartModel chartModel;

  const TagPieChart({Key? key, required this.table, required this.chartModel})
      : super(key: key);

  double getSpentForTag(String tag) {
    return table.expenseList.fold(0.0, (prev, e) {
      if (e.getTags().contains(tag)) {
        return prev + e.getValue().toDouble();
      }
      return prev;
    });
  }

  Map<String, double> getExpensesMap(List<String> tags) {
    return Map.fromEntries(
        tags.map((tag) => MapEntry(tag, getSpentForTag(tag))));
  }

  List<ChartDataModel> getData() {
    var map = getExpensesMap(chartModel.tags!);
    double total = map.values.fold(0.0, (prev, e) => prev + e);
    var keys = map.keys.toList();
    var values = map.values.toList();
    List<ChartDataModel> result = [];
    for (int i = 0; i < keys.length; i++) {
      var key = keys[i];
      var value = values[i];
      var percentage = value / total * 100;
      result.add(ChartDataModel(
        i.toDouble(),
        percentage,
        label: buildNameAmountPercentageLabel(key, value, percentage),
        color: table.tagList
            .firstWhere((element) => element.getName() == key)
            .getColor(),
      ));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return DonutAutoLabelChart.fromData(getData());
  }
}
