import 'package:flutter/material.dart';

import '../../constants/strings.dart';

Future<bool?> showConfirmationDialog(
    {required BuildContext context,
    String title = StringConsts.DEFAULT_CONFIRMATION_DIALOG_TITLE,
    String text = StringConsts.DEFAULT_CONFIRMATION_DIALOG_TEXT,
    String confirmText = StringConsts.DEFAULT_CONFIRMATION_DIALOG_CONFIRM_BUTTON_TEXT,
    VoidCallback? onConfirm,
    String cancelText = StringConsts.DEFAULT_CONFIRMATION_DIALOG_CANCEL_BUTTON_TEXT,
    VoidCallback? onCancel,
    Color primaryColor = Colors.red}) {
  return showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      void defaultCallback() => Navigator.pop(context);
      return AlertDialog(
        title: Text(title),
        content: Text(text),
        actions: <Widget>[
          OutlinedButton(
            child: Text(cancelText),
            style: OutlinedButton.styleFrom(
              primary: primaryColor,
              side: BorderSide(color: primaryColor),
            ),
            onPressed: onCancel ?? defaultCallback,
          ),
          ElevatedButton(
            child: Text(confirmText),
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
            ),
            onPressed: onConfirm ?? defaultCallback,
          ),
        ],
      );
    },
  );
}
