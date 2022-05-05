import 'package:expensesapp/utils/clean_money_string.dart';
import 'package:money2/money2.dart';

String moneyToString(Money value) {
  return double.parse(
    cleanMoneyString(
      value.toString()
    )
  ).toString();
}
