import 'package:expensesapp/providers/tables_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/expense.dart';
import '../models/expenses_table.dart';

class ManageExpenseService {
  static Expense getExpenseByIdFromProvider(BuildContext context, ExpensesTable table, int id) {
    var provider = Provider.of<TablesNotifier>(context, listen: false );
    return provider.findTable(table).expenseList
        .firstWhere((e) => e.getId() == id);
  }
}
