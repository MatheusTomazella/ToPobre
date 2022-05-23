import 'package:expensesapp/constants/currency.dart';

String cleanMoneyString(String string) {
  if (string.isEmpty) return string;
  var result = RegExp(r'\d|[,.]') // numbers and money separators
      .allMatches(string
          .replaceAll(CurrencyConsts.CURRENCY.groupSeparator.toString(), '')
          .replaceAll(',', '.'))
      .map((m) => m.group(0))
      .toList()
      .join();
  return result;
}
