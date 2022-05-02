import 'package:expensesapp/constants/currency.dart';
import 'package:expensesapp/constants/strings.dart';
import 'package:expensesapp/models/table_record.dart';
import 'package:expensesapp/services/calculate_deposit_values_service.dart';
import 'package:money2/money2.dart';

class Deposit extends TableRecord {
  late String name = StringConsts.DEFAULT_DEPOSIT_NAME;
  late Money _previous =
      Money.fromInt(0, code: CurrencyConsts.DEFAULT_CURRENCY_CODE);
  late Money _increment =
      Money.fromInt(0, code: CurrencyConsts.DEFAULT_CURRENCY_CODE);

  Deposit(int id) : super(id);
  Deposit.filled(int id, String name, Money previous, Money increment) : super(id) {
    if (id < 0) throw Exception("Id cannot be negative");
    setName(name);
    setPrevious(previous);
    setIncrement(increment);
  }

  void update(Deposit newDeposit) {
    setName(newDeposit.getName());
    setPrevious(newDeposit.getPrevious());
    setIncrement(newDeposit.getIncrement());
  }

  String getName() => name;
  void setName(String name) {
    if (name.isEmpty) throw Exception("Name cannot be empty");
    this.name = name;
  }

  Money getPrevious() => _previous;
  void setPrevious(Money previous) => _previous = previous;

  Money getIncrement() => _increment;
  void setIncrement(Money increment) => _increment = increment;

  Money getBeforeDiscount() =>
      CalculateDepositValuesService.getBeforeDiscountValue(this);

  @override
  String toString() =>
      "Deposit(id: ${getId()}, previous: ${getPrevious()}, increment: ${getIncrement()}, beforeDecrement: ${getBeforeDiscount()}})";
  String toPrintableString() =>
      "Deposit(\n id: ${getId()}\n previous: ${getPrevious()}\n increment: ${getIncrement()}\n beforeDecrement: ${getBeforeDiscount()}\n)\n\n";

}
