import 'package:flutter/material.dart';

import '../../constants/strings.dart';
import 'confirmation_dialog.dart';

List<Widget> generateDialogButtons({
  required BuildContext context,
  required String confirmText,
  required Function() confirmFunction,
  String? confirmationDialogTitle,
  String? confirmationDialogText,
  required String cancelText,
  Function()? cancelFunction,
  String? deletionDialogTitle,
  String? deletionDialogText,
  Function()? deleteFunction,
  Color primaryColor = Colors.red,
}) {
  void defaultCancelFunction() => Navigator.pop(context);

  Function() fullConfirmFunction =
      (confirmationDialogText == null && confirmationDialogTitle == null)
          ? () {
              confirmFunction();
              Navigator.pop(context);
            }
          : () {
              showConfirmationDialog(
                  context: context,
                  title: confirmationDialogTitle!,
                  text: confirmationDialogText!,
                  onConfirm: () {
                    confirmFunction();
                    Navigator.pop(context);
                    Navigator.pop(context);
                  });
            };

  void fullDeleteFunction() {
    showConfirmationDialog(
      context: context,
      title: deletionDialogTitle ?? StringConsts.DEFAULT_DELETION_DIALOG_TITLE,
      text: deletionDialogText ?? StringConsts.DEFAULT_DELETION_DIALOG_TEXT,
      onConfirm: () {
        deleteFunction!();
        Navigator.pop(context);
        Navigator.pop(context);
      },
    );
  }

  List<Widget> list = [
    OutlinedButton(
      onPressed: cancelFunction ?? defaultCancelFunction,
      style: OutlinedButton.styleFrom(
          primary: primaryColor, side: BorderSide(color: primaryColor)),
      child: Text(cancelText),
    ),
    ElevatedButton(
      onPressed: fullConfirmFunction,
      child: Text(confirmText),
    ),
  ];

  if (deleteFunction != null) {
    list.insert(
        0,
        OutlinedButton(
          onPressed: fullDeleteFunction,
          child: const Icon(
            Icons.delete,
            color: Colors.red,
          ),
          style: OutlinedButton.styleFrom(
            primary: Colors.red,
            side: const BorderSide(
              color: Colors.red,
            ),
          ),
        ));
  }

  return list;
}
