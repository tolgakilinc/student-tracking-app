import 'package:carousel_slider/carousel_slider.dart';
import 'package:developer_student/Models/ProgramBase.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Providers/LoginProvider.dart';
import 'package:developer_student/Services/ProgramService.dart';
import 'package:developer_student/components/icon_button.dart';
import 'package:developer_student/components/icon_button_ip.dart';
import 'package:developer_student/components/label_sub_header.dart';
import 'package:developer_student/screens/AskQuestion/ask_question_screen.dart';
import 'package:developer_student/screens/MyQuestions/myQuestion_screen.dart';
import 'package:developer_student/screens/Parent/parentControl_screen.dart';
import 'package:developer_student/screens/Net-Calculation/net_calculation_screen.dart';
import 'package:developer_student/screens/Parent/verificationCodeScreen.dart';
import 'package:developer_student/screens/SortScreen/SortScreen.dart';
import 'package:developer_student/screens/Statistic-Screen/statistic_screen.dart';
import 'package:developer_student/screens/StudentProfileScreen/student_profile_screen.dart';
import 'package:developer_student/screens/Study-Program/study_program_screen.dart';
import 'package:developer_student/screens/Teacher/teacher_screen.dart';
import 'package:developer_student/screens/TestScreen/test_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../../../constans.dart';
import 'package:provider/provider.dart';


class Body extends StatefulWidget {
  User user;

  Body({Key key, this.user}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: kLicoriceColor, //Theme.of(context).primaryColor,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Hoşgeldiniz",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: kHimawariYellowColor),
                      ),
                      Text(
                        'Hedefe adım adım...',
                        style: TextStyle(
                          fontSize: 14,
                          height: 1.8,
                          color: kHimawariYellowColor,
                        ),
                      ),
                      Text(
                        'Kalan Gün  : 156',
                        style: TextStyle(
                            fontSize: 18,
                            height: 1.8,
                            fontWeight: FontWeight.bold,
                            color: kHimawariYellowColor),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      Container(
                         padding: EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 8,
                          ),
                          height: size.height * 0.04,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return StudentProfileScreen(user: widget.user,);
                                },
                              ),
                            );
                          },

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Profil",
                                style: TextStyle(
                                    color: kLicoriceColor,
                                    fontSize: 15,
                                    height: size.height * 0.0015,
                                    fontWeight: FontWeight.bold),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: kLicoriceColor,
                                size: 18,
                              )
                              //)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButtonIP(
                        nameLabel: 'Bildirimler',
                        iconLabel: FontAwesomeIcons.bell,
                        notification: true,
                      ),
                      IconButtonIP(
                        nameLabel: 'Scan QR',
                        iconLabel: Icons.qr_code_scanner_sharp,
                        notification: false,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButtons(
                        nameLabel: 'Programım',
                        iconLabel: FontAwesomeIcons.calendar,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return StudyProgramScreen(user: widget.user,);
                              },
                            ),
                          );
                        },
                      ),
                      IconButtons(
                        nameLabel: 'Soru Sor',
                        iconLabel: FontAwesomeIcons.circleQuestion,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return AskQuestionScreen(user: widget.user,);
                              },
                            ),
                          );
                        },
                      ),
                      IconButtons(
                        nameLabel: 'Sorularım',
                        iconLabel: FontAwesomeIcons.subscript,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MyQuestionScreen(user: widget.user,);
                              },
                            ),
                          );
                        },
                      ),
                      IconButtons(
                        nameLabel: 'Net Hesapla',
                        iconLabel: FontAwesomeIcons.calculator,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return NetCalculationScreen();
                              },
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButtons(
                        nameLabel: 'Denemeler',
                        iconLabel: FontAwesomeIcons.five,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return TestScreen(user: widget.user,);
                              },
                            ),
                          );
                        },
                      ),
                      IconButtons(
                        nameLabel: 'İstatistik',
                        iconLabel: FontAwesomeIcons.chartSimple,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return StatisticScreen();
                              },
                            ),
                          );
                        },
                      ),
                      IconButtons(
                        nameLabel: 'Sıralamam',
                        iconLabel: Icons.calendar_today,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return SortScreen(user: widget.user,);
                              },
                            ),
                          );
                        },
                      ),
                      IconButtons(
                        nameLabel: 'Veli Kontrol',
                        iconLabel: Icons.calendar_today,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return verificationCodeScreen(user: widget.user,);
                              },
                            ),
                          );
                        },
                      ),
                    /*  IconButtons(
                        nameLabel: 'Veli Kontrol',
                        iconLabel: Icons.calendar_today,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ParentControlScreen();
                              },
                            ),
                          );
                        },
                      ),*/

                    ],
                  ),
                ],
              ),
            ),
            LabelSubHeader(
              nameHeader: "Çalışma Programı",
            ),
            SizedBox(
              /*decoration: BoxDecoration(
                      color: kAzaleaColor, //Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),*/

              /*
              ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: <Widget>[
                    CarouselSlider(
                      //Bir atlıkarınca kaydırıcı widget'ı.
                      items: [
                        ProgramItem(
                          courseTime: 'as',
                          lessonName: 'sa',
                          subjectName: "Türev",
                          teacher: "Ali Hoca",
                        ),
                        ProgramItem(
                          courseTime: "16:00",
                          lessonName: "Fizik",
                          subjectName: "Hareket",
                          teacher: "Ergül Hoca",
                        ),
                      ],
                      options: CarouselOptions(
                        height: size.height * 0.20,
                        //height: 105.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.80,
                      ),
                    )
                  ],
                )
              * */

              child: FutureBuilder(
                future: GetProgram(Provider.of<LoginProvider>(context, listen:false).getUser().kullaniciId, "2023-01-07"),
                builder: (context, AsyncSnapshot<ProgramBase> snapshot){
                  if(!snapshot.hasData) return CircularProgressIndicator();
                  List<Program> programList = snapshot.data.data;

                  return CarouselSlider.builder(
                      options: CarouselOptions(
                        height: size.height * 0.20,
                        //height: 105.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: Duration(milliseconds: 800),
                        viewportFraction: 0.80,
                      ),
                    itemCount: programList.length,
                    itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
                        ProgramItem(
                         courseTime: programList[itemIndex].baslangicTarih.hour.toString(),
                          lessonName: programList[itemIndex].icerik,
                          subjectName: programList[itemIndex].programAdi,
                          teacher: programList[itemIndex].kullanici.ad + " " + programList[itemIndex].kullanici.soyad,
                        )
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProgramItem extends StatelessWidget {
  final String courseTime;
  final String lessonName;
  final String subjectName;
  final String teacher;

  const ProgramItem(
      {Key key,
      this.courseTime,
      this.lessonName,
      this.subjectName,
      this.teacher})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 10.0,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xffe2e2e2)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              border: Border.all(width: 2),
              borderRadius: BorderRadius.circular(80),
            ),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  lessonName,
                  style: TextStyle(
                    color: kLicoriceColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courseTime,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      lessonName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kHimawariYellowColor,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(Icons.adjust_rounded),
                        Text(
                          subjectName,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      teacher,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    )
                  ],
                ),
              ))
        ],
      ),
    );

  }

}

