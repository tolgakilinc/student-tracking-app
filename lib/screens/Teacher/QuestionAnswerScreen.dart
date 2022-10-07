import 'package:developer_student/Models/SoruNudeBase.dart';
import 'package:developer_student/Models/SoruYanitCreateDto.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Services/SoruYanitService.dart';
import 'package:developer_student/components/MyCustomClipper.dart';
import 'package:developer_student/components/ToastHelper.dart';
import 'package:developer_student/components/buildDivider.dart';
import 'package:developer_student/components/editing_input_field.dart';
import 'package:developer_student/components/rounded_button.dart';
import 'package:developer_student/constans.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../constans.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class QuestionAnswerScreen extends StatefulWidget {
  SoruNude soru;
  User user;

  QuestionAnswerScreen({Key key, this.soru, this.user}) : super(key: key);

  @override
  State<QuestionAnswerScreen> createState() => _QuestionAnswerScreenState();
}

class _QuestionAnswerScreenState extends State<QuestionAnswerScreen> {
  TextEditingController answer = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: kEerieBlackColor,
          appBar: AppBar(
            leading: Builder(
              builder: (BuildContext context) {
                return IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  tooltip:
                      MaterialLocalizations.of(context).openAppDrawerTooltip,
                );
              },
            ),
            title: Text(
              widget.soru.baslik,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: kEerieBlackColor,
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Container(
              width: size.width,
              child: Column(
                children: [
                  ClipPath(
                    clipper: MyCustomClipper(),
                    child: Container(
                      padding: EdgeInsets.only(top: 5, left: 15),
                      color: kAcikMaviColor,
                      width: double.infinity,
                      height: 75,
                      child: TextLiquidFill(
                        loadDuration: const Duration(seconds: 2),
                        text: "${widget.user.ad}  ${widget.user.soyad}",
                        textAlign: TextAlign.start,
                        waveColor: Colors.black,
                        boxWidth: 200,
                        boxBackgroundColor: kAcikMaviColor,
                        textStyle: TextStyle(
                          fontSize: 19.0,
                          fontWeight: FontWeight.w300,
                        ),
                        boxHeight: 40.0,
                      ),
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
                                widget.soru.baslik,
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
                              "\t\t${widget.soru.aciklama}",
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
                      padding: EdgeInsets.all(50),
                      color: Color(0xFF123456),
                      width: size.width,
                      height: 300.0,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 35),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                              ),
                              child: TextField(
                                style: TextStyle(color: Colors.black),
                                cursorColor: Colors.black,
                                autocorrect: true,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 10.0, vertical: 10.0),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide:
                                        BorderSide(color: Colors.black, width: 2),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.5),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    gapPadding: 0.0,
                                    borderRadius: BorderRadius.circular(12),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1.5),
                                  ),
                                  hintText: 'Soruyu Yanıtla',
                                  hintStyle: TextStyle(color: Colors.black),
                                ),
                                controller: answer,
                                minLines: 1,
                                maxLines: 50,
                              ),
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            RoundedButton(
                              color: kEerieBlackColor,
                              text: "Soruyu Yanıtlayınız",
                              press: () {
                                if (answer.text.isNotEmpty) {
                                  CreateSoruYanit(SoruYanitCreateDto(
                                      soruId: widget.soru.soruId,
                                      kullaniciId: widget.user.kullaniciId,
                                      yanit: answer.text));
                                  ToastHelper().makeToastMessage(
                                    "Soru Yanıtlandı",
                                  );
                                } else {
                                  ToastHelper().makeToastMessage(
                                      "Lütfen soruyu yanıtlayınız.");
                                }
                              },
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
          ))),
    );
  }
}


