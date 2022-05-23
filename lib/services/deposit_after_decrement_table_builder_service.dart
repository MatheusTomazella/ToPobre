import 'package:expensesapp/constants/strings.dart';
import 'package:expensesapp/models/deposit.dart';
import 'package:expensesapp/services/calculate_deposit_values_service.dart';
import 'package:expensesapp/utils/money_to_formatted_string.dart';

import '../models/expense.dart';

class DepositAfterDecrementTableBuilderService {
  static List<String> getHeaders() => [
        StringConsts.DEPOSIT_ID_LABEL,
        StringConsts.DEPOSIT_NAME_LABEL,
        StringConsts.DEPOSIT_DISCOUNT_LABEL,
        StringConsts.DEPOSIT_VALUE_LABEL,
      ];

  static List<String> _getValues(Deposit deposit, List<Expense> expenses) => [
        deposit.getId().toString(),
        deposit.getName(),
        CalculateDepositValuesService.getDiscount(deposit, expenses)
            .toFormattedString(),
        CalculateDepositValuesService.getValue(deposit, expenses)
            .toFormattedString(),
      ];

  static List<List<String>> getValuesMatrix(
          List<Deposit> deposits, List<Expense> expenses) =>
      deposits.map((deposit) => _getValues(deposit, expenses)).toList();
}
