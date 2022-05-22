import 'package:expensesapp/constants/chart_types.dart';
import 'package:expensesapp/constants/strings.dart';

String getDefaultChartTitle(CHART_TYPES type, {bool includeChartType = false}) {
  switch (type) {
    case CHART_TYPES.PREVIOUS_CURRENT_COMPARISON_BAR:
      return StringConsts.PREVIOUS_CURRENT_COMPARISON_BAR_DEFAULT_TITLE;
    case CHART_TYPES.TAG_PIE:
      var title = StringConsts.TAG_PIE_DEFAULT_TITLE;
      if (includeChartType) title += ' (${StringConsts.PIE_CHART_TYPE})';
      return title;
    case CHART_TYPES.TAG_BAR:
      var title = StringConsts.TAG_BAR_DEFAULT_TITLE;
      if (includeChartType) title += ' (${StringConsts.BAR_CHART_TYPE})';
      return title;
    case CHART_TYPES.SPENT_VS_DEPOSITED_PIE:
      return StringConsts.SPENT_VS_DEPOSITED_PIE_DEFAULT_TITLE;
    case CHART_TYPES.SPENT_VS_INCOME_PIE:
      return StringConsts.SPENT_VS_INCOME_PIE_DEFAULT_TITLE;
    case CHART_TYPES.DEPOSIT_DISTRIBUTION_DOUBLE_BAR:
      return StringConsts.DEPOSIT_DISTRIBUTION_DOUBLE_BAR_DEFAULT_TITLE;
  }
}
