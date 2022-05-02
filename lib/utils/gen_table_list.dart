import '../constants/strings.dart';
import '../models/deposit.dart';
import '../models/expense.dart';
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
      ..addExpenseUsingAvailableId(Expense.withTags(0, ["Não precisava"]));
    return table;
  });
}
