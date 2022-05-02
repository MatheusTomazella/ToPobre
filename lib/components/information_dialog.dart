import 'package:flutter/material.dart';

import '../constants/strings.dart';

Future<void> showInformationDialog({
  required BuildContext context,
  String title = StringConsts.DEFAULT_INFORMATION_DIALOG_TITLE,
  String text = StringConsts.DEFAULT_INFORMATION_DIALOG_TEXT,
  String buttonText = StringConsts.DEFAULT_INFORMATION_DIALOG_CONFIRM_BUTTON_TEXT,
  VoidCallback? onConfirm,
  Color? primaryColor,
}) {
  primaryColor = primaryColor ?? Colors.cyan.shade800;
  return showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title, style: TextStyle(color: primaryColor)),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(text),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text(buttonText),
            style: TextButton.styleFrom(
              primary: primaryColor,
            ),
            onPressed: onConfirm ?? () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}