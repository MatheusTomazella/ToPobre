import 'package:expensesapp/constants/chart_types.dart';
import 'package:expensesapp/models/chart_model.dart';
import 'package:expensesapp/services/manage_table_chart_list_service.dart';
import 'package:flutter/material.dart';

import '../../../constants/strings.dart';
import '../../../models/expenses_table.dart';
import '../../utils/get_default_chart_title.dart';
import 'information_dialog.dart';

List<DropdownMenuItem<CHART_TYPES>> chartOptions = [
  CHART_TYPES.SPENT_VS_DEPOSITED_PIE,
  CHART_TYPES.SPENT_VS_INCOME_PIE,
  CHART_TYPES.TAG_PIE,
]
    .map((type) => DropdownMenuItem(
          child: Text(getDefaultChartTitle(type, includeChartType: true)),
          value: type,
        ))
    .toList();

Future<void> showNewChartDialog({
  required BuildContext context,
  required ExpensesTable table,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      CHART_TYPES selectedChartType = chartOptions[0].value!;

      bool validate() {
        void showError(String text) {
          showInformationDialog(
              context: context,
              title: StringConsts.NEW_CHART_DIALOG_ERROR_TITLE,
              text: text,
              primaryColor: Colors.redAccent,
              onConfirm: () {
                Navigator.pop(context);
                Navigator.pop(context);
              });
        }

        if ((selectedChartType == CHART_TYPES.TAG_BAR ||
                selectedChartType == CHART_TYPES.TAG_PIE) &&
            table.tagList.length < 2) {
          showError(StringConsts.NEW_CHART_DIALOG_ERROR_MINIMUM_TAGS);
          return false;
        }
        return true;
      }

      ChartModel generateModel() {
        var model = ChartModel(type: selectedChartType);
        if (selectedChartType == CHART_TYPES.TAG_BAR ||
            selectedChartType == CHART_TYPES.TAG_PIE) {
          model.tags = table.tagList.map((e) => e.getName()).toList();
        }
        return model;
      }

      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text(StringConsts.NEW_CHART_DIALOG_TITLE),
            scrollable: true,
            content: SingleChildScrollView(
                child: ListBody(
              children: [
                DropdownButton(
                  isExpanded: true,
                  items: chartOptions,
                  onChanged: (CHART_TYPES? type) => setState(() {
                    selectedChartType = type ?? selectedChartType;
                  }),
                  value: selectedChartType,
                )
              ],
            )),
            actions: <Widget>[
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  primary: Colors.greenAccent,
                  side: const BorderSide(color: Colors.greenAccent),
                ),
                child: const Text(StringConsts.NEW_CHART_DIALOG_CANCEL),
              ),
              ElevatedButton(
                onPressed: () {
                  if (!validate()) return;
                  ManageTableChartListService.addChartInProvider(
                      context, table, generateModel());
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(primary: Colors.greenAccent),
                child: const Text(StringConsts.NEW_CHART_DIALOG_SAVE),
              ),
            ],
          );
        },
      );
    },
  );
}
