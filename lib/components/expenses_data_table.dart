import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExpensesDataTable extends StatelessWidget {
  final List<String> headers;
  late final List<List<String>> values;

  List<DataColumn> _columns = [];
  List<DataRow> _rows = [];

  Function(List<String> row)? onTapRow;

  ExpensesDataTable({
    Key? key,
    required this.headers,
    required this.values,
    this.onTapRow,
  }) : super(key: key) {
    generateTable();
  }
  ExpensesDataTable.usingRows({
    Key? key,
    required this.headers,
    required List<DataRow> rows,
  }) : super(key: key) {
    generateColumns();
    _rows = rows;
  }

  void generateColumns() {
    _columns =
        headers.map((header) => DataColumn(label: Text(header))).toList();
  }

  void generateRows() {
    _rows = values
        .map((row) =>
            DataRow(
              cells: row.map((value) => DataCell(Text(value))).toList(),
              onSelectChanged: onTapRow != null
                ? (bool? selected) => onTapRow!(row)
                : null,
            ))
        .toList();
  }

  void generateTable() {
    generateColumns();
    generateRows();
  }

  @override
  Widget build(BuildContext context) => DataTable(
        columns: _columns,
        rows: _rows,  
        showCheckboxColumn: false,
      );
}
