import 'package:expensesapp/models/expense.dart';
import 'package:money2/money2.dart';

import '../constants/currency.dart';

class CalculateTotalDiscountService {

  static Money fromList ( List<Expense> records ) {
    Money total = Money.fromInt(0, code: CurrencyConsts.DEFAULT_CURRENCY_CODE);
    for (var record in records) {
      total += record.getValue();
    }
    return total;
  }

  static Money fromListOfId ( List<Expense> expenses, int id ) {
    Money total = Money.fromInt(0, code: CurrencyConsts.DEFAULT_CURRENCY_CODE);
    for (var expense in expenses) {
      if (expense.getId() == id) {
        total += expense.getValue();
      }
    }
    return total;
  }
}