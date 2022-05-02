import 'package:expensesapp/models/expenses_table.dart';
import 'package:expensesapp/pages/tableConfigPage/tag_selector.dart';
import 'package:flutter/material.dart';

class TableConfigPage extends StatelessWidget {
  final ExpensesTable table;

  const TableConfigPage({Key? key, required this.table}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black54,
          ),
          onPressed: () => Navigator.pop(context),
          padding: const EdgeInsets.only(left: 10),
        ),
        title: Text(table.getName(), style: const TextStyle(color: Colors.black54,),),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TagSelector(table: table),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
