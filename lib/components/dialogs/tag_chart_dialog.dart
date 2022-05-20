import 'package:expensesapp/components/dialogs/confirmation_dialog.dart';
import 'package:expensesapp/models/chart_model.dart';
import 'package:expensesapp/services/manage_table_chart_list_service.dart';
import 'package:flutter/material.dart';

import '../../../components/dialogs/information_dialog.dart';
import '../../../constants/strings.dart';
import '../../../models/expenses_table.dart';
import '../../../components/tag_selector.dart';

Future<void> showTagChartDialog({
  required BuildContext context,
  required ExpensesTable table,
  required ChartModel model,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      var newModel = ChartModel.from(model);

      bool validate() {
        void showError(String text) {
          showInformationDialog(
              context: context,
              title: StringConsts.TAG_CHART_CONFIG_DIALOG_ERROR_TITLE,
              text: text,
              primaryColor: Colors.redAccent,
              onConfirm: () {
                Navigator.pop(context);
                Navigator.pop(context);
              });
        }

        if (newModel.tags!.length < 2) {
          showError(StringConsts.TAG_CHART_CONFIG_DIALOG_ERROR_MINIMUM_TAGS);
          return false;
        }
        return true;
      }

      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text(StringConsts.TAG_CHART_CONFIG_DIALOG_TITLE),
            scrollable: true,
            content: SingleChildScrollView(
                child: ListBody(
              children: [
                TagSelector(
                    table: table,
                    selected: newModel.tags!,
                    onChange: (List<String> selected) {
                      setState(() {
                        newModel.tags = selected;
                      });
                    })
              ],
            )),
            actions: <Widget>[
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                style: OutlinedButton.styleFrom(
                  primary: Colors.blue,
                  side: const BorderSide(color: Colors.blue),
                ),
                child: const Text(StringConsts.TAG_CHART_CONFIG_DIALOG_CANCEL),
              ),
              ElevatedButton(
                onPressed: () {
                  showConfirmationDialog(
                    context: context,
                    title:
                        StringConsts.TAG_CHART_CONFIG_DIALOG_CONFIRMATION_TITLE,
                    text:
                        StringConsts.TAG_CHART_CONFIG_DIALOG_CONFIRMATION_TEXT,
                    onConfirm: () {
                      if (!validate()) return;
                      ManageTableChartListService.replaceChartInProvider(
                          context, table, model, newModel);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  );
                },
                style: ElevatedButton.styleFrom(primary: Colors.blue),
                child: const Text(StringConsts.TAG_CHART_CONFIG_DIALOG_SAVE),
              ),
            ],
          );
        },
      );
    },
  );
}
