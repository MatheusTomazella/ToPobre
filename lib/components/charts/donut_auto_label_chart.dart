import 'package:charts_flutter/flutter.dart' as charts;
import 'package:expensesapp/models/chart_data_model.dart';
import 'package:flutter/material.dart';

class DonutAutoLabelChart extends StatelessWidget {
  late final List<charts.Series<ChartDataModel, double>>? seriesList;
  late final List<ChartDataModel>? data;
  final bool animate;

  DonutAutoLabelChart.fromSeries(this.seriesList,
      {Key? key, this.animate = true})
      : super(key: key) {
    data = null;
  }

  DonutAutoLabelChart.fromData(this.data, {Key? key, this.animate = true})
      : super(key: key) {
    seriesList = null;
  }

  List<charts.Series<ChartDataModel, double>> getSeries() {
    return [
      charts.Series(
        id: 'Primary',
        data: data!,
        domainFn: (ChartDataModel item, _) => item.domain,
        measureFn: (ChartDataModel item, _) => item.measure,
        labelAccessorFn: (ChartDataModel item, _) => item.label,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return charts.PieChart<double>(
      seriesList ?? getSeries(),
      animate: animate,
      defaultRenderer: charts.ArcRendererConfig(
          arcWidth: 70, arcRendererDecorators: [charts.ArcLabelDecorator()]),
    );
  }
}
