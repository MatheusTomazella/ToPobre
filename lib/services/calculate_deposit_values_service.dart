import 'package:expensesapp/constants/currency.dart';
import 'package:money2/money2.dart';

import '../models/deposit.dart';
import '../models/expense.dart';

class CalculateDepositValuesService {
  static Money getBeforeDiscountValue(Deposit deposit) {
    return deposit.getPrevious() + deposit.getIncrement();
  }

  static Money getDiscount(Deposit deposit, List<Expense> expenses) {
    return expenses.fold(
        Money.fromInt(0, code: CurrencyConsts.DEFAULT_CURRENCY_CODE),
        (Money sum, Expense expense) =>
            sum +
            (expense.getDepositId() == deposit.getId()
                ? expense.getValue()
                : Money.fromInt(0,
                    code: CurrencyConsts.DEFAULT_CURRENCY_CODE)));
  }

  static Money getValue(Deposit deposit, List<Expense> expenses) {
    return getBeforeDiscountValue(deposit) - getDiscount(deposit, expenses);
  }
}
