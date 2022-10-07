import 'package:carousel_slider/carousel_slider.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/screens/AskQuestion/ask_question_screen.dart';
import 'package:developer_student/screens/Home/home_screen.dart';
import 'package:developer_student/screens/MyQuestionAnsweredScreen/myquestion_answered_screen.dart';
import 'package:developer_student/screens/MyQuestionExpectedScreen/myquestion_expected_screen.dart';
import 'package:developer_student/screens/MyQuestions/components/models/category_model.dart';
import 'package:developer_student/screens/QuestionPool/question_pool_screen.dart';
import 'package:developer_student/screens/Teacher/components/MenuButton.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../constans.dart';
import 'components/models/lesson_widget.dart';

class MyQuestionScreen extends StatelessWidget {
  User user;
  MyQuestionScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        title: Text("Sorularım"),
        backgroundColor: kEerieBlackColor,
      ),
      floatingActionButton: FabCircularMenu(
          fabColor: kHimawariYellowColor,
          ringColor: kHimawariYellowColor,
          ringDiameter: 250,
          animationDuration: Duration(milliseconds: 250),
          children: <Widget>[
            IconButton(
                icon: Icon(FontAwesomeIcons.circleQuestion),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AskQuestionScreen();
                      },
                    ),
                  );
                }),
            IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeScreen();
                      },
                    ),
                  );
                }),
            IconButton(
                icon: Icon(FontAwesomeIcons.hockeyPuck),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return QuestionPoolScreen();
                      },
                    ),
                  );
                })
          ]),
      backgroundColor: kEerieBlackColor,
      body: QuestionScreen(user: user,),
    );
  }
}

class QuestionScreen extends StatefulWidget {
  User user;
  QuestionScreen({Key key, this.user}) : super(key: key);

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: SingleChildScrollView(
      child: Container(
          child: Column(
        children: [
          SizedBox(
            height: 25,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(29),
            child:  Image(image: AssetImage("assets/images/myQuestion.png",), height: size.height * 0.25, ),
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            children: [
              MenuButton(
                height: size.height * 0.35,
                width: 140.0,
                nameLabel: 'Cevaplanan Sorular',
                iconLabel: FontAwesomeIcons.checkDouble,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MyQuestionAnsweredScreen(user: widget.user,);
                      },
                    ),
                  );
                },
              ),
              MenuButton(
                height: size.height * 0.35,
                width: 140.0,
                nameLabel: 'Bekleyen Sorular',
                iconLabel: FontAwesomeIcons.circleQuestion,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return MyQuestionExpectedScreen(user: widget.user,);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
         /* Container(
              child: CarouselSlider(
            options: CarouselOptions(
              aspectRatio: 1.5,
              viewportFraction: 0.9,
              enlargeCenterPage: true,
              enlargeStrategy: CenterPageEnlargeStrategy.height,
              enableInfiniteScroll: false,
              initialPage: 2,
              autoPlay: true,
            ),
            items: Category.categories
                .map((category) => Lesson(
                      category: category,
                      onTap: () {
                        print(category.lessonName);
                      },
                    ))
                .toList(),
          )),*/
        ],
      )),
    ));
  }
}
