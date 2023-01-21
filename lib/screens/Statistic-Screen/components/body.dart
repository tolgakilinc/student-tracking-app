import 'package:developer_student/Models/DenemeBase.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Services/DenemeService.dart';
import 'package:developer_student/screens/Statistic-Screen/components/gaugesChartAYT.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../constans.dart';
import 'column_chart.dart';
import 'gaugesChartTYT.dart';
import 'line_chart_Widget.dart';

class Body extends StatefulWidget {
   Body({Key key, this.user}) : super(key: key);
  User user;
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  List<Deneme> denemeList = [];

  double puanOrt = 0;
  double tytOrt = 0;
  double aytOrt = 0;
  double dilOrt = 0;

  String dropdownvalue = 'Son 10';

  var items = [
    'Son 10',
    'İlk 10',
    'Tüm Denemeler',
  ];

  String deneme1DropDownValue = "1";
  String oldDeneme1DropdownValue = "1";
  dynamic deneme1;
  String deneme2DropDownValue = "1";
  String oldDeneme2DropdownValue = "1";
  dynamic deneme2;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "İSTATİSTİKLER",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            _buildDivider(size),
            SizedBox(
              height: 5,
            ),
            Text(
              "DENEME SONUÇLARI İSTATİSTİKLERİ",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Colors.white),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xFFDDE3F1)),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                //padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                width: size.width,
                // height: size.height / 3,
                child: Column(
                  children: [
                    FutureBuilder(
                      future: GetAllDeneme(),
                      builder: (context, AsyncSnapshot<DenemeBase> snapshot) {
                        if (!snapshot.hasData)
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        var deneme = snapshot.data.data;
                        if (deneme.isEmpty)
                          return Text("en az bir deneme giriniz.");

                        if(dropdownvalue == "İlk 10"){
                          deneme.sort((deneme1, deneme) =>
                              deneme.tarih.compareTo(deneme1.tarih));
                        }else if(dropdownvalue == "Son 10"){
                          deneme.sort((deneme, deneme1) =>
                              deneme.tarih.compareTo(deneme1.tarih));
                        }

                        List<Deneme> list2 = [];

                        deneme.asMap().forEach((index, element) {
                          list2.add(element);
                        });

                        List<Deneme> reversedList =
                            new List.from(list2.reversed);

                        return Column(
                          children: [
                            Container(
                              child:    DropdownButton(
                                value: dropdownvalue,
                                icon: const Icon(Icons.keyboard_arrow_down),
                                items: items.map((String items) {
                                  return DropdownMenuItem(
                                    value: items,
                                    child: Text(items),
                                  );
                                }).toList(),
                                onChanged: (String newValue) {
                                  setState(() {
                                    dropdownvalue = newValue;
                                  });
                                },
                              ),

                            ),
                            LineChartWidget(
                              isAll: dropdownvalue == "Tüm Denemeler" ? true : false,
                              deneme: reversedList,
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                )),
            SizedBox(
              height: 15,
            ),
          Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xFFDDE3F1)),
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("Deneme 1"),
                        SizedBox(width: 16),
                        Container(
                          width: size.width * 0.4,
                          child: FutureBuilder(
                              future: GetAllDeneme(),
                              builder: (context, AsyncSnapshot<DenemeBase> snapshot){
                                if(!snapshot.hasData) return CircularProgressIndicator();
                                if(snapshot.data.data.length == 0) return CircularProgressIndicator();

                                return DropdownButton(
                                  value: deneme1DropDownValue.toString(),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: snapshot.data.data.map((Deneme item) {
                                    return DropdownMenuItem(
                                      value: item.denemeId.toString(),
                                      child: Text(item.denemeAdi),
                                      onTap: (){
                                        setState(() {
                                          deneme1 = item;
                                        });
                                      },
                                    );
                                  }).toList(),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      oldDeneme1DropdownValue = deneme1DropDownValue;
                                      deneme1DropDownValue = newValue;
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Deneme 2: "),
                        SizedBox(width: 10,),
                        Container(
                          width: size.width * 0.4,
                          child: FutureBuilder(
                              future: GetAllDeneme(),
                              builder: (context, AsyncSnapshot<DenemeBase> snapshot){
                                if(!snapshot.hasData) return CircularProgressIndicator();
                                if(snapshot.data.data.length == 0) return CircularProgressIndicator();

                                return DropdownButton(
                                  value: deneme2DropDownValue.toString(),
                                  icon: const Icon(Icons.keyboard_arrow_down),
                                  items: snapshot.data.data.map((Deneme item) {
                                    return DropdownMenuItem(
                                      value: item.denemeId.toString(),
                                      child: Text(item.denemeAdi),
                                      onTap: (){
                                        setState(() {
                                          deneme2 = item;
                                        });
                                      },
                                    );
                                  }).toList(),
                                  onChanged: (String newValue) {
                                    setState(() {
                                      oldDeneme2DropdownValue = deneme2DropDownValue;
                                      deneme2DropDownValue = newValue;
                                    });
                                  },
                                );
                              }
                          ),
                        ),
                      ],
                    ),
                    if(deneme1 != null && deneme2 != null) ColumnChart(deneme1: deneme2, deneme2: deneme1,),
                    if(deneme1 == null || deneme2 == null) Text('karşılaştıralacak denemeleri seçiniz.')
                  ],
                ),
              ),
          ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 15,
            ),
            //  Center(child: Text("TYT Net",style: TextStyle(color: Colors.white,),)),
            GaugesTYT(tytOrt:  tytOrt,),
            SizedBox(
              height: 15,
            ),
            GaugesAYT(aytOrt:  aytOrt,),
            SizedBox(
              height: 15,
            ),
            /* Padding(
              padding: EdgeInsets.all(16),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xFFDDE3F1)),
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                width: size.width,
                height: 350,
                child: Column(
                  children: <Widget>[
                    DropdownStatistic(),
                    AspectRatio(
                      aspectRatio: 12 / 9,
                      child: DChartBar(
                        data: [
                          {
                            'id': 'Bar',
                            'data': [
                              {'domain': 'Türkçe', 'measure': 38},
                              {'domain': 'Matematik', 'measure': 40},
                              {'domain': 'Fizik', 'measure': 18},
                              {'domain': 'Kimya', 'measure': 15},
                              {'domain': 'Biyoloji', 'measure': 13},
                              {'domain': 'Sosyal', 'measure': 18},
                            ],
                          },
                        ],

                        showMeasureLine: true,
                        animate: true,
                        domainLabelPaddingToAxisLine: 16,
                        axisLineTick: 2,
                        axisLinePointTick: 2,
                        axisLinePointWidth: 10,
                        axisLineColor: Colors.deepOrange,
                        measureLabelPaddingToAxisLine: 10,
                        barColor: (barData, index, id) => Colors.orange,
                        showBarValue: true,


                      ),
                    ),
                  ],
                ),
              ),
            ),*/
            SizedBox(
              height: 15,
            ),
            Text(
              "DENEME SONUÇLARI",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Colors.white),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: size.width,
              //  height: size.height / 3,
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xFFDDE3F1)),
                  color: kLicoriceColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder(
                    future: GetAllDeneme(),
                    builder: (context, AsyncSnapshot<DenemeBase> snapshot) {
                      if (!snapshot.hasData)
                        return Center(child: CircularProgressIndicator());
                      denemeList = snapshot.data.data;

                      List<DataRow> dataRows = [];

                      denemeList.forEach((element) {
                        dataRows.add(
                          DataRow(
                            cells: [
                              DataCell(
                                Text(
                                  element.denemeAdi,
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              DataCell(Text(
                                "${element.puan}",
                                style: TextStyle(color: Colors.white),
                              )),
                              DataCell(Text(
                                "${element.tytNet}",
                                style: TextStyle(color: Colors.white),
                              )),
                              DataCell(Text(
                                "${element.aytNet}",
                                style: TextStyle(color: Colors.white),
                              )),
                              DataCell(Text(
                                "${element.dilNet}",
                                style: TextStyle(color: Colors.white),
                              )),
                            ],
                          ),
                        );
                      });

                      return DataTable(
                        columnSpacing: 30,
                        columns: _createDenemeColums(),
                        rows: dataRows,
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 5),
            SizedBox(
              height: 5,
            ),
            Text(
              "GENEL DEĞERLENDİRME",
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Colors.white),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border.all(width: 1, color: Color(0xFFDDE3F1)),
                  color: kLicoriceColor,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              //  height: size.height * 0.27,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder(
                    future: GetAllDeneme(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData)
                        return Center(child: CircularProgressIndicator());
                      return DataTable(
                          dataRowHeight: 40,
                          decoration: BoxDecoration(),
                          columnSpacing: 80,
                          columns: _createGenelColums(),
                          rows: _createNotRows(denemeList));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _buildDivider(Size screenSize) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          color: Color(0xFFDDE3F1),
          width: screenSize.width,
          height: 1,
        )
      ],
    );
  }

  List<DataColumn> _createDenemeColums() {
    return [
      DataColumn(
          label: Text(
        "Deneme Adı",
        style: TextStyle(color: kHimawariYellowColor),
      )),
      DataColumn(
          label: Text(
        "Puan",
        style: TextStyle(color: kHimawariYellowColor),
      )),
      DataColumn(
          label: Text(
        "TYT",
        style: TextStyle(color: kHimawariYellowColor),
      )),
      DataColumn(
          label: Text(
        "AYT",
        style: TextStyle(color: kHimawariYellowColor),
      )),
      DataColumn(
          label: Text(
        "Dil",
        style: TextStyle(color: kHimawariYellowColor),
      )),
    ];
  }

  List<DataColumn> _createGenelColums() {
    return [
      DataColumn(
        label: Text(
          "Ortalama",
          style: TextStyle(color: kHimawariYellowColor),
        ),
      ),
      DataColumn(
        label: Text(""),
      ),
      DataColumn(
        label: Text(""),
      ),
    ];
  }

  List<DataRow> _createNotRows(List<Deneme> denemeList) {
    double puanToplam = 0;
    double tytToplam = 0;
    double aytToplam = 0;
    double dilToplam = 0;

    denemeList.forEach((element) {
      puanToplam += element.puan;
      tytToplam += element.tytNet;
      aytToplam += element.aytNet;
      dilToplam += element.dilNet;
    });

    Future.delayed(Duration(seconds: 2), (){
      setState(() {
        puanOrt = ((puanToplam / denemeList.length) * 100).roundToDouble() / 100;
        tytOrt  = ((tytToplam / denemeList.length) * 100).roundToDouble() / 100;
        aytOrt  = ((aytToplam / denemeList.length) * 100).roundToDouble() / 100;
        dilOrt  = ((dilToplam / denemeList.length) * 100).roundToDouble() / 100;
      });
    });

    return [
      DataRow(cells: [
        DataCell(Text(
          "Puan",
          style: TextStyle(color: Colors.white),
        )),
        DataCell(Text(
          ":",
          style: TextStyle(color: Colors.white),
        )),
        DataCell(Text(
          "${puanOrt}",
          style: TextStyle(color: Colors.white),
        )),
      ]),
      DataRow(cells: [
        DataCell(Text(
          "TYT Net",
          style: TextStyle(color: Colors.white),
        )),
        DataCell(Text(
          ":",
          style: TextStyle(color: Colors.white),
        )),
        DataCell(Text(
          "${tytOrt}",
          style: TextStyle(color: Colors.white),
        )),
      ]),
      DataRow(cells: [
        DataCell(Text(
          "AYT Net",
          style: TextStyle(color: Colors.white),
        )),
        DataCell(Text(
          ":",
          style: TextStyle(color: Colors.white),
        )),
        DataCell(Text(
          "${aytOrt}",
          style: TextStyle(color: Colors.white),
        )),
      ]),
      DataRow(cells: [
        DataCell(Text(
          "DİL Net",
          style: TextStyle(color: Colors.white),
        )),
        DataCell(Text(
          ":",
          style: TextStyle(color: Colors.white),
        )),
        DataCell(Text(
          "${dilOrt}",
          style: TextStyle(color: Colors.white),
        )),
      ]),
    ];
  }
}
