import 'package:developer_student/Models/ClassBase.dart';
import 'package:developer_student/Models/SoruHavuzBase.dart';
import 'package:developer_student/Services/SoruHavuzService.dart';
import 'package:developer_student/screens/MyQuestionAnsweredScreen/QuestionDetailAnsweredScreen.dart';
import 'package:developer_student/screens/QuestionDetail/QuestionDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constans.dart';

class QuestionPoolListScreen extends StatelessWidget {
  Lesson lesson;
  QuestionPoolListScreen({Key key, this.lesson}) : super(key: key);

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
        title: Text(
          lesson.dersAdi,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kEerieBlackColor,
      ),
      body: FutureBuilder(
        future: GetAllSoruHavuzByDersId(lesson.dersId),
        builder: (context, snapshot){
          if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);

          List<SoruHavuz> data = snapshot.data.data;

          return ListView.separated(
            separatorBuilder: (context, index) => Divider(thickness: 1,),
            itemCount: data.length,
            itemBuilder: (context, index){
              SoruHavuz item = data[index];
              return ListTile(
                leading: Icon(FontAwesomeIcons.book,color: Color(0xff123456)),
                title: Text(item.soru.baslik),

                onTap: (){

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return QuestionDetailAnsweredScreen(soru: item.soruYanit.soru,);
                      },
                    ),
                  );

                },
              );
            },
          );
        },
      ),
    );
  }
}
