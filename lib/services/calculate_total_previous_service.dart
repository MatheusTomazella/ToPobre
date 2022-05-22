import 'package:expensesapp/constants/currency.dart';
import 'package:expensesapp/models/expenses_table.dart';
import 'package:money2/money2.dart';

class CalculateTotalPreviousService {
  static Money calculateReturnMoney(ExpensesTable table) {
    return table.depositList.fold(
        Money.fromNum(0, code: CurrencyConsts.DEFAULT_CURRENCY_CODE),
        (previousValue, element) => previousValue + element.getPrevious());
  }
}
