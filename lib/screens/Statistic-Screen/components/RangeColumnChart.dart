import 'package:developer_student/Models/DenemeBase.dart';
import 'package:developer_student/Models/OrtalamaBase.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Providers/LoginProvider.dart';
import 'package:developer_student/Providers/OrtalamaProvider.dart';
import 'package:developer_student/Services/DenemeService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class RangeColumnChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  _MyHomePage();
  }
}

class _MyHomePage extends StatefulWidget {
    User user;
  _MyHomePage({Key key, this.user}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: Consumer<LoginProvider>(
          builder: (context, user, child){
            return Consumer<OrtalamaProvider>(
              builder: (context, ortalama, child){
                return FutureBuilder(
                  future: GetAllDeneme(),
                  builder: (context, AsyncSnapshot<DenemeBase> snapshot){
                    if(!snapshot.hasData) return CircularProgressIndicator();
                      if(ortalama.getSecilenKullaniciOrtalama() == null) return Center(
                        child: AnimatedTextKit(
                          animatedTexts: [
                            WavyAnimatedText('Menüden Kullanıcı Seçiciniz.',
                                textStyle: TextStyle(color: Color(0xff123456), fontSize: 15)),
                          ],
                          //  displayFullTextOnTap: true,
                          pause: const Duration(milliseconds: 1),
                          // stopPauseOnTap: true,
                          isRepeatingAnimation: true,

                          onTap: () {
                            print("Kullanıcı Seç");
                          },
                        ),);


                    Ortalama secilenKullanici = ortalama.getSecilenKullaniciOrtalama();
                    List<Deneme> secilenKullanicininOrtalamalari = snapshot.data.data.where((element) => element.kullanici.kullaniciId == secilenKullanici.kullanici.kullaniciId).toList();

                    List<Deneme> girisYapanKullanicininOrtalamalari = snapshot.data.data.where((element) => element.kullanici.kullaniciId == user.getUser().kullaniciId).toList();

                    List<_SalesData> dataaa = [];
                    List<_SalesData> data = [];

                    for(int i = 0; i< secilenKullanicininOrtalamalari.length; i++){
                      dataaa.add(_SalesData(i.toString(), secilenKullanicininOrtalamalari[i].puan));
                    }

                    for(int i = 0; i< girisYapanKullanicininOrtalamalari.length; i++){
                      data.add(_SalesData(i.toString(), girisYapanKullanicininOrtalamalari[i].puan));
                    }

                    return Column(children: [
                      //Initialize the chart widget
                      SfCartesianChart(
                          primaryXAxis: CategoryAxis(),
                          // Chart title
                          title: ChartTitle(text: 'Denemeler'),
                          /*enableMultiSelection: true,
                          enableAxisAnimation: true,
                          enableSideBySideSeriesPlacement: true,*/
                          // Enable legend
                          legend: Legend(isVisible: true),
                          // Enable tooltip
                          tooltipBehavior: TooltipBehavior(enable: true),
                          series: <ChartSeries<_SalesData, String>>[
                            LineSeries<_SalesData, String>(
                                dataSource: data,
                                xValueMapper: (_SalesData sales, _) => sales.year,
                                yValueMapper: (_SalesData sales, _) => sales.sales,
                                name: 'Sen',
                                // Enable data label
                                dataLabelSettings: DataLabelSettings(isVisible: true)),
                            /*LineSeries<_SalesData, String>(
                                dataSource: dataa,
                                xValueMapper: (_SalesData sales, _) => sales.year,
                                yValueMapper: (_SalesData sales, _) => sales.sales,
                                name: 'Genel',
                                // Enable data label
                                dataLabelSettings: DataLabelSettings(isVisible: true)),*/
                            LineSeries<_SalesData, String>(
                                dataSource: dataaa,
                                xValueMapper: (_SalesData sales, _) => sales.year,
                                yValueMapper: (_SalesData sales, _) => sales.sales,
                                name: 'Seçilen Öğrenci',
                                // Enable data label
                                dataLabelSettings: DataLabelSettings(isVisible: true))
                          ]),
                    ]);
                  },
                );
              },
            );
          },
        )
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final int sales;
}