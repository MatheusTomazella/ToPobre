import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/strings.dart';
import '../../models/expenses_table.dart';
import '../../providers/tables_notifier.dart';

String renameValue = '';

Future<void> showRenameDialog(
  BuildContext context,
  ExpensesTable table,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(StringConsts.RENAME_DIALOG_TITLE),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                decoration: const InputDecoration(
                  hintText: StringConsts.RENAME_DIALOG_PLACEHOLDER,
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange)),
                ),
                onChanged: (value) => renameValue = value,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          OutlinedButton(
            child: const Text(StringConsts.RENAME_DIALOG_CANCEL_BUTTON_TEXT),
            style: OutlinedButton.styleFrom(
              primary: Colors.orange,
              side: const BorderSide(color: Colors.orange),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ElevatedButton(
            child: const Text(StringConsts.RENAME_DIALOG_CONFIRM_BUTTON_TEXT),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange,
            ),
            onPressed: () {
              Provider.of<TablesNotifier>(context, listen: false)
                  .renameTable(table, renameValue);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
