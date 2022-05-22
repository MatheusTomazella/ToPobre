import 'package:expensesapp/constants/currency.dart';
import 'package:expensesapp/models/expenses_table.dart';
import 'package:expensesapp/providers/tables_notifier.dart';
import 'package:expensesapp/services/calculate_deposit_values_service.dart';
import 'package:flutter/material.dart';
import 'package:money2/money2.dart';
import 'package:provider/provider.dart';

class CalculateTotalDepositedService {
  static double calculate(ExpensesTable table) {
    return calculateReturnMoney(table).amount.toDecimal().toDouble();
  }

  static Money calculateReturnMoney(ExpensesTable table) {
    return table.depositList.fold(
        Money.fromNum(0, code: CurrencyConsts.DEFAULT_CURRENCY_CODE),
        (Money previousValue, element) =>
            previousValue +
            CalculateDepositValuesService.getBeforeDiscountValue(element));
  }

  static double calculateFromProvider(
      BuildContext context, ExpensesTable table) {
    return calculate(Provider.of<TablesNotifier>(context).findTable(table));
  }
}
