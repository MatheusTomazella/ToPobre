import 'package:expensesapp/constants/currency.dart';
import 'package:expensesapp/utils/clean_money_string.dart';
import 'package:money2/money2.dart';

Money doubleStringToMoney(String string) {
  return Money.fromNum(double.parse(cleanMoneyString(string)),
      code: CurrencyConsts.DEFAULT_CURRENCY_CODE);
}
