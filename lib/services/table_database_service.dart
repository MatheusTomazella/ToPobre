import 'package:expensesapp/models/expenses_table.dart';
import 'package:expensesapp/services/deserialization_service.dart';
import 'package:expensesapp/services/serialization_service.dart';

import 'database_service.dart';

class TableDatabaseService {
  static Future<List<ExpensesTable>> loadTableList() async {
    final String serializedString = await DatabaseService.load('tableList');
    if (serializedString.isEmpty) {
      return [];
    }
    return DeserializationService.deserializeTableList(serializedString);
  }

  static Future<void> saveTableList(List<ExpensesTable> tableList) async {
    final String serializedString =
        SerializationService.serializeTableList(tableList);
    DatabaseService.save(serializedString, 'tableList');
  }
}
