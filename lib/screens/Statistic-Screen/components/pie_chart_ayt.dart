import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class AYTPieChart extends StatefulWidget {
  const AYTPieChart({Key key}) : super(key: key);

  @override
  State<AYTPieChart> createState() => _AYTPieChartState();
}

class _AYTPieChartState extends State<AYTPieChart> {
  Map<String, double> dataMap = {

    "Genel": 33,
    "Sen": 5,



  };

  List<Color> colorList = [
    const Color(0xffD95AF3),
    const Color(0xff3398F6),
    const Color(0xffFA4A42),
    const Color(0xffFE9539)
  ];

  final gradientList = <List<Color>>[
    [
      Color.fromRGBO(223, 250, 92, 1),
      Color.fromRGBO(129, 250, 112, 1),
    ],
    [
      Color.fromRGBO(129, 182, 205, 1),
      Color.fromRGBO(91, 253, 199, 1),
    ],
    [
      Color.fromRGBO(175, 63, 62, 1.0),
      Color.fromRGBO(254, 154, 92, 1),
    ]
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      /*decoration: BoxDecoration(
          border: Border.all(width: 1, color: Color(0xFFDDE3F1)),
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),*/
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      height: 380,
      child: Column(
        children: [
          Text("AYT Net Ortalaması", textAlign: TextAlign.center,),
          PieChart(
            dataMap: dataMap,
            colorList: colorList,
            chartRadius: MediaQuery.of(context).size.width / 2,
            centerText: "Net Sayısı",
            ringStrokeWidth: 24,
            animationDuration: const Duration(seconds: 3),
            chartValuesOptions: const ChartValuesOptions(
                showChartValues: true,
                showChartValuesOutside: false,
                showChartValuesInPercentage: false,
                showChartValueBackground: false),
            legendOptions: const LegendOptions(
                showLegends: true,
                legendShape: BoxShape.rectangle,
                legendTextStyle: TextStyle(fontSize: 15),
                legendPosition: LegendPosition.bottom,
                showLegendsInRow: true),
            gradientList: gradientList,
          ),
        ],
      ),
    );
  }
}