import 'package:developer_student/Models/DenemeBase.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'line_titles.dart';

class LineChartWidget extends StatelessWidget {

  List<Deneme> deneme;
  bool isAll;

  LineChartWidget({this.deneme, this.isAll = false});


  final List<Color> gradientColors = [
    Color(0xFF8AD8FF),
    Color(0xff0073AC),
  ];

  Iterable<E> mapIndexed<E, T>(
      Iterable<T> items, E Function(int index, T item) f) sync* {

    var index = 0;

    for (final item in items) {
      yield f(index, item);

      if(isAll){
        index = index + 1;
      }else{
        if(index == 10) break;
        index = index + 1;
      }
    }
  }

  @override
  Widget build(BuildContext context){
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: isAll ? double.parse((deneme.length - 1).toString()) : 10,
        minY: 0,
        maxY: 500,
        titlesData: LineTitles.getTitleData(deneme),
        gridData: FlGridData(
          show: true,
          getDrawingHorizontalLine: (value) {
            return FlLine(
              color: Color(0xFFC9C9C9),
              strokeWidth: 0.5, // satır kalınlığı
            );
          },
          drawVerticalLine: true, // dikey çizgi
          getDrawingVerticalLine: (value) {
            return FlLine(
              color: Color(0xFFC9C9C9),
              strokeWidth: 1,
            );
          },
        ),
        borderData: FlBorderData(

          show: true, //istatistik dışına ızgara
          border: Border.all(color: const Color(0xFFC9C9C9), width: 1),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: mapIndexed(
              deneme,
                (index, item){
                  return FlSpot(index.toDouble(), deneme[index].puan.toDouble());
                }
            ).toList(),
            isCurved: true, // noktaları birleştirme
            colors: gradientColors,
            barWidth: 2,
            // dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3 ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}