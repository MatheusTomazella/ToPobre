import 'package:expensesapp/models/chart_model.dart';
import 'package:expensesapp/services/manage_table_chart_list_service.dart';
import 'package:flutter/material.dart';

import '../../models/expenses_table.dart';
import 'information_dialog.dart';

Future<void> showChartRenameDialog({
  required BuildContext context,
  required ExpensesTable table,
  required ChartModel model,
}) {
  var newModel = ChartModel.from(model);
  newModel.title = '';

  bool validate() {
    void showError(String text) {
      showInformationDialog(
          context: context,
          title: 'chart rename error title change later',
          text: text,
          primaryColor: Colors.redAccent,
          onConfirm: () {
            Navigator.pop(context);
            Navigator.pop(context);
          });
    }

    if (newModel.title.isEmpty) {
      showError('title empty change later');
      return false;
    }
    return true;
  }

  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text("title change later"),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  hintText: "chart title change later",
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange)),
                ),
                onChanged: (value) => newModel.title = value,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          OutlinedButton(
            child: const Text("change later"),
            style: OutlinedButton.styleFrom(
              primary: Colors.orange,
              side: const BorderSide(color: Colors.orange),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ElevatedButton(
            child: const Text("change later"),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
            ),
            onPressed: () {
              if (!validate()) return;
              ManageTableChartListService.replaceChartInProvider(
                  context, table, model, newModel);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
