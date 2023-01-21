import 'package:developer_student/Models/DenemeBase.dart';
import 'package:developer_student/Models/SoruNudeBase.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/components/MyCustomClipper.dart';
import 'package:developer_student/components/buildDivider.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import '../../constans.dart';

class QuestionDetailScreen extends StatelessWidget {
  SoruNude soru;
  User user;
  QuestionDetailScreen({Key key, this.soru,this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xFF123456),
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
              soru.baslik,
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: kEerieBlackColor,
          ),
          body: SafeArea(
              child: SingleChildScrollView(
            child: Container(
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /* ClipPath(
                      clipper: MyCustomClipper(),
                      child: Container(
                        padding: EdgeInsets.only(top: 5, left: 15),
                        color: kChinaIvoryColor,
                        width: double.infinity,
                        height: 75,
                      ),
                    ),*/


                  SizedBox(
                    height: size.height * 0.07,
                    child: Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Soru :",
                          textAlign: TextAlign.right,
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        Container(
                          color: Colors.deepOrange,
                          width: 50,
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: size.height * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        // topRight: Radius.circular(80),
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                        //   bottomLeft: Radius.circular(150)
                      ),
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border:
                                Border.all(width: 0.3, color: Colors.black)),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                               /*Center(
                                  child: Text(
                                    soru.baslik,
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.deepOrange),
                                  ),
                                ),*/
                              // buildDivider(),
                                 SizedBox(
                                  height: size.height * 0.03,
                                ),
                               /* Text(
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
                                ),*/
                                SizedBox(height: 15,),
                              Container(
                                decoration: BoxDecoration(
                                    color: Color(0xffFF6969),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
                                height: 350,
                                margin: EdgeInsets.all(40),
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),

                                // alignment: Alignment.center,
                                width: size.width * 0.8,

                                child: FlipCard(
                                  flipOnTouch: true,
                                  direction: FlipDirection.VERTICAL, // default
                                  front: Container(
                                    child: Text("\t\t${soru.aciklama}",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),),
                                  ),
                                  back: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(Icons.account_circle_rounded,color: Colors.white,),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(child:  Text("${user.ad} ${user.soyad}",style: TextStyle(color:Colors.white),))
                                          ],


                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.location_city,color: Colors.white,),
                                            SizedBox(width: 20,),
                                            Expanded(child:  Text("${user.sehir.sehirAdi}",style: TextStyle(fontFamily:'Roboto',color:Colors.white ),),)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.school,color: Colors.white,),
                                            SizedBox(width: 20,),
                                            Expanded(child:  Text("${user.lise.liseAdi}",style: TextStyle(fontFamily:'Roboto',color:Colors.white),),)
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.play_lesson,color: Colors.white,),
                                            SizedBox(width: 20,),
                                            Expanded(child:  Text("${user.alan.alanAdi}",style: TextStyle(fontFamily:'Roboto',color:Colors.white),),)
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ),
                             /* Stack(
                                clipBehavior: Clip.none,
                                overflow: Overflow.visible,
                                children: <Widget>[

                                ],
                              )*/
                              /* Text(
                                  "\t\t${soru.aciklama}",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w300,
                                      color: Colors.black),
                                ),*/
                            ],
                          ),
                        ),
                        width: size.width,
                        height: 250.0,
                      ),
                    ),
                  ),

                  //
                  SizedBox(
                    height: 10,
                  ),

                  ClipOval(
                    child: Container(
                      color: Color(0xff123456),
                      // width: 200.0,
                      // height: 200.0,
                      child: Center(
                        child: AnimatedTextKit(
                          animatedTexts: [
                            WavyAnimatedText('Sorunuz hocalara iletilmiştir.',
                                textStyle: TextStyle(color: Colors.white)),
                            WavyAnimatedText('En kısa sürede yanıtlanacaktır.',
                                textStyle: TextStyle(color: Colors.white)),
                          ],
                          //  displayFullTextOnTap: true,
                          pause: const Duration(milliseconds: 4000),
                          // stopPauseOnTap: true,
                          isRepeatingAnimation: true,
                          onTap: () {
                            print("Tap Event");
                          },
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ))),
    );
  }
}
