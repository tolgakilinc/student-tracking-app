import 'package:developer_student/Models/OrtalamaBase.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';



class RadialChartAyt extends StatelessWidget {
  int kullaniciOrtalama;
  OrtalamaBase genelOrtalama;
  Ortalama secilenKullaniciOrtalama;

  RadialChartAyt({Key key,this.kullaniciOrtalama, this.genelOrtalama, this.secilenKullaniciOrtalama}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Sen', kullaniciOrtalama, Colors.redAccent),
      ChartData('Genel', genelOrtalama.genelAytOrt,Colors.amberAccent),
      ChartData("Öğrenci1", secilenKullaniciOrtalama.aytOrt, Colors.blueAccent
      )

    ];
    return Container(
        child: SfCircularChart(
        /*  onChartTouchInteractionMove: (ChartTouchInteractionArgs args){
            print(args.position.dx.toString());
            print(args.position.dy.toString());
          },
          onChartTouchInteractionUp: (ChartTouchInteractionArgs args){
            print(args.position.dx.toString());
            print(args.position.dy.toString());
          },*/
            series: <CircularSeries>[
              // Renders radial bar chart
              RadialBarSeries<ChartData, String>(
                 gap: '3%',
                  dataSource: chartData,
                  xValueMapper: (ChartData data, _) => data.x,
                  yValueMapper: (ChartData data, _) => data.y,
                  innerRadius: '%20',
                  trackColor: Color(0xffc1cdc1),
                 strokeWidth: 400,
                 trackOpacity: 0.4,
                  useSeriesColor:false,
                  cornerStyle: CornerStyle.bothCurve,
                  dataLabelSettings: DataLabelSettings(
                    showCumulativeValues: false,
                    isVisible: true,  // verilerin sayısını gösterir
                    //color: Colors.red,

                    angle: 10, // döndürülme açısı
                    textStyle: TextStyle(color: Color(0xff123789), )
                  ),

              )
            ]
        )
    );
  }
}

class ChartData {
  ChartData(this.x, this.y, this.color);
  final String x;
  final int y;
  final Color color;
}
