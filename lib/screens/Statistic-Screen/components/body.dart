import 'package:developer_student/Models/DenemeBase.dart';
import 'package:developer_student/Services/DenemeService.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constans.dart';
import 'line_chart_Widget.dart';

class Body extends StatefulWidget {
  const Body({Key key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {

  List<Deneme> denemeList = [];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Text("İSTATİSTİKLER", style: TextStyle(fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white),),
            _buildDivider(size),
            SizedBox(
              height: 5,
            ),
            Text(
              "DENEME SONUÇLARI İSTATİSTİKLERİ",
              style: TextStyle(fontWeight: FontWeight.w600,
                  fontSize: 17,
                  color: Colors.white),
            ),
            SizedBox(
              height: 5,
            ),
            Container(

                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Color(0xFFDDE3F1)),
                    color: Color(0xFFFEF4CC),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                width: size.width,
                height: size.height / 3,
                child: FutureBuilder(
                  future: GetAllDeneme(),
                  builder: (context, AsyncSnapshot<DenemeBase> snapshot){
                    if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
                    var deneme = snapshot.data.data;
                    if(deneme.isEmpty) return Text("en az bir deneme giriniz.");

                    deneme.sort((deneme1, deneme) => deneme.tarih.compareTo(deneme1.tarih));
                    List<Deneme> list2 = [];

                    deneme.asMap().forEach((index, element) {
                      if(index < 7) list2.add(element);
                    });

                    List<Deneme> reversedList = new List.from(list2.reversed);


                    return LineChartWidget(
                      deneme: reversedList,
                    );
                  },
                )
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "DENEME SONUÇLARI",
              style: TextStyle(fontWeight: FontWeight.w600,
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
                              DataCell(Text(
                                element.denemeAdi,
                                style: TextStyle(color: Colors.white),
                              ),),
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
                  )
                ],
              ),
            ),

            SizedBox(height: 5),
            SizedBox(
              height: 5,
            ),
            Text(
              "GENEL DEĞERLENDİRME",
              style: TextStyle(fontWeight: FontWeight.w600,
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
                    builder: (context, snapshot){
                      if(!snapshot.hasData) return Center(child:CircularProgressIndicator());
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
      DataColumn(label: Text(
        "Deneme Adı", style: TextStyle(color: kHimawariYellowColor),)),
      DataColumn(
          label: Text("Puan", style: TextStyle(color: kHimawariYellowColor),)),
      DataColumn(
          label: Text("TYT", style: TextStyle(color: kHimawariYellowColor),)),
      DataColumn(
          label: Text("AYT", style: TextStyle(color: kHimawariYellowColor),)),
      DataColumn(
          label: Text("Dil", style: TextStyle(color: kHimawariYellowColor),)),
    ];
  }

  List<DataColumn> _createGenelColums() {
    return [
      DataColumn(
        label: Text("Ortalama", style: TextStyle(color: kHimawariYellowColor),),
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

    double puanToplam = 0, puanOrt = 0;
    double tytToplam = 0, tytOrt = 0;
    double aytToplam = 0, aytOrt = 0;
    double dilToplam = 0, dilOrt = 0;

    denemeList.forEach((element) {
      puanToplam += element.puan;
      tytToplam += element.tytNet;
      aytToplam += element.aytNet;
      dilToplam += element.dilNet;
    });

    puanOrt = puanToplam / denemeList.length;
    tytOrt = tytToplam / denemeList.length;
    aytOrt = aytToplam / denemeList.length;
    dilOrt = dilToplam / denemeList.length;

    return [
      DataRow(cells: [
        DataCell(Text("Puan", style: TextStyle(color: Colors.white),)),
        DataCell(Text(":", style: TextStyle(color: Colors.white),)),
        DataCell(Text("${puanOrt}",
          style: TextStyle(color: Colors.white),)),
      ]),
      DataRow(cells: [
        DataCell(Text("TYT Net", style: TextStyle(color: Colors.white),)),
        DataCell(Text(":", style: TextStyle(color: Colors.white),)),
        DataCell(Text("${tytOrt}",
          style: TextStyle(color: Colors.white),)),
      ]),
      DataRow(cells: [
        DataCell(Text("AYT Net", style: TextStyle(color: Colors.white),)),
        DataCell(Text(":", style: TextStyle(color: Colors.white),)),
        DataCell(Text("${aytOrt}",
          style: TextStyle(color: Colors.white),)),
      ]),
      DataRow(cells: [
        DataCell(Text("DİL Net", style: TextStyle(color: Colors.white),)),
        DataCell(Text(":", style: TextStyle(color: Colors.white),)),
        DataCell(Text("${dilOrt}",
          style: TextStyle(color: Colors.white),)),
      ]),
    ];
  }
}