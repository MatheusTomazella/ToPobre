import 'dart:io';

import 'package:expensesapp/models/expenses_table.dart';
import 'package:expensesapp/services/database_service.dart';
import 'package:expensesapp/services/serialization_service.dart';
import 'package:share_plus/share_plus.dart';

class ExportService {
  static Future<File> generateTableExportFile(ExpensesTable table) {
    return DatabaseService.save(table.toJson(), 'export');
  }

  static void shareTable(ExpensesTable table) async {
    var file = await generateTableExportFile(table);
    Share.shareFiles([file.path]);
  }
}
