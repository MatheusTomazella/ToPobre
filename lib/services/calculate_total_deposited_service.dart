import 'package:expensesapp/models/expenses_table.dart';
import 'package:expensesapp/providers/tables_notifier.dart';
import 'package:expensesapp/services/calculate_deposit_values_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CalculateTotalDepositedService {
  static double calculate(ExpensesTable table) {
    return table.depositList.fold(
        0.0,
        (previousValue, element) =>
            previousValue +
            CalculateDepositValuesService.getBeforeDiscountValue(element)
                .amount
                .toDecimal()
                .toDouble());
  }

  static double calculateFromProvider(
      BuildContext context, ExpensesTable table) {
    return calculate(Provider.of<TablesNotifier>(context).findTable(table));
  }
}
