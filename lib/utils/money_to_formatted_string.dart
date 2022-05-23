import 'package:money2/money2.dart';

extension ToFormattedString on Money {
  String toFormattedString() {
    return format(
        'S #${currency.groupSeparator}###${currency.decimalSeparator}00');
  }
}
