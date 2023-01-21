import 'package:auto_size_text/auto_size_text.dart';
import 'package:developer_student/Models/SoruNudeBase.dart';
import 'package:developer_student/Models/SoruYanitBase.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Providers/LoginProvider.dart';
import 'package:developer_student/Services/SoruYanitService.dart';
import 'package:developer_student/components/MyCustomClipper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
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
        //backgroundColor: kEerieBlackColor,
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
            "Yanıtlanan soru : ${soru.soruId}",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: kEerieBlackColor,
        ),
        body: FutureBuilder(
          future: GetSoruYanit(soru.soruId),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return CircularProgressIndicator();

            SoruYanit soruYanit = snapshot.data.data.first;

            return Center(
              
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomRight: Radius.circular(25)),

                        ),
                        //width: 120,
                        height: 50,
                        margin: EdgeInsets.only(right: 40,top: 20),
                        padding: EdgeInsets.only(left: 15),
                       child:Row(
                           children: [
                             Icon(FontAwesomeIcons.user),
                             SizedBox(width: 10,),
                             Text("${Provider.of<LoginProvider>(context, listen:false).getUser().ad + Provider.of<LoginProvider>(context, listen:false).getUser().soyad}")
                           ]),
                      ),
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
                                      Text(soru.baslik,textAlign: TextAlign.left,style: TextStyle(color: Colors.green[900],fontWeight: FontWeight.w700),),
                                    ],
                                  ),
                                  SizedBox(height: 75,),
                                  Row(
                                    children: [
                                      Icon(FontAwesomeIcons.clipboardQuestion),
                                      SizedBox(width: 20,),
                                      Expanded(child: AutoSizeText(soru.aciklama,style: TextStyle(color: Colors.green[900]),)),
                                    ],
                                  ),
                                  SizedBox(height: 36 ,),
                                  Container(
                                    color: Colors.blueGrey,
                                    width: 350,
                                    height: 2,
                                  ),
                                  SizedBox(height: 36,),
                                  Row(
                                    children: [
                                      Icon(FontAwesomeIcons.solidMessage),
                                      SizedBox(width: 20,),
                                      Expanded(
                                        child: Text(soruYanit.yanit,style: TextStyle(color: Colors.green[900],fontWeight: FontWeight.w500),
                                          overflow: TextOverflow.fade,
                                          softWrap: true,),
                                      )

                                    ],
                                  ),

                                ],
                              ),
                            ),
                          )),
                    ],

                  ),
                ));
          },
        ),
      ),
    );
  }
}
