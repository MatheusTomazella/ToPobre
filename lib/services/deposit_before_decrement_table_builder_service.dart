import 'package:expensesapp/constants/strings.dart';
import 'package:expensesapp/models/deposit.dart';
import 'package:expensesapp/utils/money_to_formatted_string.dart';

class DepositBeforeDecrementTableBuilderService {

  // static List<String> getBeforeDecrementHeaders() =>
  //     ["", "name", "previous", "increment", "beforeDecrement"];
  // List<String> getBeforeDecrementValues() => [
  //       getId().toString(),
  //       getName(),
  //       getPrevious().toString(),
  //       getIncrement().toString(),
  //       getBeforeDecrement().toString(),
  //     ];

  // static List<String> getAfterDecrementHeaders() =>
  //     ["", "name", "value"];
  // List<String> getAfterDecrementValues() => [
  //       getId().toString(),
  //       getName(),
  //       getValue().toString()
  //     ];

  static List<String> getHeaders() => [
        StringConsts.DEPOSIT_ID_LABEL,
        StringConsts.DEPOSIT_NAME_LABEL,
        StringConsts.DEPOSIT_PREVIOUS_LABEL,
        StringConsts.DEPOSIT_INCREMENT_LABEL,
        StringConsts.DEPOSIT_BEFORE_DECREMENT_LABEL,
      ];

  static List<String> _getValues(Deposit deposit) => [
        deposit.getId().toString(),
        deposit.getName(),
        deposit.getPrevious().toFormattedString(),
        deposit.getIncrement().toFormattedString(),
        deposit.getBeforeDiscount().toFormattedString(),
      ];

  static List<List<String>> getValuesMatrix(List<Deposit> deposits) =>
      deposits.map((deposit) => _getValues(deposit)).toList();
}
