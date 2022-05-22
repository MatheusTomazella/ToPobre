import 'package:expensesapp/providers/tables_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/expenses_table.dart';
import '../models/income.dart';

class ManageIncomeService {
  static Income getIncomeByIdFromProvider(
      BuildContext context, ExpensesTable table, int id) {
    var provider = Provider.of<TablesNotifier>(context, listen: false);
    return provider
        .findTable(table)
        .incomeList
        .firstWhere((e) => e.getId() == id);
  }

  static void addIncomeDefaultToTable(
      BuildContext context, ExpensesTable table) {
    var provider = Provider.of<TablesNotifier>(context, listen: false);
    provider.findTable(table).addIncomeUsingAvailableId(Income(0));
    provider.update();
  }

  static void addIncomeToTable(
      BuildContext context, ExpensesTable? table, Income income) {
    var provider = Provider.of<TablesNotifier>(context, listen: false);
    provider
        .findTable(table ?? provider.currentTable!)
        .addIncomeUsingAvailableId(income);
    provider.update();
  }

  static void updateIncome(BuildContext context, ExpensesTable table,
      Income oldIncome, Income newIncome) {
    var provider = Provider.of<TablesNotifier>(context, listen: false);
    provider
        .findTable(table)
        .incomeList
        .firstWhere((e) => e.getId() == oldIncome.getId())
        .update(newIncome);
    provider.update();
  }

  static void deleteIncome(
      BuildContext context, ExpensesTable table, Income income) {
    var provider = Provider.of<TablesNotifier>(context, listen: false);
    provider
        .findTable(table)
        .incomeList
        .removeWhere((element) => element.getId() == income.getId());
    provider.update();
  }
}
