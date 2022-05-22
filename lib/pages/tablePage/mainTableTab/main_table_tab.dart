import 'package:expensesapp/components/expenses_data_table.dart';
import 'package:expensesapp/components/total_display.dart';
import 'package:expensesapp/pages/tablePage/mainTableTab/deposit_dialog.dart';
import 'package:expensesapp/pages/tablePage/mainTableTab/income_dialog.dart';
import 'package:expensesapp/pages/tablePage/mainTableTab/metrics_bottom_sheet.dart';
import 'package:expensesapp/services/calculate_total_after_discount_service.dart';
import 'package:expensesapp/services/deposit_before_decrement_table_builder_service.dart';
import 'package:expensesapp/services/income_table_builder_service.dart';
import 'package:expensesapp/services/manage_income_service.dart';
import 'package:flutter/material.dart';

import 'package:expensesapp/models/expenses_table.dart';

import '../../../constants/strings.dart';
import '../../../services/deposit_after_decrement_table_builder_service.dart';
import '../../../components/table_title.dart';
import '../../../services/manage_deposit_service.dart';

class MainTableTab extends StatelessWidget {
  final ExpensesTable table;

  const MainTableTab({Key? key, required this.table}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: ListView(
          children: <Widget>[
            // Income
            TableTitle(
              title: StringConsts.INCOME_TABLE_TITLE,
              hasButton: true,
              buttonCallback: () =>
                  showIncomeDialog(context: context, table: table),
            ),
            ExpensesDataTable(
              headers: IncomeTableBuilderService.getHeaders(),
              values:
                  IncomeTableBuilderService.getValuesMatrix(table.incomeList),
              onTapRow: (List<String> row) {
                showIncomeDialog(
                    context: context,
                    table: table,
                    oldIncome: ManageIncomeService.getIncomeByIdFromProvider(
                        context, table, int.parse(row[0])));
              },
            ),

            // Deposit (before)
            TableTitle(
              title: StringConsts.DEPOSIT_BEFORE_TABLE_TITLE,
              hasButton: true,
              buttonCallback: () =>
                  showDepositDialog(context: context, table: table),
            ),
            // TODO: Figure out how to make table fill screen when landscape
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ExpensesDataTable(
                headers: DepositBeforeDecrementTableBuilderService.getHeaders(),
                values:
                    DepositBeforeDecrementTableBuilderService.getValuesMatrix(
                        table.depositList),
                onTapRow: (List<String> row) {
                  showDepositDialog(
                      context: context,
                      table: table,
                      oldDeposit:
                          ManageDepositService.getDepositByIdFromProvider(
                              context, table, int.parse(row[0])));
                },
              ),
            ),

            // Deposit (after)
            const TableTitle(title: StringConsts.DEPOSIT_AFTER_TABLE_TITLE),
            // TODO: Figure out how to make table fill screen when landscape
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: ExpensesDataTable(
                headers: DepositAfterDecrementTableBuilderService.getHeaders(),
                values:
                    DepositAfterDecrementTableBuilderService.getValuesMatrix(
                        table.depositList, table.expenseList),
              ),
            ),

            const SizedBox(height: 70),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: TotalDisplay(
        widthFactor: 0.95,
        onTap: () => showMetricsBottomSheet(context: context, table: table),
        total: CalculateTotalAfterDiscountService.calculateReturnMoney(table),
      ),
    ));
  }
}
