import 'package:expensesapp/components/dialogs/confirmation_dialog.dart';
import 'package:expensesapp/components/dialogs/information_dialog.dart';
import 'package:expensesapp/constants/strings.dart';
import 'package:expensesapp/models/expenses_table.dart';
import 'package:expensesapp/pages/tableListPage/rename_dialog.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../../providers/tables_notifier.dart';

class TableListItem extends StatelessWidget {
  final ExpensesTable table;
  final VoidCallback? onTap;

  const TableListItem({
    Key? key,
    required this.table,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: IconButton(
        icon: Icon(
          (table.getFavorite() ? Icons.star : Icons.star_outline),
          color: Colors.yellow,
        ),
        onPressed: () => Provider.of<TablesNotifier>(context, listen: false)
            .toggleFavorite(table),
      ),
      title: Text(
        table.getName(),
        style: const TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black87, fontSize: 20),
      ),
      onTap: () {
        Provider.of<TablesNotifier>(context, listen: false).selectTable(table);
        Navigator.pushNamed(context, '/table');
      },
      trailing: PopupMenuButton(
        itemBuilder: (context) => [
          PopupMenuItem(
            child: Row(
              children: const [
                Icon(Icons.edit, color: Colors.orange),
                SizedBox(width: 10),
                Text(StringConsts.LIST_MENU_EDIT_OPTION),
              ],
            ),
            value: 'edit',
          ),
          PopupMenuItem(
            child: Row(
              children: const [
                Icon(Icons.content_copy, color: Colors.purple),
                SizedBox(width: 10),
                Text(StringConsts.LIST_MENU_COPY_OPTION),
              ],
            ),
            value: 'copy',
          ),
          PopupMenuItem(
            child: Row(
              children: const [
                Icon(Icons.delete, color: Colors.redAccent),
                SizedBox(width: 10),
                Text(StringConsts.LIST_MENU_DELETE_OPTION),
              ],
            ),
            value: 'delete',
          ),
          PopupMenuItem(
            child: Row(
              children: const [
                Icon(Icons.file_upload, color: Color.fromARGB(255, 0, 69, 125)),
                SizedBox(width: 10),
                Text(StringConsts.LIST_MENU_EXPORT_OPTION),
              ],
            ),
            value: 'export',
          ),
          PopupMenuItem(
            child: Row(
              children: [
                Icon(Icons.info_outline, color: Colors.teal.shade400),
                const SizedBox(width: 10),
                const Text(StringConsts.LIST_MENU_INFO_OPTION),
              ],
            ),
            value: 'info',
          ),
        ],
        onSelected: (value) {
          if (value == 'delete') {
            showConfirmationDialog(
                context: context,
                title: StringConsts.DELETION_DIALOG_TITLE,
                text: StringConsts.DELETION_DIALOG_TEXT,
                onConfirm: () {
                  Provider.of<TablesNotifier>(context, listen: false)
                      .removeTable(table);
                  Navigator.pop(context);
                });
          } else if (value == 'edit') {
            showRenameDialog(context, table);
          } else if (value == 'copy') {
            showConfirmationDialog(
              context: context,
              title: StringConsts.COPY_DIALOG_TITLE,
              text: StringConsts.COPY_DIALOG_TEXT,
              primaryColor: Colors.purple,
              onConfirm: () {
                Provider.of<TablesNotifier>(context, listen: false)
                    .copyTable(table);
                Navigator.pop(context);
              },
            );
          } else if (value == 'info') {
            showInformationDialog(
                context: context,
                title: StringConsts.TABLE_DETAILS_DIALOG_TITLE,
                text:
                    "${StringConsts.TABLE_DETAILS_NAME_LABEL}:\n${table.getName()}\n\n"
                    "${StringConsts.TABLE_DETAILS_CREATION_DATE_LABEL}:\n${DateFormat("yyyy-MM-dd hh:mm:ss")
                        .format(table.getCreationDate().toUtc())}",
            );
          }
        },
      ),
    );
  }
}
