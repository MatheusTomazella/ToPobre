import 'package:expensesapp/components/dialogs/default_dialog_buttons.dart';
import 'package:expensesapp/components/dialogs/information_dialog.dart';
import 'package:expensesapp/constants/currency.dart';
import 'package:expensesapp/constants/strings.dart';
import 'package:expensesapp/models/deposit.dart';
import 'package:expensesapp/utils/clean_money_string.dart';
import 'package:expensesapp/utils/money_to_formatted_string.dart';
import 'package:flutter/material.dart';
import 'package:money2/money2.dart';

import '../../../models/expenses_table.dart';
import '../../../services/manage_deposit_service.dart';

Future<void> showDepositDialog({
  required BuildContext context,
  required ExpensesTable table,
  Deposit? oldDeposit,
}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      TextEditingController _descriptionController = TextEditingController(
        text: oldDeposit?.getName() ?? '',
      );
      TextEditingController _previousController = TextEditingController(
        text: oldDeposit?.getPrevious().toFormattedString() ?? '',
      );
      TextEditingController _incrementController = TextEditingController(
        text: oldDeposit?.getIncrement().toFormattedString() ?? '',
      );

      Deposit genNewDeposit() {
        var previous = cleanMoneyString(_previousController.text);
        var increment = cleanMoneyString(_incrementController.text);
        return Deposit.filled(
          0,
          _descriptionController.text,
          Money.fromNum(
            double.parse(previous.isEmpty ? '0' : previous),
            code: CurrencyConsts.DEFAULT_CURRENCY_CODE,
          ),
          Money.fromNum(
            double.parse(increment.isEmpty ? '0' : increment),
            code: CurrencyConsts.DEFAULT_CURRENCY_CODE,
          ),
        );
      }

      bool validate() {
        void showError(String text) {
          showInformationDialog(
              context: context,
              title: StringConsts.INVALID_DEPOSIT_DIALOG_TITLE,
              text: text,
              primaryColor: Colors.redAccent,
              onConfirm: () {
                Navigator.pop(context);
                Navigator.pop(context);
              });
        }

        var previous = cleanMoneyString(_previousController.text);
        var increment = cleanMoneyString(_incrementController.text);

        if (_descriptionController.text.isEmpty) {
          showError(StringConsts.INVALID_DEPOSIT_DIALOG_TEXT_EMPTY_NAME);
          return false;
        } else if (double.tryParse(previous.isEmpty ? '0' : previous) == null) {
          showError(StringConsts.INVALID_DEPOSIT_DIALOG_TEXT_INVALID_PREVIOUS);
          return false;
        } else if (double.tryParse(increment.isEmpty ? '0' : increment) ==
            null) {
          showError(StringConsts.INVALID_DEPOSIT_DIALOG_TEXT_INVALID_INCREMENT);
          return false;
        }
        return true;
      }

      return AlertDialog(
        title: Text(
          oldDeposit == null
              ? StringConsts.NEW_DEPOSIT_DIALOG_TITLE
              : StringConsts.EDIT_DEPOSIT_DIALOG_TITLE,
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: StringConsts.NEW_DEPOSIT_DIALOG_NAME_LABEL,
                ),
              ),
              TextField(
                controller: _previousController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText:
                        StringConsts.NEW_DEPOSIT_DIALOG_PREVIOUS_VALUE_LABEL,
                    hintText: StringConsts
                        .NEW_DEPOSIT_DIALOG_PREVIOUS_VALUE_PLACEHOLDER),
              ),
              TextField(
                controller: _incrementController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    labelText:
                        StringConsts.NEW_DEPOSIT_DIALOG_INCREMENT_VALUE_LABEL,
                    hintText: StringConsts
                        .NEW_DEPOSIT_DIALOG_INCREMENT_VALUE_PLACEHOLDER),
              ),
            ],
          ),
        ),
        actions: generateDialogButtons(
          context: context,
          confirmationDialogTitle:
              StringConsts.NEW_DEPOSIT_CONFIRMATION_DIALOG_TITLE,
          confirmationDialogText: oldDeposit == null
              ? StringConsts.NEW_DEPOSIT_CONFIRMATION_DIALOG_TEXT
              : StringConsts.EDIT_DEPOSIT_CONFIMATION_DIALOG_TEXT,
          confirmText: StringConsts.NEW_DEPOSIT_DIALOG_CONFIRM_BUTTON_TEXT,
          confirmFunction: () {
            if (!validate()) return;
            if (oldDeposit == null) {
              ManageDepositService.addDepositToTable(
                  context, table, genNewDeposit());
            } else {
              ManageDepositService.updateDeposit(
                  context, table, oldDeposit, genNewDeposit());
            }
          },
          cancelText: StringConsts.NEW_DEPOSIT_DIALOG_CANCEL_BUTTON_TEXT,
          deleteFunction: oldDeposit != null
              ? () =>
                  ManageDepositService.deleteDeposit(context, table, oldDeposit)
              : null,
        ),
      );
    },
  );
}
