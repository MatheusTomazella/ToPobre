import 'package:expensesapp/main.dart';
import 'package:expensesapp/services/table_database_service.dart';
import 'package:expensesapp/utils/generate_example_table.dart';
import 'package:flutter/widgets.dart';

import '../constants/strings.dart';
import '../models/expense_tag.dart';
import '../models/expenses_table.dart';

class TablesNotifier extends ChangeNotifier {
  bool initialized = false;
  final List<ExpensesTable> _tables = [];
  ExpensesTable? _currentTable;

  Future<bool> init() async {
    if (initialized) return true;
    _tables.addAll(await TableDatabaseService.loadTableList());
    if (INSERT_EXAMPLE_TABLE_IF_NO_TABLE && _tables.isEmpty) {
      _tables.add(generateExampleTable());
    }
    initialized = true;
    return true;
  }

  void update() {
    notifyListeners();
    TableDatabaseService.saveTableList(_tables);
  }

  ExpensesTable findTable(ExpensesTable table) =>
      _tables.firstWhere((e) => e.equals(table));

  // Static

  void toggleFavorite(ExpensesTable table) {
    _tables.firstWhere((element) => element.equals(table)).toggleFavorite();
    update();
  }

  void createNewTable(String name) {
    var table = ExpensesTable.defaultValues();
    table.setName(name);
    _tables.add(table);
    update();
  }

  void renameTable(ExpensesTable table, String newName) {
    _tables.firstWhere((element) => element.equals(table)).setName(newName);
    update();
  }

  void copyTable(ExpensesTable table) {
    var newTable = ExpensesTable.from(table);
    newTable.setName(table.getName() + StringConsts.COPY_TRAILER);
    newTable.setCreationDate(DateTime.now());
    _tables.add(newTable);
    update();
  }

  void updateTagOfTable(
      ExpensesTable table, ExpenseTag oldTag, ExpenseTag newTag) {
    _tables
        .firstWhere((element) => element.equals(table))
        .updateTag(oldTag, newTag);
    update();
  }

  // Table List

  List<ExpensesTable> get tables => _tables;
  set tables(List<ExpensesTable> tables) {
    _tables.clear();
    _tables.addAll(tables);
    update();
  }

  // TODO: Table list not being sorted properly
  List<ExpensesTable> getOrderedTables() {
    var startedTables = _tables.where((element) => element.getFavorite());
    var notStartedTables = _tables.where((element) => !element.getFavorite());
    return startedTables.toList()..addAll(notStartedTables);
  }

  void addTable(ExpensesTable table) {
    _tables.add(table);
    update();
  }

  void removeTable(ExpensesTable table) {
    _tables.remove(table);
    update();
  }

  // Current Table

  ExpensesTable? get currentTable => _currentTable;
  void selectTable(ExpensesTable table) {
    _currentTable = table;
    update();
  }

  void clearCurrentTable() {
    _currentTable = null;
    update();
  }
}
