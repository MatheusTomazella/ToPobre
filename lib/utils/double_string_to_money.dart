import 'package:expensesapp/constants/currency.dart';
import 'package:money2/money2.dart';

Money doubleStringToMoney(String string) {
  return Money.parseWithCurrency(
      string.replaceAll(CurrencyConsts.CURRENCY.groupSeparator,
          CurrencyConsts.CURRENCY.decimalSeparator),
      CurrencyConsts.CURRENCY);
}
