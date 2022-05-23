// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:money2/money2.dart';

class CurrencyConsts {
  static const String DEFAULT_CURRENCY_CODE = "BRL";
  static const String DEFAULT_CURRENCY_SYMBOL = "R\$";
  static Currency CURRENCY =
      Money.fromNum(0, code: DEFAULT_CURRENCY_CODE).currency;
}
