import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/screens/MyQuestionExpectedScreen/ExpectedQuestionList.dart';
import 'package:developer_student/screens/MyQuestionExpectedScreen/myquestion_expected_screen.dart';
import 'package:developer_student/screens/MyQuestions/myQuestion_screen.dart';
import 'package:developer_student/screens/QuestionPool/question_pool_screen.dart';
import 'package:developer_student/screens/Teacher/TeacherAnsweredLessonScreen.dart';
import 'package:developer_student/screens/Teacher/TeacherExpectedLessonScreen.dart';
import 'package:developer_student/screens/TeacherProfileScreen/teacher_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'MenuButton.dart';

class SelectMenu extends StatelessWidget {

  User user;
  SelectMenu({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              Container(padding: EdgeInsets.only(left: 80)),
              Text(
                "Hoşgeldiniz",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 150,)
            ],
          ),
          Row(
            children: [
              MenuButton(
                height:size.height * 0.18 ,
                width: size.width * 0.35,
                nameLabel: 'Profil',
                iconLabel: FontAwesomeIcons.user,

                   press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TeacherProfileScreen(user: user,);
                        },
                      ),
                    );
                  },
              ),
              MenuButton(
                height:size.height * 0.18 ,
                width: size.width * 0.35,
                nameLabel: 'Bekleyen Sorular',
                iconLabel: FontAwesomeIcons.circleQuestion,

                press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TeacherExpectedLessonScreen(user: user,);
                        },
                      ),
                    );
                  },
              ),
            ],
          ),
          SizedBox(height: 25,),
          Row(
            children: [
              MenuButton(
                height:size.height * 0.18 ,
                width: size.width * 0.35,
                nameLabel: 'Cevaplanan Sorular',
                iconLabel: FontAwesomeIcons.checkDouble,
                  press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TeacherAnsweredLessonScreen(user: user,);
                        },
                      ),
                    );
                  },
              ),
              MenuButton(
                height:size.height * 0.18 ,
                width: size.width * 0.35,
                nameLabel: 'Soru Havuzu',
                iconLabel: FontAwesomeIcons.hockeyPuck,

                 press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return QuestionPoolScreen();
                        },
                      ),
                    );
                  },
              ),
            ],
          ),
          SizedBox(height: 25,),
          Row(
            children: [
              MenuButton(
                height:size.height * 0.18 ,
                width: size.width * 0.35,
                nameLabel: 'Ayarlar',
                iconLabel: FontAwesomeIcons.gear,

                /* press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyQuestionScreen();
                        },
                      ),
                    );
                  },*/
              ),
              MenuButton(
                height:size.height * 0.18 ,
                width: size.width * 0.35,
                nameLabel: 'Mesajlar',
                iconLabel: FontAwesomeIcons.comments,

                /* press: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return MyQuestionScreen();
                        },
                      ),
                    );
                  },*/
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
