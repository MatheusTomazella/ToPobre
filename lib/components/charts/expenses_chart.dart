// ignore_for_file: constant_identifier_names
import 'package:expensesapp/components/charts/spent_vs_income_pie_chart.dart';
import 'package:expensesapp/components/charts/spent_vs_total_pie_chart.dart';
import 'package:expensesapp/components/charts/tag_pie_chart.dart';
import 'package:expensesapp/components/dialogs/chart_rename_dialog.dart';
import 'package:expensesapp/constants/chart_types.dart';
import 'package:expensesapp/constants/strings.dart';
import 'package:expensesapp/models/chart_model.dart';
import 'package:expensesapp/models/expenses_table.dart';
import 'package:expensesapp/services/manage_table_chart_list_service.dart';
import 'package:expensesapp/utils/chart_type_to_dialog.dart';
import 'package:flutter/material.dart';

import '../dialogs/confirmation_dialog.dart';

// ignore: must_be_immutable
class ExpensesChart extends StatelessWidget {
  ExpensesTable table;
  ChartModel chartModel;

  ExpensesChart({Key? key, required this.table, required this.chartModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget? chartWidget;

    switch (chartModel.type) {
      case CHART_TYPES.SPENT_VS_DEPOSITED_PIE:
        chartWidget =
            SpentVsTotalPieChart(table: table, chartModel: chartModel);
        break;
      case CHART_TYPES.SPENT_VS_INCOME_PIE:
        chartWidget =
            SpentVsIncomePieChart(table: table, chartModel: chartModel);
        break;
      case CHART_TYPES.PREVIOUS_CURRENT_COMPARISON_BAR:
        // TODO: Handle this case.
        break;
      case CHART_TYPES.TAG_PIE:
        chartWidget = TagPieChart(table: table, chartModel: chartModel);
        break;
      case CHART_TYPES.TAG_BAR:
        // TODO: Handle this case.
        break;
      case CHART_TYPES.DEPOSIT_DISTRIBUTION_DOUBLE_BAR:
        // TODO: Handle this case.
        break;
    }

    List<PopupMenuItem> options = [
      PopupMenuItem(
        child: Row(
          children: const [
            Icon(Icons.edit, color: Colors.orange),
            SizedBox(width: 10),
            Text(StringConsts.CHART_POPUP_MENU_RENAME),
          ],
        ),
        value: 'rename',
      ),
      PopupMenuItem(
        child: Row(
          children: const [
            Icon(Icons.delete, color: Colors.redAccent),
            SizedBox(width: 10),
            Text(StringConsts.CHART_POPUP_MENU_DELETE),
          ],
        ),
        value: 'delete',
      ),
      PopupMenuItem(
        child: Row(
          children: const [
            Icon(Icons.arrow_upward, color: Colors.black87),
            SizedBox(width: 10),
            Text(StringConsts.CHART_POPUP_MENU_UP),
          ],
        ),
        value: 'up',
      ),
      PopupMenuItem(
        child: Row(
          children: const [
            Icon(Icons.arrow_downward, color: Colors.black87),
            SizedBox(width: 10),
            Text(StringConsts.CHART_POPUP_MENU_DOWN),
          ],
        ),
        value: 'down',
      ),
    ];
    var dialog = chartTypeToDialog(chartModel.type);
    if (dialog != null) {
      options.insert(
          1,
          PopupMenuItem(
            child: Row(
              children: const [
                Icon(Icons.settings, color: Colors.blue),
                SizedBox(width: 10),
                Text(StringConsts.CHART_POPUP_MENU_CONFIG),
              ],
            ),
            value: 'edit',
          ));
    }

    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 320,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    const SizedBox(width: 20),
                    Text(
                      chartModel.title,
                      style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 50,
              child: PopupMenuButton(
                itemBuilder: (context) {
                  return options;
                },
                onSelected: (value) {
                  if (value == 'delete') {
                    showConfirmationDialog(
                        context: context,
                        title: StringConsts.CHART_DELETE_DIALOG_TITLE,
                        text: StringConsts.CHART_DELETE_DIALOG_TEXT,
                        cancelText: StringConsts.CHART_DELETE_DIALOG_CANCEL,
                        confirmText: StringConsts.CHART_DELETE_DIALOG_CONFIRM,
                        onConfirm: () {
                          ManageTableChartListService
                              .removeChartFromTableInProvider(
                                  context, table, chartModel);
                          Navigator.pop(context);
                        });
                  } else if (value == 'rename') {
                    showChartRenameDialog(
                        context: context, table: table, model: chartModel);
                  } else if (value == 'edit') {
                    dialog!(context: context, table: table, model: chartModel);
                  } else if (value == 'up') {
                    ManageTableChartListService.moveChartUpInProvider(
                        context, table, chartModel);
                  } else if (value == 'down') {
                    ManageTableChartListService.moveChartDownInProvider(
                        context, table, chartModel);
                  }
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 300,
          child: chartWidget ?? const Text(StringConsts.FAILED_TO_LOAD_CHART),
        ),
      ],
    );
  }
}
