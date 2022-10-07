import 'package:developer_student/Models/SoruNudeBase.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/components/MyCustomClipper.dart';
import 'package:developer_student/components/buildDivider.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../constans.dart';

class QuestionDetailScreen extends StatelessWidget {
  SoruNude soru;

  QuestionDetailScreen({Key key, this.soru}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor:kEerieBlackColor ,
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
        body:
        SafeArea(
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
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        // topRight: Radius.circular(80),
                          topLeft: Radius.circular(120.0),
                        bottomRight: Radius.circular(120.0),
                        //   bottomLeft: Radius.circular(150)
                      ),
                      child: Container(
                        padding: EdgeInsets.all(12),
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
                      height: 100,
                    ),


                    //
                    //    SizedBox(height: 500,),

                     ClipOval(
              child: Container(
                color: Color(0xff123456),
                width: 200.0,
                height: 200.0,
                child: Center(
                    child: AnimatedTextKit(

                      animatedTexts: [
                        WavyAnimatedText('Sorunuz hocalara iletilmiştir.',textStyle: TextStyle(color: Colors.white)),
                        WavyAnimatedText('En kısa sürede yanıtlanacaktır.',textStyle: TextStyle(color: Colors.white)),
                      ],
                    //  displayFullTextOnTap: true,
                      pause: const Duration(milliseconds: 4000),
                     // stopPauseOnTap: true,
                      isRepeatingAnimation: true,
                      onTap: () {
                        print("Tap Event");
                      },
                    ),),
              ),
            ),
                  ],
                ),
              ),
            ))

      ),
    );
  }
}
