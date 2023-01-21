import 'dart:io';
//import 'dart:typed_data';
//import 'package:flutter/rendering.dart';
import 'package:developer_student/Models/DenemeBase.dart';
import 'package:developer_student/Models/OrtalamaBase.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Providers/LoginProvider.dart';
import 'package:developer_student/Providers/OrtalamaProvider.dart';
import 'package:developer_student/screens/Home/home_screen.dart';
import 'package:developer_student/screens/SortScreen/panel.dart';
import 'package:developer_student/screens/SortScreen/radial_chart_Ayt.dart';
import 'package:developer_student/screens/SortScreen/radial_chart_tyt.dart';
import 'package:developer_student/screens/Statistic-Screen/components/RangeColumnChart.dart';
import 'package:developer_student/screens/Statistic-Screen/components/pie_chart_ayt.dart';
import 'package:developer_student/screens/Statistic-Screen/components/pie_chart_tyt.dart';
//import 'package:esys_flutter_share_plus/esys_flutter_share_plus.dart';
import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
//import 'package:screenshot/screenshot.dart';
import '../../constans.dart';
import 'package:share_plus/share_plus.dart';

// import 'package:path_provider/path_provider.dart';
// import 'package:flutter/rendering.dart';

class SortScreen extends StatefulWidget {
  User user;

  SortScreen({Key key, this.user}) : super(key: key);

  @override
  _SortScreenState createState() => _SortScreenState();
}

class _SortScreenState extends State<SortScreen> {
 // File _imageFile;

 // ScreenshotController screenshotController = ScreenshotController();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        drawer: Drawer(
          child: DrawerHeader(
            decoration: BoxDecoration(color: Colors.white12),
            child: PanelScreen(),
          ),
        ),
        appBar: AppBar(
          actions: [
            Padding(
              padding: EdgeInsets.all(10),
              child: IconButton(
                icon: Icon(Icons.share_outlined),
                onPressed: () {
                  Share.share('Test ', subject: 'Look what I made!' );
    }


              ),
            )
          ],
          title: Text("Sıralamam"),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(Icons.arrow_back_ios),
                onPressed: () {
                 //  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ),
                  );
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          backgroundColor: kEerieBlackColor,
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 300,
                      child: RangeColumnChart(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    /*TYTPieChart(),
                      SizedBox(
                        height: 15,
                      ),
                      AYTPieChart(),*/
                    SizedBox(
                      height: 15,
                    ),

                    Center(
                      child: Text(
                        "Tyt Net Karşılaştırılması",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),

                    Consumer<OrtalamaProvider>(
                      builder: (context, ortalama, child) {
                        List<Ortalama> allOrtalama =
                        ortalama.getOrtalamaBase() == null
                            ? []
                            : ortalama.getOrtalamaBase().ortalama;

                        User user =
                        Provider.of<LoginProvider>(context, listen: false)
                            .getUser();

                        Ortalama findOrtalama = allOrtalama.firstWhere(
                                (element) =>
                            element.kullanici.kullaniciId == user.kullaniciId,
                            orElse: () => Ortalama(tytOrt: 0));

                        return RadialChartTyt(
                          kullaniciOrtalama: findOrtalama.tytOrt,
                          genelOrtalama: allOrtalama.length == 0
                              ? OrtalamaBase(genelTytOrt: 0)
                              : ortalama.getOrtalamaBase(),
                          secilenKullaniciOrtalama: allOrtalama.length == 0
                              ? Ortalama(tytOrt: 0)
                              : ortalama.getSecilenKullaniciOrtalama(),
                        );
                      },
                    ),
                    Center(
                      child: Text(
                        "Ayt Net Karşılaştırılması",
                        style: TextStyle(fontSize: 15),
                      ),
                    ),
                    Consumer<OrtalamaProvider>(
                      builder: (context, ortalama, child) {
                        List<Ortalama> allOrtalama =
                        ortalama.getOrtalamaBase() == null
                            ? []
                            : ortalama.getOrtalamaBase().ortalama;

                        User user =
                        Provider.of<LoginProvider>(context, listen: false)
                            .getUser();

                        Ortalama findOrtalama = allOrtalama.firstWhere(
                                (element) =>
                            element.kullanici.kullaniciId == user.kullaniciId,
                            orElse: () => Ortalama(aytOrt: 0));

                        return RadialChartAyt(
                          kullaniciOrtalama: findOrtalama.aytOrt,
                          genelOrtalama: allOrtalama.length == 0
                              ? OrtalamaBase(genelAytOrt: 0)
                              : ortalama.getOrtalamaBase(),
                          secilenKullaniciOrtalama: allOrtalama.length == 0
                              ? Ortalama(aytOrt: 0)
                              : ortalama.getSecilenKullaniciOrtalama(),
                        );
                      },
                    ),
                    Row(
                      children: [
                        Expanded(
                            flex: 3,
                            child: Container(
                              width: 10,
                              color: Color(0xffE88282),
                              child: Text("Seçilen Öğrenci",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,),),

                            )),

                        Expanded(
                            flex: 3,
                            child: Container(
                              color: Color(0xffBF7B7B),
                              child: Text("Genel Ortalama",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,),),

                            )),

                        Expanded(
                            flex: 3,
                            child: Container(
                              color: Color(0xff2F5971),
                              child: Text("Sen",textAlign: TextAlign.center,style: TextStyle(color: Colors.white,),),

                            )),


                      ],
                    ),
                    SizedBox(
                      height: 15,
                    )
                    // PieChartPage(),
                    /* Padding(
                          padding: const EdgeInsets.all(8),
                        child: PageView(
                          children: [
                            PieChartPage()
                          ],
                        ),

                      ),*/
                  ],
                )),
          ),
        ),
      ),
    );
  }

 /* _takeScreenshotandShare() async {
    _imageFile = null;
    screenshotController
        .capture(delay: Duration(milliseconds: 10), pixelRatio: 2.0)
        .then((File image) async {
      setState(() {
        _imageFile = image;
      });
      final directory = (await getApplicationDocumentsDirectory()).path;
      Uint8List pngBytes = _imageFile.readAsBytesSync();
      File imgFile = new File('$directory/screenshot.png');
      imgFile.writeAsBytes(pngBytes);
      print("Dosya kaydedildi");
      await Share.file('Anupam', 'screenshot.png', pngBytes, 'image/png');
    }).catchError((onError) {
      print(onError);
    });
  }*/
}
