import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/strings.dart';
import '../../providers/tables_notifier.dart';

String name = '';

Future<void> showNewTableDialog ( BuildContext context ) {
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(StringConsts.NEW_TABLE_DIALOG_TITLE),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                onChanged: (value) => name = value,
                decoration: const InputDecoration(
                  hintText: StringConsts.NEW_TABLE_DIALOG_PLACEHOLDER,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          OutlinedButton(
            child: const Text(StringConsts.NEW_TABLE_DIALOG_CANCEL_BUTTON_TEXT),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.red),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ElevatedButton(
            child: const Text(StringConsts.NEW_TABLE_DIALOG_CONFIRM_BUTTON_TEXT),
            onPressed: () {
              Provider.of<TablesNotifier>(context, listen: false)
                  .createNewTable(name);
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}