import 'package:expensesapp/constants/chart_types.dart';
import 'package:expensesapp/constants/strings.dart';

String getDefaultChartTitle(CHART_TYPES type) {
  switch (type) {
    case CHART_TYPES.PREVIOUS_CURRENT_COMPARISON_BAR:
      return StringConsts.PREVIOUS_CURRENT_COMPARISON_BAR_DEFAULT_TITLE;
    case CHART_TYPES.TAG_PIE:
      return StringConsts.TAG_PIE_DEFAULT_TITLE;
    case CHART_TYPES.TAG_BAR:
      return StringConsts.TAG_BAR_DEFAULT_TITLE;
    case CHART_TYPES.SPENT_VS_DEPOSITED_PIE:
      return StringConsts.SPENT_VS_DEPOSITED_PIE_DEFAULT_TITLE;
    case CHART_TYPES.SPENT_VS_INCOME_PIE:
      return StringConsts.SPENT_VS_INCOME_PIE_DEFAULT_TITLE;
  }
}
