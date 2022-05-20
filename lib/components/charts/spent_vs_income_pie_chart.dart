import 'package:expensesapp/components/charts/donut_auto_label_chart.dart';
import 'package:expensesapp/models/chart_data_model.dart';
import 'package:expensesapp/models/chart_model.dart';
import 'package:expensesapp/models/expenses_table.dart';
import 'package:expensesapp/services/calculate_total_discount_service.dart';
import 'package:expensesapp/services/calculate_total_income_service.dart';
import 'package:expensesapp/utils/build_labels.dart';
import 'package:flutter/material.dart';

import '../../constants/strings.dart';

class SpentVsIncomePieChart extends StatelessWidget {
  final ExpensesTable table;
  final ChartModel chartModel;

  const SpentVsIncomePieChart(
      {Key? key, required this.table, required this.chartModel})
      : super(key: key);

  List<ChartDataModel> getData() {
    var total = CalculateTotalIncomeService.calculate(table);
    var spent = CalculateTotalDiscountService.fromList(table.expenseList)
        .amount
        .toDecimal()
        .toDouble();
    bool spentMoreThanHave = spent >= total;
    var percentageOfSpent = 100.0;
    if (total != 0) percentageOfSpent = spent / total * 100;
    double percentageOfRemaining =
        spentMoreThanHave ? 0 : 100 - percentageOfSpent;
    double remaining = total - spent;
    return [
      ChartDataModel(
        0,
        percentageOfSpent,
        label: buildNameAmountPercentageLabel(
            StringConsts.CHART_LABEL_SPENT, spent, percentageOfSpent),
      ),
      ChartDataModel(
        1,
        percentageOfRemaining,
        label: buildNameAmountPercentageLabel(
            StringConsts.CHART_LABEL_REMAINING,
            remaining,
            percentageOfRemaining),
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return DonutAutoLabelChart.fromData(getData());
  }
}
