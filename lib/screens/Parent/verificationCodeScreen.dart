import 'dart:async';

import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:countdown_progress_indicator/countdown_progress_indicator.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Providers/LoginProvider.dart';
import 'package:developer_student/components/ToastHelper.dart';
import 'package:developer_student/components/buildDivider.dart';
import 'package:developer_student/screens/Parent/parentControl_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:provider/provider.dart';
import '../../constans.dart';

class verificationCodeScreen extends StatefulWidget {
  User user;
   verificationCodeScreen({Key key,this.user}) : super(key: key);

  @override
  _verificationCodeScreenState createState() => _verificationCodeScreenState();
}

class _verificationCodeScreenState extends State<verificationCodeScreen> {
  @override
  Widget build(BuildContext context) {
    bool _onEditing = true;
    int _code;
    Size size = MediaQuery.of(context).size;
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
        backgroundColor: kEerieBlackColor,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(

                alignment: Alignment.topLeft,
                margin:  EdgeInsets.only(left: 15,top: 15),

                child: Text("Doğrulama Kodu",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,height: 2)),
              ),
              Container(
                padding: EdgeInsets.all(18),
                child:Column(
                  children:<Widget>[
                    Text ("${DateFormat("dd.MM.yyyy  hh:mm").format(DateTime.now().toLocal())} itibarıyla ${(Provider.of<LoginProvider>(context, listen:false).getUser().telefonNo)}  numaralı telefonuna doğrulama kodu gönderilmiştir.",
                        style:  TextStyle(fontSize: 15,),),

                    Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(onPressed: (){},child: Text("Numarayı Değiştir?",textAlign: TextAlign.right,style: TextStyle(color: Color(0xFFFF5A5A))),))
                  ],
                ),

              ),
              VerificationCode(
                textStyle: TextStyle(fontSize: 20.0, color: Colors.black),
                underlineColor: Color(0xFFFF5A5A),
                keyboardType: TextInputType.number,
                length: 4,
                clearAll: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Temizle',
                    style: TextStyle(
                        fontSize: 14.0,
                        decoration: TextDecoration.none,
                        color: Color(0xFFFF5A5A)),
                  ),
                ),
                onCompleted: (String value){
                 setState(() {
                   _code = int.parse(value);
                 });
                },
                onEditing: (bool value){
                  setState(() {
                    _onEditing = value;
                  });
                  if (!_onEditing) FocusScope.of(context).unfocus();
                },

              ),

              CircularCountDownTimer(
                duration: 120,
                initialDuration: 0,
                // controller: CountDownController,
                width: MediaQuery.of(context).size.width / 3,
                height: MediaQuery.of(context).size.height / 3,
                ringColor: Colors.grey[300],
                ringGradient: null,
                fillColor: Color(0xFFFF7979),
                fillGradient: null,
                backgroundColor: Color(0xFFFF7979),
                backgroundGradient: null,
                strokeWidth: 8.0,
                strokeCap: StrokeCap.round,
                textStyle: TextStyle(
                    fontSize: 33.0, color: Colors.white, fontWeight: FontWeight.bold),
                textFormat: CountdownTextFormat.S,
                isReverse: true,
                isReverseAnimation: false,
                isTimerTextShown: true,
                autoStart: true,
                onStart: () {
                  print('Sayaç başladı');
                },
                onComplete: () {

                  print('Sayaç bitti');
                },
              ),
              Row(

                children: [
                  Container(
                    padding: EdgeInsets.all(20),
                    width: size.width,
                    child: Row(
                      children: [
                        Expanded(

                          flex: 2,
                          child: RaisedButton(
                            highlightColor: Colors.black12,
                            color: Color(0xffD9D9D9),
                            onPressed: (){
                              ToastHelper().makeToastMessage(
                                  "Kod Tekrar Gönderilmiştir!!");
                            }, child: Text("Yeniden Gönder", style:TextStyle()),
                          ), ),
                        SizedBox(
                          width: 50,
                        ),
                        Expanded(
                          flex:2,
                          child: RaisedButton(

                            color: Color(0xffFF7979),
                            highlightColor: Colors.red,
                            onPressed: (){
                              int a;
                              a = _code;
                              if (a == null){
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return ParentControlScreen();
                                    },
                                  ),
                                );
                              }
                              else{
                               ToastHelper().makeToastMessage(
                                   "Yanlış Kod Tekrar Giriniz!!");

                              };


                             }, child: Text("Doğrula", style:TextStyle(color: Colors.white)),
                          ), ),
                      ],
                    ),
                  )
                ],
              )



            ],
          ),
        ),
      ),

    );
  }
}

