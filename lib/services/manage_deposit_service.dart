import 'package:expensesapp/models/deposit.dart';
import 'package:expensesapp/providers/tables_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/expenses_table.dart';

class ManageDepositService {
  static Deposit getDepositByIdFromProvider(
      BuildContext context, ExpensesTable table, int id) {
    var provider = Provider.of<TablesNotifier>(context, listen: false);
    return provider
        .findTable(table)
        .depositList
        .firstWhere((e) => e.getId() == id);
  }

  static void addDepositDefaultToTable(
      BuildContext context, ExpensesTable table) {
    var provider = Provider.of<TablesNotifier>(context, listen: false);
    provider.findTable(table).addDepositUsingAvailableId(Deposit(0));
    provider.update();
  }

  static void addDepositToTable(
      BuildContext context, ExpensesTable? table, Deposit deposit) {
    var provider = Provider.of<TablesNotifier>(context, listen: false);
    provider
        .findTable(table ?? provider.currentTable!)
        .addDepositUsingAvailableId(deposit);
    provider.update();
  }

  static void updateDeposit(BuildContext context, ExpensesTable table,
      Deposit oldDeposit, Deposit newDeposit) {
    var provider = Provider.of<TablesNotifier>(context, listen: false);
    provider
        .findTable(table)
        .depositList
        .firstWhere((e) => e.getId() == oldDeposit.getId())
        .update(newDeposit);
    provider.update();
  }

  static Map<int, String> getDepositIdsAndNames(
      BuildContext context, ExpensesTable table) {
    return Provider.of<TablesNotifier>(context, listen: false)
        .findTable(table)
        .depositList
        .fold(<int, String>{}, (Map<int, String> map, Deposit deposit) {
      map[deposit.getId()] = deposit.name;
      return map;
    });
  }

  static void deleteDeposit(
      BuildContext context, ExpensesTable table, Deposit deposit) {
    var provider = Provider.of<TablesNotifier>(context, listen: false);
    provider
        .findTable(table)
        .depositList
        .removeWhere((element) => element.getId() == deposit.getId());
    provider.update();
  }
}
