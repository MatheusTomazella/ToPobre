import 'package:expensesapp/constants/chart_types.dart';
import 'package:expensesapp/utils/get_default_chart_title.dart';
import 'package:uuid/uuid.dart';

class ChartModel {
  final String uuid;
  CHART_TYPES type;
  late String title;
  List<String>? tags;

  ChartModel({
    required this.type,
    String? title,
    this.tags,
  }) : uuid = const Uuid().v4() {
    this.title =
        (title == null || title.isEmpty) ? getDefaultChartTitle(type) : title;
  }

  ChartModel.filled({
    required this.uuid,
    required this.type,
    required this.title,
    this.tags,
  });

  ChartModel.from(ChartModel other)
      : this.filled(
          uuid: other.uuid,
          type: other.type,
          title: other.title,
          tags: other.tags,
        );

  ChartModel.defaultChart()
      : this.filled(
          uuid: const Uuid().v4(),
          type: CHART_TYPES.SPENT_VS_DEPOSITED_PIE,
          title: '',
          tags: null,
        );

  Map<String, dynamic> toMap() => {
        'uuid': uuid,
        'type': type,
        'title': title,
        'tags': tags,
      };
}
