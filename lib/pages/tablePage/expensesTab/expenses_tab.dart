import 'package:expensesapp/models/expenses_table.dart';
import 'package:expensesapp/pages/tablePage/expensesTab/expense_dialog.dart';
import 'package:expensesapp/components/total_display.dart';
import 'package:expensesapp/services/calculate_total_discount_service.dart';
import 'package:expensesapp/services/manage_expense_service.dart';
import 'package:flutter/material.dart';

import '../../../components/expenses_data_table.dart';
import '../../../components/table_title.dart';
import '../../../constants/strings.dart';
import '../../../services/expenses_table_builder_service.dart';

bool argsRead = false;

// ignore: must_be_immutable
class ExpensesTab extends StatelessWidget {
  ExpensesTable table;
  Map<String, dynamic> args;

  ExpensesTab({Key? key, required this.table, this.args = const {}})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      if (argsRead) return;
      argsRead = true;
      if (args['openAddModal'] == true) {
        args['openAddModal'] = false;
        showExpenseDialog(
          context: context,
          table: table,
        );
      }
    });

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: ListView(
          children: <Widget>[
            const TableTitle(title: StringConsts.EXPENSES_TABLE_TITLE),
            // TODO: Figure out how to make table fill screen when landscape
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(bottom: 80),
              child: ExpensesDataTable.usingRows(
                headers: ExpensesTableBuilderService.getHeaders(),
                rows: ExpensesTableBuilderService.getRows(
                    table.expenseList
                      ..sort(((a, b) => a.getDate().compareTo(b.getDate()))),
                    table, (List<String> row) {
                  showExpenseDialog(
                    context: context,
                    table: table,
                    oldExpense: ManageExpenseService.getExpenseByIdFromProvider(
                        context, table, int.parse(row[0])),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Flexible(
            child: TotalDisplay(
                total:
                    CalculateTotalDiscountService.fromList(table.expenseList)),
          ),
          FloatingActionButton(
            heroTag: 'addExpense',
            onPressed: () => showExpenseDialog(context: context, table: table),
            child: const Icon(Icons.add),
          ),
        ],
      ),
    ));
  }
}
