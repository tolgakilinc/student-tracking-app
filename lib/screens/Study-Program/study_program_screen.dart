//flu import 'dart:html';
import 'package:developer_student/Models/UserBase.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import '../../constans.dart';
import 'components/Body.dart';
import 'components/pages/study_program_add.dart';

class StudyProgramScreen extends StatelessWidget {
  User user;

  StudyProgramScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       /* actions: <Widget>[
          IconButton(
            icon: Icon(
              FontAwesomeIcons.trashCan,
              color: Colors.white,
            ),
            onPressed: () {
              // do something
            },
          )
        ],*/
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {  Navigator.pop(context);},
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
        ),
        backgroundColor:kEerieBlackColor ,
        title:  Text(DateFormat("dd MMMM, yyyy").format(DateTime.now().toLocal()), style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      backgroundColor: kEerieBlackColor,
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            backgroundColor: kHimawariYellowColor,
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return StudyProgramAddScreen(user: user,);
                  },
                ),
              );
            },
          ),
          body: Body(user: user,),

    );

  }
}