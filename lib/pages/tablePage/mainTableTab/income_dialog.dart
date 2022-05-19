import 'package:expensesapp/components/dialogs/confirmation_dialog.dart';
import 'package:expensesapp/components/dialogs/information_dialog.dart';
import 'package:expensesapp/constants/currency.dart';
import 'package:expensesapp/constants/strings.dart';
import 'package:expensesapp/services/manage_income_service.dart';
import 'package:expensesapp/utils/clean_money_string.dart';
import 'package:flutter/material.dart';
import 'package:money2/money2.dart';

import '../../../models/expenses_table.dart';
import '../../../models/income.dart';

Future<void> showIncomeDialog({
  required BuildContext context,
  ExpensesTable? table,
  Income? oldIncome,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      TextEditingController _descriptionController = TextEditingController(
        text: oldIncome?.getDescription() ?? '',
      );
      TextEditingController _valueController = TextEditingController(
        text: oldIncome?.getValue().toString() ?? '',
      );

      Income genNewIncome() {
        var value = cleanMoneyString(_valueController.text);
        return Income.filled(
          0,
          _descriptionController.text,
          Money.fromNum(
            double.parse(value.isEmpty ? '0' : value),
            code: CurrencyConsts.DEFAULT_CURRENCY_CODE,
          ),
        );
      }

      bool validate() {
        void showError(String text) {
          showInformationDialog(
              context: context,
              title: StringConsts.INVALID_INCOME_DIALOG_TITLE,
              text: text,
              primaryColor: Colors.redAccent,
              onConfirm: () {
                Navigator.pop(context);
                Navigator.pop(context);
              });
        }

        var value = cleanMoneyString(_valueController.text);

        if (_descriptionController.text.isEmpty) {
          showError(StringConsts.INVALID_INCOME_DIALOG_TEXT_EMPTY_DESCRIPTION);
          return false;
        } else if (double.tryParse(value.isEmpty ? '0' : value) == null) {
          showError(StringConsts.INVALID_INCOME_DIALOG_TEXT_INVALID_VALUE);
          return false;
        }
        return true;
      }

      return AlertDialog(
        title: Text(
          oldIncome == null
              ? StringConsts.NEW_INCOME_DIALOG_TITLE
              : StringConsts.EDIT_INCOME_DIALOG_TITLE,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: StringConsts.NEW_INCOME_DIALOG_NAME_LABEL,
                ),
              ),
              TextField(
                controller: _valueController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: StringConsts.NEW_INCOME_DIALOG_VALUE_LABEL,
                ),
              ),
            ],
          ),
        ),
        actions: <Widget>[
          OutlinedButton(
            child:
                const Text(StringConsts.NEW_INCOME_DIALOG_CANCEL_BUTTON_TEXT),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(
                color: Colors.red,
              ),
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          ElevatedButton(
            child:
                const Text(StringConsts.NEW_INCOME_DIALOG_CONFIRM_BUTTON_TEXT),
            onPressed: () {
              showConfirmationDialog(
                context: context,
                title: StringConsts.NEW_INCOME_CONFIRMATION_DIALOG_TITLE,
                text: oldIncome == null
                    ? StringConsts.NEW_INCOME_CONFIRMATION_DIALOG_TEXT
                    : StringConsts.EDIT_INCOME_CONFIMATION_DIALOG_TEXT,
                onConfirm: () {
                  if (!validate()) return;
                  if (oldIncome == null) {
                    ManageIncomeService.addIncomeToTable(
                        context, table, genNewIncome());
                  } else {
                    ManageIncomeService.updateIncome(
                        context, table!, oldIncome, genNewIncome());
                  }
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
              );
            },
          ),
        ],
      );
    },
  );
}
