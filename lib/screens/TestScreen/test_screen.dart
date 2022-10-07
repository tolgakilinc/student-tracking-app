import 'package:developer_student/Models/DenemeBase.dart';
import 'package:developer_student/Models/DenemeDeleteDto.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Services/DenemeService.dart';
import 'package:developer_student/screens/TestScreen/page/test_add_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constans.dart';

class TestScreen extends StatefulWidget {
  User user;
  TestScreen({Key key, this.user}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: kHimawariYellowColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return TestAddScreen(user: widget.user,);
              },
            ),
          );
        },
      ),
      backgroundColor: kEerieBlackColor,
      appBar: AppBar(

        title: Text("Deneme Sonuçlarım"),
        backgroundColor: kEerieBlackColor,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                      builder: (context, AsyncSnapshot<DenemeBase> snapshot){
                        if(!snapshot.hasData) return Center(child:CircularProgressIndicator());

                        List<Deneme> denemeList = snapshot.data.data;

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
                                    DataCell(
                                        Center(child: Icon(FontAwesomeIcons.trash, color: kHimawariYellowColor,size: 18,)),
                                      onTap: (){
                                        showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title: Text(
                                                "Deneme sonucu silinsin mi?",
                                              ),
                                              actions: [
                                                ElevatedButton(
                                                  onPressed: () {
                                                    setState(() {
                                                      DeleteDeneme(DenemeDeleteDto(
                                                          kullaniciId: element.kullanici.kullaniciId,
                                                          tarih: element.tarih,
                                                          aytNet: element.aytNet,
                                                          denemeAdi:  element.denemeAdi,
                                                          denemeId:  element.denemeId,
                                                          dilNet: element.dilNet,
                                                          puan: element.puan,
                                                          tytNet: element.tytNet
                                                      ));
                                                      Navigator.pop(context);
                                                    });
                                                  },
                                                  child: Text(
                                                    ("Evet"),
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                  style: ElevatedButton.styleFrom(
                                                      primary: kLicoriceColor
                                                  ),
                                                ),
                                                ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text(
                                                    ("Hayır"),
                                                    style: TextStyle(color: Colors.white),
                                                  ),
                                                  style: ElevatedButton.styleFrom(
                                                      primary: kLicoriceColor
                                                  ),
                                                )
                                              ],
                                            )
                                        );

                                      }
                                    ),
                              ],
                            ),
                          );
                        });


                        return DataTable(
                            columnSpacing: 19,
                            columns: _createDenemeColums(),
                            rows: dataRows,
                        );
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
    DataColumn(
        label: Text(
          "İşlem",
          style: TextStyle(color: kHimawariYellowColor),
        )),
  ];
}

List<DataRow> _createDenemeRows({String denemeAdi, int puan, int tytNet, int aytNet, int dilNet}) {
  return [
    DataRow(cells: [
      DataCell(Text(
        denemeAdi,
        style: TextStyle(color: Colors.white),
      )),
      DataCell(Text(
        "$puan",
        style: TextStyle(color: Colors.white),
      )),
      DataCell(Text(
        "$tytNet",
        style: TextStyle(color: Colors.white),
      )),
      DataCell(Text(
        "$aytNet",
        style: TextStyle(color: Colors.white),
      )),
      DataCell(Text(
        "$dilNet",
        style: TextStyle(color: Colors.white),
      )),
    ]),
  ];
}
