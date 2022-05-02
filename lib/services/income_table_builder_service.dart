import 'package:expensesapp/constants/strings.dart';
import 'package:expensesapp/models/income.dart';

class IncomeTableBuilderService {
  static List<String> getHeaders() => [
        StringConsts.INCOME_ID_LABEL,
        StringConsts.INCOME_DESCRIPTION_LABEL,
        StringConsts.INCOME_VALUE_LABEL,
      ];

  static List<String> _getValues(Income income) => [
        income.getId().toString(),
        income.getDescription(),
        income.getValue().toString()
      ];

  static List<List<String>> getValuesMatrix(List<Income> incomes) =>
      incomes.map((income) => _getValues(income)).toList();
}
