import 'package:flutter/material.dart';

import '../constants/strings.dart';
import '../models/deposit.dart';
import '../models/expense.dart';
import '../models/expense_tag.dart';
import '../models/expenses_table.dart';
import '../models/income.dart';

List<ExpensesTable> genTableList(int n) {
  return List.generate(n, (i) {
    var table =
        ExpensesTable(StringConsts.DEFAULT_TABLE_NAME + " " + i.toString());
    table
      ..addIncomeUsingAvailableId(Income(0))
      ..addIncomeUsingAvailableId(Income(0))
      ..addIncomeUsingAvailableId(Income(0))
      ..addIncomeUsingAvailableId(Income(0))
      ..addDepositUsingAvailableId(Deposit(0))
      ..addDepositUsingAvailableId(Deposit(0))
      ..addDepositUsingAvailableId(Deposit(0))
      ..addDepositUsingAvailableId(Deposit(0))
      ..addDepositUsingAvailableId(Deposit(0))
      ..addExpenseUsingAvailableId(Expense(0))
      ..addExpenseUsingAvailableId(Expense(0))
      ..addExpenseUsingAvailableId(Expense(0))
      ..addExpenseUsingAvailableId(Expense.withTags(0, ["Mensal"]))
      ..addExpenseUsingAvailableId(Expense.withTags(0, ["Mensal"]))
      ..addExpenseUsingAvailableId(Expense(0))
      ..addExpenseUsingAvailableId(Expense.withTags(0, ["Necessário"]))
      ..addExpenseUsingAvailableId(
          Expense.withTags(0, ["Mensal", "Necessário"]))
      ..addExpenseUsingAvailableId(Expense.withTags(0, ["Necessário"]))
      ..addExpenseUsingAvailableId(
          Expense.withTags(0, ["Mensal", "Necessário"]))
      ..addExpenseUsingAvailableId(
          Expense.withTags(0, ["Mensal", "Necessário"]))
      ..addExpenseUsingAvailableId(
          Expense.withTags(0, ["Mensal", "Necessário"]))
      ..addExpenseUsingAvailableId(Expense.withTags(0, ["Mensal"]))
      ..addExpenseUsingAvailableId(Expense.withTags(0, ["Necessário"]))
      ..addExpenseUsingAvailableId(Expense.withTags(0, ["Necessário"]))
      ..addExpenseUsingAvailableId(
          Expense.withTags(0, ["Mensal", "Necessário"]))
      ..addExpenseUsingAvailableId(Expense(0))
      ..addExpenseUsingAvailableId(Expense.withTags(0, ["Necessário"]))
      ..addExpenseUsingAvailableId(
          Expense.withTags(0, ["Mensal", "Não precisava"]))
      ..addExpenseUsingAvailableId(Expense.withTags(0, ["Necessário"]))
      ..addExpenseUsingAvailableId(
          Expense.withTags(0, ["Mensal", "Não precisava"]))
      ..addExpenseUsingAvailableId(
          Expense.withTags(0, ["Mensal", "Não precisava"]))
      ..addExpenseUsingAvailableId(Expense(0))
      ..addExpenseUsingAvailableId(Expense.withTags(0, ["Necessário"]))
      ..addExpenseUsingAvailableId(Expense.withTags(0, ["Não precisava"]))
      ..addExpenseUsingAvailableId(Expense.withTags(0, ["Mensal"]))
      ..addExpenseUsingAvailableId(
          Expense.withTags(0, ["Mensal", "Não precisava"]))
      ..addExpenseUsingAvailableId(Expense(0))
      ..addExpenseUsingAvailableId(Expense(0))
      ..addExpenseUsingAvailableId(
          Expense.withTags(0, ["Mensal", "Não precisava"]))
      ..addExpenseUsingAvailableId(Expense.withTags(0, ["Não precisava"]))
      ..addExpenseUsingAvailableId(Expense.withTags(0, ["Mensal"]))
      ..addExpenseUsingAvailableId(Expense.withTags(0, ["Não precisava"]))
      ..addExpenseUsingAvailableId(Expense.withTags(0, ["Não precisava"]))
      ..addExpenseUsingAvailableId(
          Expense.withTags(0, ["Mensal", "Não precisava"]))
      ..addExpenseUsingAvailableId(Expense.withTags(0, ["Não precisava"]))
      ..addExpenseUsingAvailableId(Expense.withTags(0, ["Não precisava"]))
      ..addTag(ExpenseTag.fromColor(name: "Mensal", color: Colors.deepOrange))
      ..addTag(ExpenseTag.fromColor(name: "Não precisava", color: Colors.cyan))
      ..addTag(ExpenseTag.fromColor(name: "Necessário", color: Colors.purple));
    return table;
  });
}
