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
              title: StringConsts.INVALID_EXPENSE_DIALOG_TITLE,
              text: text,
              primaryColor: Colors.redAccent,
              onConfirm: () {
                Navigator.pop(context);
                Navigator.pop(context);
              });
        }

        if (newModel.tags!.length < 2) {
          showError('minimum 2 tags change later');
          return false;
        }
        return true;
      }

      return StatefulBuilder(
        builder: (context, setState) {
          return AlertDialog(
            title: const Text('tag config dialog change later'),
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
                child: const Text('cancel change later'),
              ),
              ElevatedButton(
                onPressed: () {
                  showConfirmationDialog(
                    context: context,
                    title: 'confirm change later',
                    text: 'rly wnna do dis? change later',
                    onConfirm: () {
                      if (!validate()) return;
                      ManageTableChartListService.replaceChartInProvider(
                          context, table, model, newModel);
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  );
                },
                child: const Text('save change later'),
              ),
            ],
          );
        },
      );
    },
  );
}
