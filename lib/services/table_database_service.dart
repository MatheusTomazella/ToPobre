import 'package:expensesapp/constants/database.dart';
import 'package:expensesapp/models/expenses_table.dart';
import 'package:expensesapp/services/deserialization_service.dart';
import 'package:expensesapp/services/serialization_service.dart';

import 'database_service.dart';

class TableDatabaseService {
  static Future<List<ExpensesTable>> loadTableList() async {
    final String serializedString =
        await DatabaseService.load(DatabaseConsts.TABLE_DATABASE_NAME);
    if (serializedString.isEmpty) {
      return [];
    }
    return DeserializationService.deserializeTableList(serializedString);
  }

  static Future<void> saveTableList(List<ExpensesTable> tableList) async {
    final String serializedString =
        SerializationService.serializeTableList(tableList);
    DatabaseService.save(serializedString, DatabaseConsts.TABLE_DATABASE_NAME);
  }
}
