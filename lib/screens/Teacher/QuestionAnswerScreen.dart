import 'package:auto_size_text/auto_size_text.dart';
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
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return Scaffold(
        resizeToAvoidBottomInset: true,
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
        body: SingleChildScrollView(
          child: Container(
        width: size.width,
        child: Column(
          children: [
            /*ClipPath(
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
            ),*/
            Card(
                margin: EdgeInsets.all(40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                elevation: 15,
                shadowColor: Colors.black,
                color: Colors.greenAccent[100],
                child: Container(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(

                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 60),
                          child: CircleAvatar(
                            backgroundColor: Colors.green[500],
                            radius: 85,
                            child: CircleAvatar(
                              backgroundImage: NetworkImage("https://assets.kompasiana.com/items/album/2022/10/14/solution-solving-problem-answer-to-hard-question-or-creativity-idea-and-innovation-help-business-success-leadership-to-overcome-difficulty-businessman-connect-question-mark-with-lightbulb-solution-6349215c4addee7f2c354b12.jpg?t=o&v=770"),
                              radius: 80,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(FontAwesomeIcons.circleExclamation,),
                            SizedBox(width: 20,),
                            Text(widget.soru.baslik,textAlign: TextAlign.left,style: TextStyle(color: Colors.green[900],fontWeight: FontWeight.w700),),
                          ],
                        ),
                        SizedBox(height: 75,),
                        Row(
                          children: [
                            Icon(FontAwesomeIcons.clipboardQuestion),
                            SizedBox(width: 20,),
                            Expanded(child: AutoSizeText(widget.soru.aciklama,style: TextStyle(color: Colors.green[900]),)),
                          ],
                        ),
                        SizedBox(height: 50 ,),
                        Container(
                          color: Colors.blueGrey,
                          width: 350,
                          height: 2,
                        ),
                        SizedBox(
                          height: 20,
                        ),
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
                              hintText: '\n \t Soruyu Yanıtla',
                              hintStyle: TextStyle(color: Colors.black),
                            ),
                            controller: answer,
                            minLines: 3,
                            maxLines: 50,
                          ),
                        ),
                        SizedBox(height: 50,),
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
                )),

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
  }
}


