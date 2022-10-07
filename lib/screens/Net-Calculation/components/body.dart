import 'package:developer_student/components/ToastHelper.dart';
import 'package:developer_student/screens/TestScreen/test_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constans.dart';

class Body extends StatelessWidget {
  Body({Key key}) : super(key: key);

  TextEditingController turkceDogru = TextEditingController(text: "");
  TextEditingController turkceYanlis = TextEditingController(text: "");
  TextEditingController sosyalDogru = TextEditingController(text: "");
  TextEditingController sosyalYanlis = TextEditingController(text: "");
  TextEditingController temelMatematikDogru = TextEditingController(text: "");
  TextEditingController temelMatematikYanlis = TextEditingController(text: "");
  TextEditingController fenBilimleriDogru = TextEditingController(text: "");
  TextEditingController fenBilimleriYanlis = TextEditingController(text: "");
  TextEditingController TDEdebiyatiDogru = TextEditingController(text: "");
  TextEditingController TDEdebiyatiYanlis = TextEditingController(text: "");
  TextEditingController tarih1Dogru = TextEditingController(text: "");
  TextEditingController tarih1Yanlis = TextEditingController(text: "");
  TextEditingController cografya1Dogru = TextEditingController(text: "");
  TextEditingController cogragya1Yanlis = TextEditingController(text: "");
  TextEditingController tarih2Dogru = TextEditingController(text: "");
  TextEditingController tarih2Yanlis = TextEditingController(text: "");
  TextEditingController cografya2Dogru = TextEditingController(text: "");
  TextEditingController cografya2Yanlis = TextEditingController(text: "");
  TextEditingController felsefeDogru = TextEditingController(text: "");
  TextEditingController felsefeYanlis = TextEditingController(text: "");
  TextEditingController dinKulturuDogru = TextEditingController(text: "");
  TextEditingController dinKulturuYanlis = TextEditingController(text: "");
  TextEditingController matematikDogru = TextEditingController(text: "");
  TextEditingController matematikYanlis = TextEditingController(text: "");
  TextEditingController fizikDogru = TextEditingController(text: "");
  TextEditingController fizikYanlis = TextEditingController(text: "");
  TextEditingController kimyaDogru = TextEditingController(text: "");
  TextEditingController kimyaYanlis = TextEditingController(text: "");
  TextEditingController biyolojiDogru = TextEditingController(text: "");
  TextEditingController biyolojiYanlis = TextEditingController(text: "");
  TextEditingController dilDogru = TextEditingController(text: "");
  TextEditingController dilYanlis = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SingleChildScrollView(
        // scrollDirection: Axis.horizontal,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.01,
            ),
            Text(
              "TYT SINAVI (YKS 1. OTURUM)",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            DataTable(
                columnSpacing: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      colors: [Color(0xFF323744), Color(0xFF1C1C1C)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 0.5,
                      //offset: Offset(1, 1),// changes position of shadow
                    ),
                  ],
                ),
                //dataRowHeight: 75,
                columns: _createTYTColums(),
                rows: _createTYTRows()),
            SizedBox(
              height: 15,
            ),
            Text(
              "AYT SINAVI (YKS 2. OTURUM)",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            DataTable(
                columnSpacing: 40,
                decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      colors: [Color(0xFF323744), Color(0xFF1C1C1C)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 0.5,
                      //offset: Offset(1, 1),// changes position of shadow
                    ),
                  ],
                ),
                //dataRowHeight: 75,
                columns: _createATYColums(),
                rows: _createATYRows()),
            SizedBox(
              height: 15,
            ),
            Text(
              "YKS YABANCI DİL SINAVI ",
              style: TextStyle(
                // wordSpacing: 15,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            DataTable(
                columnSpacing: 56,
                decoration: BoxDecoration(
                  color: Colors.white,
                  gradient: LinearGradient(
                      colors: [Color(0xFF323744), Color(0xFF1C1C1C)],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.white,
                      blurRadius: 0.5,
                      //offset: Offset(1, 1),// changes position of shadow
                    ),
                  ],
                ),
                //dataRowHeight: 75,
                columns: _createDilColums(),
                rows: _createDilRows()),
            SizedBox(
              height: 15,
            ),
            Container(
              width: size.width * 1.9 / 2,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xFFFBC702),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                onPressed: () {
                  if (turkceDogru.text.isNotEmpty &&
                      turkceYanlis.text.isNotEmpty &&
                      sosyalDogru.text.isNotEmpty &&
                      sosyalYanlis.text.isNotEmpty &&
                      temelMatematikDogru.text.isNotEmpty &&
                      temelMatematikYanlis.text.isNotEmpty &&
                      fenBilimleriDogru.text.isNotEmpty &&
                      fenBilimleriYanlis.text.isNotEmpty &&
                      TDEdebiyatiYanlis.text.isNotEmpty &&
                      TDEdebiyatiDogru.text.isNotEmpty &&
                      tarih1Dogru.text.isNotEmpty &&
                      tarih1Yanlis.text.isNotEmpty &&
                      cogragya1Yanlis.text.isNotEmpty &&
                      cografya1Dogru.text.isNotEmpty &&
                      tarih2Dogru.text.isNotEmpty &&
                      tarih2Yanlis.text.isNotEmpty &&
                      cografya2Yanlis.text.isNotEmpty &&
                      cografya2Dogru.text.isNotEmpty &&
                      felsefeDogru.text.isNotEmpty &&
                      felsefeYanlis.text.isNotEmpty &&
                      dinKulturuYanlis.text.isNotEmpty &&
                      dinKulturuDogru.text.isNotEmpty &&
                      matematikDogru.text.isNotEmpty &&
                      matematikYanlis.text.isNotEmpty &&
                      fizikYanlis.text.isNotEmpty &&
                      fizikDogru.text.isNotEmpty &&
                      kimyaYanlis.text.isNotEmpty &&
                      kimyaDogru.text.isNotEmpty &&
                      biyolojiYanlis.text.isNotEmpty &&
                      biyolojiDogru.text.isNotEmpty&&
                      dilYanlis.text.isNotEmpty&&
                      dilDogru.text.isNotEmpty) {

                    double turkceNet = int.parse(turkceDogru.text) -
                        (int.parse(turkceYanlis.text) / 4);

                    double sosyalBilgilerNet = int.parse(sosyalDogru.text) -
                        (int.parse(sosyalYanlis.text) / 4);

                    double temelmatematikNet =
                        int.parse(temelMatematikDogru.text) -
                            (int.parse(temelMatematikYanlis.text) / 4);

                    double fenBilimleriNet = int.parse(fenBilimleriDogru.text) -
                        (int.parse(fenBilimleriYanlis.text) / 4);

                    /*  print(turkceNet.toString());
                  print(sosyalBilgilerNet.toString());
                  print(temelmatematikNet.toString());
                  print(fenBilimleriNet.toString());*/
                    //AYT
                    double tDEdebiyatNet = int.parse(TDEdebiyatiDogru.text) -
                        (int.parse(TDEdebiyatiYanlis.text) / 4);

                    double tarih1Net = int.parse(tarih1Dogru.text) -
                        (int.parse(tarih1Yanlis.text) / 4);

                    double cografya1Net = int.parse(cografya1Dogru.text) -
                        (int.parse(cogragya1Yanlis.text) / 4);

                    double tarih2Net = int.parse(tarih2Dogru.text) -
                        (int.parse(tarih2Dogru.text) / 4);

                    double cografya2Net = int.parse(cografya2Dogru.text) -
                        (int.parse(cografya2Yanlis.text) / 4);

                    double felsefeNet = int.parse(felsefeDogru.text) -
                        (int.parse(felsefeYanlis.text) / 4);

                    double dinNet = int.parse(dinKulturuDogru.text) -
                        (int.parse(dinKulturuYanlis.text) / 4);

                    double matematikNet = int.parse(matematikDogru.text) -
                        (int.parse(matematikYanlis.text) / 4);

                    double fizikNet = int.parse(fizikDogru.text) -
                        (int.parse(fizikYanlis.text) / 4);

                    double kimyaNet = int.parse(kimyaDogru.text) -
                        (int.parse(kimyaYanlis.text) / 4);

                    double biyolojiNet = int.parse(biyolojiDogru.text) -
                        (int.parse(biyolojiYanlis.text) / 4);
                    //Dii

                    double dilNet = int.parse(dilDogru.text) -
                        (int.parse(dilYanlis.text) / 4);

                    double tytNet = turkceNet +
                        sosyalBilgilerNet +
                        temelmatematikNet +
                        fenBilimleriNet;
                    double tytPuan = turkceNet * 1.3 +
                        sosyalBilgilerNet * 1.3 +
                        temelmatematikNet * 1.4 +
                        fenBilimleriNet * 1.4;

                    double aytsayisalNet =
                        matematikNet + fizikNet + kimyaNet + biyolojiNet;
                    double aytsayisalPuan = matematikNet * 3 +
                        fizikNet * 2.85 +
                        kimyaNet * 3.07 +
                        biyolojiNet * 3.07;
                    double sayisalPuan = tytPuan + aytsayisalPuan + 100;

                    double aytEsitAgirlikNet =
                        matematikNet + tDEdebiyatNet + tarih1Net + cografya1Net;
                    double aytEsitAgirlikPuan = matematikNet * 3 +
                        tDEdebiyatNet * 3 +
                        tarih1Net * 2.8 +
                        cografya1Net * 3.3;
                    double esitAgirlikPuan = tytPuan + aytEsitAgirlikPuan + 100;

                    double aytSozelNet = tDEdebiyatNet +
                        tarih1Net +
                        cografya1Net +
                        tarih2Net +
                        cografya2Net +
                        felsefeNet +
                        dinNet;
                    double aytSozelPuan = tDEdebiyatNet * 3 +
                        tarih1Net * 2.8 +
                        cografya1Net * 3.33 +
                        tarih2Net * 2.90 +
                        cografya2Net * 2.90 +
                        felsefeNet * 3 +
                        dinNet * 3.33;
                    double sozelPuan = tytPuan + aytSozelPuan + 100;

                    double aytDilPuan = dilNet * 3;
                    double dilPuan = aytDilPuan + tytPuan + 100;

                    print(aytSozelNet.toString());
                    print(sozelPuan.toString());

                    print(aytEsitAgirlikNet.toString());
                    print(esitAgirlikPuan.toString());

                    print(tytNet.toString());
                    print(tytPuan.toString());

                    print(aytsayisalNet.toString());
                    print(sayisalPuan.toString());

                    print(dilNet.toString());
                    print(dilPuan.toString());

                    showDialog(
                        context: context,
                        builder: (ctx) => AlertDialog(
                          title: Column(
                            children: [
                              Text("Net ve puan sonucunuz",style: TextStyle(color: Colors.red),),
                              _buildDivider(size),
                              Text( "TYT net"),
                              Text(tytNet.toString()),
                              _buildDivider(size),
                              Text("Sayısal net/Puan:"),
                              Text(aytsayisalNet.toString()+ "/"+sayisalPuan.toString()),
                              _buildDivider(size),
                              Text("Eşit Ağırlık Net/Puan: " ),
                              Text(aytEsitAgirlikNet.toString()+"/"+ esitAgirlikPuan.toString()),
                              _buildDivider(size),
                              Text("Sözel Net/Puan: "),
                              Text(aytSozelNet.toString()+"/"+sozelPuan.toString()),
                              _buildDivider(size),
                              Text("Dil Net/Puan: "),
                              Text(dilNet.toString()+"/" +dilPuan.toString())
                            ],
                            /*"İşlem Sonucu\t" +
                                "Sayısal Puanınız : " +
                                sayisalPuan.toString() + "\t"
                                "Sözel:" +
                                sozelPuan.toString() + "\t" +
                                "Eşit Ağırlık : " +
                                esitAgirlikPuan.toString() + "\t" +
                                "Dil: " +
                                dilPuan.toString(),*/
                          ),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                ("Kapat"),
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: kLicoriceColor),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return TestScreen();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                ("Kaydet"),
                                style: TextStyle(color: Colors.white),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: kLicoriceColor),
                            )
                          ],
                        ));
                    ;
                    ToastHelper()
                        .makeToastMessage("Puanınız Hesaplandı.");
                  } else {
                    ToastHelper().makeToastMessage(
                        "Lütfen doğru yanlış değerlerini doldurunuz.");
                  }

                  /*  print(turkDiliEdebiyatNet.toString());
                  print(tarih1Net.toString());
                  print(cografya1Net.toString());
                  print(tarih2Net.toString());
                  print(cografya2Net.toString());40
                  print(felsefeNet.toString());
                  print(dinNet.toString());
                  print(matematikNet.toString());
                  print(fizikNet.toString());
                  print(kimyaNet.toString());
                  print(biyolojiNet.toString());
                  */
                },
                child: Text(
                  'Net Hesapla',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1C1C1C)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<DataColumn> _createTYTColums() {
    return [
      DataColumn(
        label: Text("Ders Adı", style: TextStyle(color: Colors.white)),
      ),
      DataColumn(
        label: Text("Soru", style: TextStyle(color: Colors.white)),
      ),
      DataColumn(
        label: Text("Doğru", style: TextStyle(color: Colors.white)),
      ),
      DataColumn(
        label: Text("Yanlış", style: TextStyle(color: Colors.white)),
      ),
      /* DataColumn(
        label: Text("Net", style: TextStyle(color: Colors.white)),
      ),*/
    ];
  }

  List<DataRow> _createTYTRows() {
    return [
      DataRow(cells: [
        DataCell(Text("Türkçe", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text("(40)", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(_field(turkceDogru)),
        DataCell(_field(turkceYanlis)),
        //   DataCell(Text("")),
      ]),
      DataRow(cells: [
        DataCell(
            Text("Sosyal Bilgiler", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text("(20)", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(_field(sosyalDogru)),
        DataCell(_field(sosyalYanlis)),
      ]),
      DataRow(cells: [
        DataCell(
            Text("Temel Matematik", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text("(40)", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(_field(temelMatematikDogru)),
        DataCell(_field(temelMatematikYanlis)),
      ]),
      DataRow(cells: [
        DataCell(
            Text("Fen Bilimleri", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text("(20)", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(_field(fenBilimleriDogru)),
        DataCell(_field(fenBilimleriYanlis)),
      ]),
    ];
  }

  _createATYColums() {
    return [
      DataColumn(
        label: Text("Ders Adı", style: TextStyle(color: Colors.white)),
      ),
      DataColumn(
        label: Text("Soru", style: TextStyle(color: Colors.white)),
      ),
      DataColumn(
        label: Text("Doğru", style: TextStyle(color: Colors.white)),
      ),
      DataColumn(
        label: Text("Yanlış", style: TextStyle(color: Colors.white)),
      ),
      /*   DataColumn(
        label: Text("Net", style: TextStyle(color: Colors.white)),
      ),*/
    ];
  }

  _createATYRows() {
    return [
      DataRow(cells: [
        DataCell(Text("TÜRK DİLİ VE EDEBİYATI",
            style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text(":", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text("")),
        DataCell(Text("")),
      ]),
      DataRow(cells: [
        DataCell(Text("Türk Dili ve Edebiyatı",
            style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text("(24)", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(_field(TDEdebiyatiDogru)),
        DataCell(_field(TDEdebiyatiYanlis)),
      ]),
      DataRow(cells: [
        DataCell(Text("Tarih-1", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text("(10)", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(_field(tarih1Dogru)),
        DataCell(_field(tarih1Yanlis)),
      ]),
      DataRow(cells: [
        DataCell(Text("Coğrafya-1", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text("(6)", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(_field(cografya1Dogru)),
        DataCell(_field(cogragya1Yanlis)),
      ]),
      DataRow(cells: [
        DataCell(Text("SOSYAL BİLİMLER-2",
            style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text(":", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text("")),
        DataCell(Text("")),
      ]),
      DataRow(cells: [
        DataCell(Text("Tarih-2", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text("(11)", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(_field(tarih2Dogru)),
        DataCell(_field(tarih2Yanlis)),
      ]),
      DataRow(cells: [
        DataCell(Text("Coğrafya-2", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text("(40)", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(_field(cografya2Dogru)),
        DataCell(_field(cografya2Yanlis)),
      ]),
      DataRow(cells: [
        DataCell(
            Text("Felsefe Grubu", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text("(12)", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(_field(felsefeDogru)),
        DataCell(_field(felsefeYanlis)),
      ]),
      DataRow(cells: [
        DataCell(
            Text("Din Kültürü", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text("(12)", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(_field(dinKulturuDogru)),
        DataCell(_field(dinKulturuYanlis)),
      ]),
      DataRow(cells: [
        DataCell(Text("MATEMATİK", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text(":", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text("")),
        DataCell(Text("")),
      ]),
      DataRow(cells: [
        DataCell(Text("Matematik", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text("(40)", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(_field(matematikDogru)),
        DataCell(_field(matematikYanlis)),
      ]),
      DataRow(cells: [
        DataCell(
            Text("FEN BİLİMLERİ", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text(":", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text("")),
        DataCell(Text("")),
      ]),
      DataRow(cells: [
        DataCell(Text("Fizik", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text("(14)", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(_field(fizikDogru)),
        DataCell(_field(fizikYanlis)),
      ]),
      DataRow(cells: [
        DataCell(Text("Kimya", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text("(13)", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(_field(kimyaDogru)),
        DataCell(_field(kimyaYanlis)),
      ]),
      DataRow(cells: [
        DataCell(Text("Biyoloji", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text("(13)", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(_field(biyolojiDogru)),
        DataCell(_field(biyolojiYanlis)),
      ]),
    ];
  }

  _createDilColums() {
    return [
      DataColumn(
        label: Text("Ders Adı", style: TextStyle(color: Colors.white)),
      ),
      DataColumn(
        label: Text("Soru", style: TextStyle(color: Colors.white)),
      ),
      DataColumn(
        label: Text("Doğru", style: TextStyle(color: Colors.white)),
      ),
      DataColumn(
        label: Text("Yanlış", style: TextStyle(color: Colors.white)),
      ),
    ];
  }

  _createDilRows() {
    return [
      DataRow(cells: [
        DataCell(Text("Dil", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(Text("(80)", style: TextStyle(color: kChinaIvoryColor))),
        DataCell(_field(dilDogru)),
        DataCell(_field(dilYanlis)),
      ]),
    ];
  }
}

_field(TextEditingController controller) {
  return Container(
    alignment: Alignment(50, 40),
    width: 45,
    height: 25,
    decoration: BoxDecoration(
      color: Colors.white, //Theme.of(context).primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(12)),
    ),
    child: TextField(
      keyboardType: TextInputType.number,
      controller: controller,
      textAlign: TextAlign.center,
      autofocus: true,
      cursorColor: Colors.black87,
      style: TextStyle(
          color: Colors.black87, fontWeight: FontWeight.w500, fontSize: 15),
      decoration: InputDecoration(
        fillColor: Colors.red,
        border: InputBorder.none,
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