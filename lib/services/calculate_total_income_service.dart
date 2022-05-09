import 'package:expensesapp/models/expenses_table.dart';
import 'package:expensesapp/providers/tables_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculateTotalIncomeService {
  static double calculate(ExpensesTable table) {
    return table.incomeList.fold(
        0.0,
        (previousValue, element) =>
            previousValue + element.getValue().amount.toDecimal().toDouble());
  }

  static double calculateFromProvider(
      BuildContext context, ExpensesTable table) {
    return calculate(Provider.of<TablesNotifier>(context).findTable(table));
  }
}
