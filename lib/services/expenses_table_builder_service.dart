import 'package:expensesapp/components/expense_tag_chip.dart';
import 'package:expensesapp/constants/color.dart';
import 'package:expensesapp/constants/strings.dart';
import 'package:expensesapp/models/expense.dart';
import 'package:flutter/material.dart';

import '../models/expenses_table.dart';

class ExpensesTableBuilderService {
  static List<String> getHeaders() => [
        StringConsts.EXPENSES_ID_LABEL,
        StringConsts.EXPENSES_DATE_LABEL,
        StringConsts.EXPENSES_DESCRIPTION_LABEL,
        StringConsts.EXPENSES_VALUE_LABEL,
        StringConsts.EXPENSES_DEPOSIT_ID_LABEL,
        StringConsts.EXPENSES_TAGS_LABEL,
      ];

  static List<String> _getValues(Expense expense, ExpensesTable table) => [
        expense.getId().toString(),
        expense.getFormattedDate(),
        expense.getDescription(),
        expense.getValue().toString(),
        table.depositList
            .firstWhere((e) => e.getId() == expense.getDepositId())
            .getName(),
      ];

  static List<List<String>> getValuesMatrix(
          List<Expense> expenses, ExpensesTable table) =>
      expenses.map((expense) => _getValues(expense, table)).toList();

  static Map<String, Color> _getColorMap(ExpensesTable table) {
    Map<String, Color> colorMap = {};
    for (var tag in table.tagList) {
      colorMap[tag.getName()] = tag.getColor();
    }
    return colorMap;
  }

  static List<DataRow> getRows(List<Expense> expenses, ExpensesTable table,
      Function(List<String> row) onTapRow) {
    Map<String, Color> colorMap = _getColorMap(table);

    var rows = <DataRow>[];
    for (var i = 0; i < expenses.length; i++) {
      rows.add(DataRow(
          cells: [
            DataCell(Text(_getValues(expenses[i], table)[0])),
            DataCell(Text(_getValues(expenses[i], table)[1])),
            DataCell(Text(_getValues(expenses[i], table)[2])),
            DataCell(Text(_getValues(expenses[i], table)[3])),
            DataCell(Text(_getValues(expenses[i], table)[4])),
            DataCell(Row(
              children: expenses[i]
                  .getTags()
                  .map((tag) => ExpenseTagChip(
                        title: tag,
                        color: colorMap[tag] ??
                            ColorConsts.DEFAULT_TAG_COLOR_NOT_FOUND,
                        padding: const EdgeInsets.only(right: 8.0),
                      ))
                  .toList(),
            ))
          ],
          onSelectChanged: (bool? selected) =>
              onTapRow(_getValues(expenses[i], table))));
    }
    return rows;
  }
}
