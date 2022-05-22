import 'package:expensesapp/constants/strings.dart';
import 'package:expensesapp/pages/tableListPage/new_table_dialog.dart';
import 'package:expensesapp/pages/tableListPage/table_list_item.dart';
import 'package:flutter/material.dart';

import '../../models/expenses_table.dart';
import '../../providers/tables_provider.dart';

final tableListProvider = TablesProvider();

class TableListPage extends StatelessWidget {
  final List<ExpensesTable> tables;

  const TableListPage({Key? key, required this.tables}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          title: const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Text(
              StringConsts.LIST_PAGE_TITLE,
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),

      body: ListView(
          padding: const EdgeInsets.only(bottom: 80),
          children: tables
              .map((table) => TableListItem(table: table))
              .toList()),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () => showNewTableDialog(context),
      ),
      
      backgroundColor: Colors.white,
    );
  }
}
