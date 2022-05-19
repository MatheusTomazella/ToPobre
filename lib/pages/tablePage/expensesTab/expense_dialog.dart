import 'package:expensesapp/components/dialogs/confirmation_dialog.dart';
import 'package:expensesapp/models/expense.dart';
import 'package:expensesapp/utils/format_date.dart';
import 'package:expensesapp/utils/get_first_deposit_id.dart';
import 'package:flutter/material.dart';
import 'package:money2/money2.dart';

import '../../../components/dialogs/information_dialog.dart';
import '../../../constants/currency.dart';
import '../../../constants/strings.dart';
import '../../../models/expenses_table.dart';
import '../../../services/manage_deposit_service.dart';
import '../../../services/manage_expense_service.dart';
import '../../../utils/clean_money_string.dart';
import '../../../components/tag_selector.dart';

Future<void> showExpenseDialog({
  required BuildContext context,
  required ExpensesTable table,
  Expense? oldExpense,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      TextEditingController _descriptionController = TextEditingController(
        text: oldExpense?.getDescription() ?? '',
      );
      TextEditingController _valueController = TextEditingController(
        text: oldExpense?.getValue().toString() ?? '',
      );
      DateTime date = oldExpense?.getDate() ?? DateTime.now();
      int depositId = oldExpense?.getDepositId() ?? getFirstDepositId(table);
      List<String> tags = oldExpense?.getTags() ?? [];

      Expense genNewExpense() {
        return Expense.filled(
          0,
          date,
          _descriptionController.text,
          depositId,
          Money.fromNum(
            double.parse(
              _valueController.text.isEmpty 
                ? '0' 
                : cleanMoneyString(_valueController.text)
            ),
            code: CurrencyConsts.DEFAULT_CURRENCY_CODE,
          ),
          tags,
        );
      }

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

        var value = cleanMoneyString(_valueController.text);

        if (_descriptionController.text.isEmpty) {
          showError(StringConsts.INVALID_EXPENSE_DIALOG_TEXT_EMPTY_DESCRIPTION);
          return false;
        } else if (double.tryParse(value.isEmpty ? '0' : value) ==
            null) {
          showError(StringConsts.INVALID_EXPENSE_DIALOG_TEXT_INVALID_VALUE);
          return false;
        } 
        return true;
      }

      return StatefulBuilder(
        builder: (context, setState) {
          var depositMap =
              ManageDepositService.getDepositIdsAndNames(context, table);

          return AlertDialog(
            title: Text(
              oldExpense != null
              ? StringConsts.EDIT_EXPENSE_DIALOG_TITLE
              : StringConsts.NEW_EXPENSE_DIALOG_TITLE
            ),
            scrollable: true,
            content: SingleChildScrollView(
                child: ListBody(
              children: [
                TextField(
                  controller: _descriptionController,
                  decoration: const InputDecoration(
                    labelText: StringConsts.NEW_EXPENSE_DIALOG_DESCRIPTION_LABEL,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    var newDate = await showDatePicker(
                      context: context,
                      initialDate: date,
                      firstDate: DateTime(1000),
                      lastDate: DateTime(3000),
                    );
                    setState(() {
                      date = newDate ?? date;
                    });
                  },
                  child: Text(
                    formatDate(date),
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                DropdownButton(
                  items: List.generate(
                    depositMap.length,
                    (index) => DropdownMenuItem(
                        child: Text(depositMap.values.elementAt(index)),
                        value: depositMap.keys.elementAt(index)),
                  ),
                  value: depositId,
                  isExpanded: true,
                  onChanged: (int? value) {
                    setState(() {
                      depositId = value ?? depositId;
                    });
                  },
                ),
                TextField(
                  controller: _valueController,
                  decoration: const InputDecoration(
                    labelText: StringConsts.NEW_EXPENSE_DIALOG_VALUE_LABEL,
                  ),
                ),
                const SizedBox(height: 10),
                TagSelector(
                    table: table,
                    selected: tags,
                    onChange: (List<String> newTags) {
                      setState(() {
                        tags = newTags;
                      });
                    }),
              ],
            )),
            actions: <Widget>[
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(StringConsts.NEW_EXPENSE_DIALOG_CANCEL_BUTTON_TEXT),
              ),
              ElevatedButton(
                onPressed: () {
                  showConfirmationDialog(
                    context: context,
                    title: StringConsts.NEW_EXPENSE_CONFIRMATION_DIALOG_TITLE,
                    text: oldExpense == null
                        ? StringConsts.NEW_EXPENSE_CONFIRMATION_DIALOG_TEXT
                        : StringConsts.EDIT_EXPENSE_CONFIMATION_DIALOG_TEXT,
                    onConfirm: () {
                      if (!validate()) return;
                      if (oldExpense == null) {
                        ManageExpenseService.addExpenseToTable(
                            context, table, genNewExpense());
                      } else {
                        ManageExpenseService.updateExpense(
                            context, table, oldExpense, genNewExpense());
                      }
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                  );
                },
                child: const Text(StringConsts.NEW_EXPENSE_DIALOG_CONFIRM_BUTTON_TEXT),
              ),
            ],
          );
        },
      );
    },
  );
}
