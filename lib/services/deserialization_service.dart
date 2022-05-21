import 'dart:convert';

import 'package:expensesapp/models/chart_model.dart';
import 'package:expensesapp/models/deposit.dart';
import 'package:expensesapp/models/expense.dart';
import 'package:expensesapp/models/expense_tag.dart';
import 'package:expensesapp/models/expenses_table.dart';
import 'package:expensesapp/models/income.dart';
import 'package:expensesapp/utils/chart_type_from_string.dart';
import 'package:expensesapp/utils/double_string_to_money.dart';

class DeserializationService {
  static List<ExpensesTable> deserializeTableList(String serializedString) {
    var list = jsonDecode(serializedString);
    return List<ExpensesTable>.from(
        list.map((tableString) => deserializeTable(tableString)).toList());
  }

  static ExpensesTable deserializeTable(String serializedString) {
    var map = jsonDecode(serializedString);
    return ExpensesTable.filled(
      map["name"],
      DateTime.parse(map["creationDate"]),
      map["favorite"] == true,
      deserializeIncomeList(map["incomeList"]),
      deserializeDepositList(map["depositList"]),
      deserializeExpenseList(map["expenseList"]),
      deserializeTagList(map["tagList"]),
      deserializeChartList(map["chartList"]),
    );
  }

  static List<Income> deserializeIncomeList(List<dynamic> list) {
    return list.map((incomeString) => deserializeIncome(incomeString)).toList();
  }

  static Income deserializeIncome(String serializedString) {
    var map = jsonDecode(serializedString);
    return Income.filled(
      int.parse(map["id"]),
      map["description"],
      doubleStringToMoney(map["value"]),
    );
  }

  static List<Deposit> deserializeDepositList(List<dynamic> list) {
    return list.map((depositList) => deserializeDeposit(depositList)).toList();
  }

  static Deposit deserializeDeposit(String serializedString) {
    var map = jsonDecode(serializedString);
    return Deposit.filled(
      int.parse(map["id"]),
      map["name"],
      doubleStringToMoney(map["previous"]),
      doubleStringToMoney(map["increment"]),
    );
  }

  static List<Expense> deserializeExpenseList(List<dynamic> list) {
    return list
        .map((expenseString) => deserializeExpense(expenseString))
        .toList();
  }

  static Expense deserializeExpense(String serializedString) {
    var map = jsonDecode(serializedString);
    return Expense.filled(
      int.parse(map["id"]),
      DateTime.parse(map["date"]),
      map["description"],
      int.parse(map["depositId"]),
      doubleStringToMoney(map["value"]),
      List<String>.from(map["tags"]),
    );
  }

  static List<ExpenseTag> deserializeTagList(List<dynamic> list) {
    return list.map((tagString) => deserializeTag(tagString)).toList();
  }

  static ExpenseTag deserializeTag(String serializedString) {
    var map = jsonDecode(serializedString);
    return ExpenseTag.fromRgbString(name: map["name"], rgbString: map["color"]);
  }

  static List<ChartModel> deserializeChartList(List<dynamic> list) {
    return list.map((chartString) => deserializeChart(chartString)).toList();
  }

  static ChartModel deserializeChart(String serializedString) {
    var map = jsonDecode(serializedString);
    return ChartModel.filled(
      uuid: map['uuid'],
      title: map['title'],
      type: chartTypeFromString(map['type']),
      tags: List<String>.from(map['tags']),
    );
  }
}
