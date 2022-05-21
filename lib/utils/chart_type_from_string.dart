import '../constants/chart_types.dart';

CHART_TYPES chartTypeFromString(String string) {
  return CHART_TYPES.values
      .firstWhere((element) => element.toString() == string);
}
