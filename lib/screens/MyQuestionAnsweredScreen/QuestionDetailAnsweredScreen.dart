import 'package:developer_student/Models/SoruNudeBase.dart';
import 'package:developer_student/Models/SoruYanitBase.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Services/SoruYanitService.dart';
import 'package:developer_student/components/MyCustomClipper.dart';
import 'package:developer_student/components/buildDivider.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../constans.dart';

class QuestionDetailAnsweredScreen extends StatelessWidget {
  QuestionDetailAnsweredScreen({Key key, this.soru}) : super(key: key);
  SoruNude soru;
User user;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kEerieBlackColor,
        appBar: AppBar(
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
          title: Text(
            soru.baslik,
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: kEerieBlackColor,
        ),
        body: FutureBuilder(
          future: GetSoruYanit(soru.soruId),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();

            SoruYanit soruYanit = snapshot.data.data.first;

            return SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      width: size.width,
                      child: Column(
                        children: [
                          ClipPath(
                            clipper: MyCustomClipper(),
                            child: Container(
                              padding: EdgeInsets.only(top: 5, left: 15),
                              color: kChinaIvoryColor,
                              width: double.infinity,
                              height: 75,
                             /* child: TextLiquidFill(
                                loadDuration: const Duration(seconds: 2),
                                text: "${soru.kullaniciId} ",
                                textAlign: TextAlign.start,
                                waveColor: Colors.black,
                                boxWidth: 200,
                                boxBackgroundColor: kAcikMaviColor,
                                textStyle: TextStyle(
                                  fontSize: 19.0,
                                  fontWeight: FontWeight.w300,
                                ),
                                boxHeight: 40.0,
                              ),*/
                            ),
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              // topRight: Radius.circular(80),
                              //  topLeft: Radius.circular(80.0),
                              bottomRight: Radius.circular(150.0),
                              //   bottomLeft: Radius.circular(60)
                            ),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color(0xFF123456),
                                  border: Border.all(width: 0.3, color: Colors.black)),
                              child: SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Center(
                                      child: Text(
                                       soru.baslik,
                                        style: TextStyle(
                                            fontSize: 25, color: Colors.deepOrange),
                                      ),
                                    ),
                                    buildDivider(),
                                    SizedBox(
                                      height: size.height * 0.03,
                                    ),
                                    Text(
                                      "Soru:",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.deepOrange),
                                    ),
                                    Container(
                                      color: Colors.deepOrange,
                                      width: 50,
                                      height:5,
                                    ),
                                    SizedBox(height: 15,),
                                    Text(
                                      "\t\t${soru.aciklama}",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white),
                                    )
                                  ],
                                ),
                              ),
                              width: size.width,
                              height: 250.0,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              //  bottomRight: Radius.circular(80),
                              // topRight: Radius.circular(60),
                              topLeft: Radius.circular(150.0),
                              // bottomLeft: Radius.circular(80.0),
                            ),
                            child: Container(
                              padding: EdgeInsets.all(45 ),
                              color: Color(0xFF123456),
                              width: size.width,
                              height: 300,
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Yanıt:",
                                      textAlign: TextAlign.end,
                                      style: TextStyle(
                                          fontSize: 17,
                                          fontWeight: FontWeight.w300,
                                          color: Colors.deepOrange),
                                    ),
                                    Container(
                                      color: Colors.deepOrange,
                                      width: 50,
                                      height:5,
                                    ),
                                    SizedBox(height: 20),
                                    Container(
                                      height: 350,
                                     width: size.width ,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                      ),
                                    child: Text(
                                        "\t\t${soruYanit.yanit}",
                                        style: TextStyle(
                                            fontSize: 22,
                                            fontWeight: FontWeight.w300,
                                            color: Colors.black),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                    ),

                                  ],
                                ),
                              ),
                            ),
                          ),
                          //    SizedBox(height: 500,),
                          /* ClipOval(
              child: Container(
                color: Colors.blue,
                width: 200.0,
                height: 200.0,
              ),
            ),*/
                        ],
                      ),
                    ),
                  ));
          },
        ),
      ),
    );
  }
}
