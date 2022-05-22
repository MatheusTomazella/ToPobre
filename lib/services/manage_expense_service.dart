import 'package:expensesapp/providers/tables_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/expense.dart';
import '../models/expenses_table.dart';

class ManageExpenseService {
  static Expense getExpenseByIdFromProvider(
      BuildContext context, ExpensesTable table, int id) {
    var provider = Provider.of<TablesNotifier>(context, listen: false);
    return provider
        .findTable(table)
        .expenseList
        .firstWhere((e) => e.getId() == id);
  }

  static void addExpenseDefaultToTable(
      BuildContext context, ExpensesTable table) {
    var provider = Provider.of<TablesNotifier>(context, listen: false);
    provider.findTable(table).addExpenseUsingAvailableId(Expense(0));
    provider.update();
  }

  static void addExpenseToTable(
      BuildContext context, ExpensesTable? table, Expense expense) {
    var provider = Provider.of<TablesNotifier>(context, listen: false);
    provider
        .findTable(table ?? provider.currentTable!)
        .addExpenseUsingAvailableId(expense);
    provider.update();
  }

  static void updateExpense(BuildContext context, ExpensesTable table,
      Expense oldExpense, Expense newExpense) {
    var provider = Provider.of<TablesNotifier>(context, listen: false);
    provider
        .findTable(table)
        .expenseList
        .firstWhere((e) => e.getId() == oldExpense.getId())
        .update(newExpense);
    provider.update();
  }

  static void deleteExpense(
      BuildContext context, ExpensesTable table, Expense expense) {
    var provider = Provider.of<TablesNotifier>(context, listen: false);
    provider
        .findTable(table)
        .expenseList
        .removeWhere((element) => element.getId() == expense.getId());
    provider.update();
  }
}
