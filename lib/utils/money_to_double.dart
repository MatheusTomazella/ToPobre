import 'package:money2/money2.dart';

extension MoneyToDouble on Money {
  toDouble() => amount.toDecimal().toDouble();
}
