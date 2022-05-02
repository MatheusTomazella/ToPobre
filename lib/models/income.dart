import 'package:expensesapp/models/table_record.dart';
import 'package:money2/money2.dart';

import '../constants/currency.dart';
import '../constants/strings.dart';

class Income extends TableRecord {
  late String _description = StringConsts.DEFAULT_INCOME_DESCRIPTION;
  late Money _value = Money.fromInt(0, code: CurrencyConsts.DEFAULT_CURRENCY_CODE);

  Income (int id) : super(id);

  Income.filled (int id, String description, Money value) : super(id) {
    if ( id < 0 ) throw Exception("Id cannot be negative");
    setDescription(description);
    setValue(value);
  }

  void update ( Income updatedIncome ) {
    setDescription(updatedIncome.getDescription());
    setValue(updatedIncome.getValue());
  }

  String getDescription() => _description;
  void setDescription(String description) {
    if ( description.isEmpty ) throw Exception("Description cannot be empty");
    _description = description;
  }

  Money getValue() => _value;
  void setValue(Money value) => _value = value;

  @override
  String toString() => "Income(id: ${getId()}, description: ${getDescription()}, value: ${getValue()})";
  String toPrintableString() => "Income(\n id: ${getId()}\n description: ${getDescription()}\n value: ${getValue()}\n)\n\n";
}
