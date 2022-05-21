import 'package:expensesapp/models/chart_model.dart';
import 'package:expensesapp/models/expense.dart';
import 'package:expensesapp/providers/tables_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/expenses_table.dart';

class ManageTableChartListService {
  static void addChartToTable(ExpensesTable table, ChartModel model) {
    table.chartList.add(model);
  }

  static void addChartToTableInProvider(
      BuildContext context, ExpensesTable table, ChartModel model) {
    var provider = Provider.of<TablesNotifier>(context, listen: false);
    addChartToTable(provider.findTable(table), model);
    provider.update();
  }

  static void removeChartFromTable(ExpensesTable table, ChartModel model) {
    table.chartList.remove(model);
  }

  static void removeChartFromTableInProvider(
      BuildContext context, ExpensesTable table, ChartModel model) {
    var provider = Provider.of<TablesNotifier>(context, listen: false);
    removeChartFromTable(provider.findTable(table), model);
    provider.update();
  }

  static void moveChart(
      ExpensesTable table, ChartModel model, int positionModifier) {
    var list = table.chartList;
    var currentIndex = list.indexOf(model);
    var newPosition = currentIndex + positionModifier;
    if (newPosition > list.length - 1 || newPosition < 0) return;
    list.insert(newPosition, list.removeAt(currentIndex));
  }

  static void moveChartInProvider(BuildContext context, ExpensesTable table,
      ChartModel model, int positionModifier) {
    var provider = Provider.of<TablesNotifier>(context, listen: false);
    moveChart(provider.findTable(table), model, positionModifier);
    provider.update();
  }

  static void moveChartDownInProvider(
      BuildContext context, ExpensesTable table, ChartModel model) {
    moveChartInProvider(context, table, model, 1);
  }

  static void moveChartUpInProvider(
      BuildContext context, ExpensesTable table, ChartModel model) {
    moveChartInProvider(context, table, model, -1);
  }

  static void replaceChart(
      ExpensesTable table, ChartModel oldModel, ChartModel newModel) {
    var list = table.chartList;
    var index = list.indexOf(oldModel);
    list.removeAt(index);
    list.insert(index, newModel);
  }

  static void replaceChartInProvider(BuildContext context, ExpensesTable table,
      ChartModel oldModel, ChartModel newModel) {
    var provider = Provider.of<TablesNotifier>(context, listen: false);
    replaceChart(provider.findTable(table), oldModel, newModel);
    provider.update();
  }

  static void addChart(ExpensesTable table, ChartModel model, {int? position}) {
    position != null
        ? table.chartList.insert(position, model)
        : table.chartList.add(model);
  }

  static void addChartInProvider(
      BuildContext context, ExpensesTable table, ChartModel model,
      {int? position}) {
    var provider = Provider.of<TablesNotifier>(context, listen: false);
    addChart(provider.findTable(table), model, position: position);
    provider.update();
  }
}
