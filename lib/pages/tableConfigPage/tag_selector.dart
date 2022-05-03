import 'package:expensesapp/components/confirmation_dialog.dart';
import 'package:expensesapp/components/expense_tag_chip.dart';
import 'package:expensesapp/constants/color.dart';
import 'package:expensesapp/constants/strings.dart';
import 'package:expensesapp/pages/tableConfigPage/tag_dialog.dart';
import 'package:expensesapp/providers/tables_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/expense_tag.dart';
import '../../models/expenses_table.dart';

class TagSelector extends StatelessWidget {
  final ExpensesTable table;

  const TagSelector({Key? key, required this.table}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.fromLTRB(20, 0, 0, 15),
          child: Text(
            StringConsts.TABLE_CONFIG_TAG_TITLE,
            style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        Wrap(
          spacing: 10,
          children: table.tagList
              .map(
                (e) => ExpenseTagChip(
                  title: e.getName(),
                  color: e.getColor(),
                  onDelete: () {
                    showConfirmationDialog(
                      context: context,
                      title: StringConsts.TAG_DELETION_DIALOG_TITLE,
                      text: StringConsts.TAG_DELETION_DIALOG_TEXT
                          .replaceAll("[tag.name]", e.getName()),
                      primaryColor: e.getColor(),
                      cancelText:
                          StringConsts.TAG_DELETION_DIALOG_CANCEL_BUTTON_TEXT,
                      confirmText:
                          StringConsts.TAG_DELETION_DIALOG_CONFIRM_BUTTON_TEXT,
                      onConfirm: () {
                        table.removeTag(e);
                        Provider.of<TablesNotifier>(context, listen: false)
                            .update();
                        Navigator.pop(context);
                      },
                    );
                  },
                  onTap: () => showTagDialog(
                    context: context,
                    tag: e,
                    onSave: (tag) {
                      showConfirmationDialog(
                        context: context,
                        title: StringConsts.CONFIRM_TAG_UPDATE_DIALOG_TITLE,
                        text: StringConsts.CONFIRM_TAG_UPDATE_DIALOG_TEXT,
                        confirmText: StringConsts
                            .CONFIRM_TAG_UPDATE_DIALOG_CONFIRM_BUTTON_TEXT,
                        cancelText: StringConsts
                            .CONFIRM_TAG_UPDATE_DIALOG_CANCEL_BUTTON_TEXT,
                        onConfirm: () {
                          Provider.of<TablesNotifier>(context, listen: false)
                          .updateTagOfTable(table, e, tag!);
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        primaryColor: tag!.getColor(),
                      );
                    },
                  ),
                ),
              )
              .toList(),
        ),
        ExpenseTagChip(
            title: "+  " + StringConsts.NEW_TAG_CHIP_LABEL,
            color: ColorConsts.DEFAULT_TAG_COLOR_NOT_FOUND,
            onTap: () => showTagDialog(
                  context: context,
                  onSave: (ExpenseTag? tag) {
                    table.addTag(tag!);
                    Provider.of<TablesNotifier>(context, listen: false)
                        .update();
                    Navigator.pop(context);
                  },
                ))
      ],
    );
  }
}
