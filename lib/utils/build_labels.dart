import 'package:money2/money2.dart';

import '../constants/currency.dart';

String buildNameAmountPercentageLabel(
    String name, double amount, double percentage) {
  return '$name\n'
      '${Money.fromNum(amount, code: CurrencyConsts.DEFAULT_CURRENCY_CODE).toString()}\n'
      '${percentage.toStringAsFixed(1)}%';
}
