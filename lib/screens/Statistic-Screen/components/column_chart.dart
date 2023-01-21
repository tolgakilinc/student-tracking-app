

import 'package:developer_student/Models/DenemeBase.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ColumnChart extends StatefulWidget {
  Deneme deneme1;
  Deneme deneme2;

  ColumnChart({Key key, this.deneme1, this.deneme2}) : super(key: key);

  @override
  _ColumnChartState createState() => _ColumnChartState();
}

class _ColumnChartState extends State<ColumnChart> {
  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData(1, widget.deneme1.tytNet, widget.deneme2.tytNet),
      ChartData(0, widget.deneme1.aytNet, widget.deneme2.aytNet),
    ];

    return SfCartesianChart(
      // Columns will be rendered back to back
        enableSideBySideSeriesPlacement: true,
        enableAxisAnimation: true,
        isTransposed: true,
        borderWidth: 5,
        series: <ChartSeries>[

          ColumnSeries<ChartData, int>(
            xAxisName: "Deneme Tyt",
            yAxisName: "Deneme Ayt",
            dataSource: chartData,
            xValueMapper: (ChartData data, _) => data.x,
            yValueMapper: (ChartData data, _) => data.y,
          ),
          ColumnSeries<ChartData, int>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.x,
              yValueMapper: (ChartData data, _) => data.y1
          )
        ]
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.y1);
  final int x;
  final int y;
  final int y1;
}