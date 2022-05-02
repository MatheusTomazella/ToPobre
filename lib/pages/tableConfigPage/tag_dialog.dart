import 'package:expensesapp/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_color_picker/flutter_material_color_picker.dart';

import '../../components/information_dialog.dart';
import '../../models/expense_tag.dart';

Future<void> showTagDialog({
  required BuildContext context,
  ExpenseTag? tag,
  Function(ExpenseTag?)? onSave,
  Function(ExpenseTag?)? onCancel,
}) async {
  var nameInputController =
      TextEditingController(text: tag != null ? tag.getName() : '');

  Color color = tag != null ? tag.getColor() : Colors.red;

  defaultCallback(ExpenseTag? tag) => Navigator.pop(context);

  ExpenseTag? genNewTag() {
    if (nameInputController.text.isEmpty) return null;
    return ExpenseTag.fromColor(
      name: nameInputController.text,
      color: color,
    );
  }

  bool validateTag(ExpenseTag? tag) {
    if (nameInputController.text.isEmpty || tag!.getName().isEmpty) {
      showInformationDialog(
        context: context,
        title: StringConsts.INVALID_NAME_DIALOG_TITLE,
        text: StringConsts.INVALID_NAME_DIALOG_TEXT,
        primaryColor: Colors.redAccent,
      );
      return false;
    }
    return true;
  }

  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(
          tag == null 
            ? StringConsts.NEW_TAG_DIALOG_TITLE 
            : StringConsts.EDIT_TAG_DIALOG_TITLE,
          style: const TextStyle(color: Colors.black54),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  hintText: StringConsts.NEW_TAG_DIALOG_NAME_PLACEHOLDER,
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: tag != null ? tag.getColor() : Colors.red),
                  ),
                ),
                controller: nameInputController,
              ),
              MaterialColorPicker(
                colors: Colors.primaries,
                allowShades: false,
                selectedColor: tag != null ? tag.getColor() : color,
                onMainColorChange: (updatedColor) =>
                    color = updatedColor as Color,
              )
            ],
          ),
        ),
        actions: <Widget>[
          OutlinedButton(
            child: const Text(
              StringConsts.NEW_TAG_DIALOG_CANCEL_BUTTON_TEXT,
            ),
            style: OutlinedButton.styleFrom(
              primary: tag != null ? tag.getColor() : Colors.red,
              side:
                  BorderSide(color: tag != null ? tag.getColor() : Colors.red),
            ),
            onPressed: () => onCancel != null
                ? onCancel(genNewTag())
                : defaultCallback(genNewTag()),
          ),
          ElevatedButton(
            child: Text(
              tag == null
                  ? StringConsts.NEW_TAG_DIALOG_CONFIRM_BUTTON_TEXT
                  : StringConsts.EDIT_TAG_CONFIRM_BUTTON_TEXT,
              style: const TextStyle(color: Colors.white),
            ),
            onPressed: () {
              var tag = genNewTag();
              if (!validateTag(tag)) return;
              onSave != null
                  ? onSave(genNewTag())
                  : defaultCallback(genNewTag());
            },
            style: ElevatedButton.styleFrom(
              primary: tag == null ? Colors.red : tag.getColor(),
            ),
          ),
        ],
      );
    },
  );
}
