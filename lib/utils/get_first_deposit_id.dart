import 'package:expensesapp/models/expenses_table.dart';

int getFirstDepositId(ExpensesTable table) {
  return table.depositList.first.getId();
}