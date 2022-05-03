import 'package:expensesapp/constants/currency.dart';
import 'package:expensesapp/models/table_record.dart';
import 'package:money2/money2.dart';

import '../constants/strings.dart';
import '../utils/format_date.dart';

class Expense extends TableRecord {
  late DateTime _date = DateTime.now();
  late String _description = StringConsts.DEFAULT_EXPENSE_DESCRIPTION;
  late int _depositId = 1;
  late Money _value =
      Money.fromInt(0, code: CurrencyConsts.DEFAULT_CURRENCY_CODE);
  late List<String> _tags = [];

  Expense(int id) : super(id);

  Expense.withTags(int id, List<String> tags) : super(id) {
    setTags(tags);
  }

  Expense.filled(int id, DateTime date, String description, int depositId,
      Money value, List<String> tags)
      : super(id) {
    if (id < 0) throw Exception("Id cannot be negative");
    setDate(date);
    setDescription(description);
    setDepositId(depositId);
    setValue(value);
    setTags(tags);
  }

  Expense.fromDict(Map<String, dynamic> dict) : super(dict['id'] ?? 0) {
    setDate(dict['date'] ?? DateTime.now());
    setDescription(
        dict['description'] ?? StringConsts.DEFAULT_EXPENSE_DESCRIPTION);
    setDepositId(dict['depositId'] ?? 0);
    setValue(dict['value'] ??
        Money.fromInt(0, code: CurrencyConsts.DEFAULT_CURRENCY_CODE));
    setTags(dict['tags'] ?? []);
  }

  Expense.from(Expense expense) : super(expense.getId()) {
    setDate(expense.getDate());
    setDescription(expense.getDescription());
    setDepositId(expense.getDepositId());
    setValue(expense.getValue());
    setTags(expense.getTags());
  }

  void update (Expense expense) {
    setDate(expense.getDate());
    setDescription(expense.getDescription());
    setDepositId(expense.getDepositId());
    setValue(expense.getValue());
    setTags(expense.getTags());
  }

  DateTime getDate() => _date;
  String getFormattedDate() => formatDate(_date);
  void setDate(DateTime date) => _date = date;

  String getDescription() => _description;
  void setDescription(String description) {
    if (description.isEmpty) throw Exception("Description cannot be empty");
    _description = description;
  }

  int getDepositId() => _depositId;
  void setDepositId(int depositId) {
    if (depositId < 0) throw Exception("Deposit id cannot be negative");
    _depositId = depositId;
  }

  Money getValue() => _value;
  void setValue(Money value) => _value = value;

  List<String> getTags() => _tags..sort();
  void setTags(List<String> tags) {
    _tags = tags;
  }

  void addTag(String tag) {
    if (_tags.contains(tag)) return;
    _tags.add(tag);
  }

  void renameTag(String oldTag, String newTag) {
    if (!_tags.contains(oldTag)) return;
    _tags.remove(oldTag);
    addTag(newTag);
  }

  void removeTag(String tag) {
    if (!_tags.contains(tag)) return;
    _tags.remove(tag);
  }
}
