import 'package:expensesapp/models/expense.dart';
import 'package:expensesapp/utils/format_date.dart';
import 'package:expensesapp/utils/get_first_deposit_id.dart';
import 'package:flutter/material.dart';

import '../../../models/expenses_table.dart';
import '../../../services/manage_deposit_service.dart';
import './tag_selector.dart';

Future<void> showExpenseDialog({
  required BuildContext context,
  required ExpensesTable table,
  Expense? oldExpense,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      TextEditingController _nameController = TextEditingController(
        text: oldExpense?.getDescription() ?? '',
      );
      TextEditingController _amountController = TextEditingController(
        text: oldExpense?.getValue().toString() ?? '',
      );
      DateTime date = oldExpense?.getDate() ?? DateTime.now();
      int depositId = oldExpense?.getDepositId() ?? getFirstDepositId(table);
      List<String> tags = oldExpense?.getTags() ?? [];

      return StatefulBuilder(
        builder: (context, setState) {
          var depositMap =
              ManageDepositService.getDepositIdsAndNames(context, table);

          return AlertDialog(
            title: Text("Title of Dialog"),
            scrollable: true,
            content: SingleChildScrollView(
                child: ListBody(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: "Expense name",
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
                  controller: _amountController,
                  decoration: const InputDecoration(
                    labelText: "Expense amount",
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
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Cancel"),
              ),
              TextButton(
                onPressed: () {},
                child: Text("Change"),
              ),
            ],
          );
        },
      );
    },
  );
}
