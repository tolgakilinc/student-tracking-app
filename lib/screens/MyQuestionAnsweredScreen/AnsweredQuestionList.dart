import 'package:developer_student/Models/ClassBase.dart';
import 'package:developer_student/Models/SoruNudeBase.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Providers/LoginProvider.dart';
import 'package:developer_student/Services/SoruService.dart';
import 'package:developer_student/screens/MyQuestionAnsweredScreen/QuestionDetailAnsweredScreen.dart';
import 'package:developer_student/screens/QuestionDetail/QuestionDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../constans.dart';

class AnsweredQuestionList extends StatelessWidget {
  User user;
  Lesson lesson;
  AnsweredQuestionList({Key key, this.user, this.lesson}) : super(key: key);

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
            "${lesson.dersAdi}",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: kEerieBlackColor,
        ),
        body: FutureBuilder(
          future: GetYanitlananSoru(Provider.of<LoginProvider>(context, listen:false).getUser().kullaniciId, lesson.dersId),
          builder: (context, snapshot){
            if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);

            List<SoruNude> data = snapshot.data.data;

            return ListView.separated(
              separatorBuilder: (context, index) => Divider(thickness: 1,),
              itemCount: data.length,
              itemBuilder: (context, index){
                SoruNude item = data[index];
                return ListTile(
                  leading: Icon(FontAwesomeIcons.question,color: Color(0xff123456)),
                  title: Text(item.baslik),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return QuestionDetailAnsweredScreen(soru: item);
                        },
                      ),
                    );
                  },
                );
              },
            );
          },
        )
    );
  }
}
