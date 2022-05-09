import 'package:expensesapp/constants/chart_types.dart';
import 'package:expensesapp/utils/get_default_chart_title.dart';
import 'package:uuid/uuid.dart';

class ChartModel {
  final String uuid;
  CHART_TYPES type;
  String title;
  List<String>? tags;

  ChartModel({
    required this.type,
    required this.title,
    this.tags,
  }) : uuid = const Uuid().v4() {
    if (title.isEmpty) title = getDefaultChartTitle(type);
  }

  ChartModel.filled({
    required this.uuid,
    required this.type,
    required this.title,
    this.tags,
  });

  ChartModel.defaultChart()
      : this.filled(
          uuid: const Uuid().v4(),
          type: CHART_TYPES.SPENT_VS_TOTAL_PIE,
          title: '',
          tags: null,
        );
}
