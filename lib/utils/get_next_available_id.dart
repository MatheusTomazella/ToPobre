import '../models/table_record.dart';

int getNextAvailableId(List<TableRecord> tableRecords) {
  return tableRecords.length + 1;
}
