import 'package:developer_student/Models/ClassBase.dart';
import 'package:developer_student/Models/SoruHavuzCreateDto.dart';
import 'package:developer_student/Models/SoruNudeBase.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Services/SoruHavuzService.dart';
import 'package:developer_student/Services/SoruService.dart';
import 'package:developer_student/components/ToastHelper.dart';
import 'package:developer_student/screens/MyQuestionAnsweredScreen/QuestionDetailAnsweredScreen.dart';
import 'package:developer_student/screens/QuestionDetail/QuestionDetailScreen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constans.dart';

class TeacherAnsweredQuestionList extends StatelessWidget {
  User user;
  Lesson lesson;
  TeacherAnsweredQuestionList({Key key, this.user, this.lesson}) : super(key: key);

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
          future: GetYanitlananSoruOgretmen(user.kullaniciId, lesson.dersId),
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
                  trailing: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor: MaterialStateProperty.all<Color>(kLicoriceColor),
                    ),
                    child: Icon(FontAwesomeIcons.chevronRight,size: 22,),
                    onPressed: (){
                      showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text(
                              "Soru, soru havuzuna gönderilsin mi?",
                            ),
                            actions: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  ("Hayır"),
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: kLicoriceColor
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  CreateSoruHavuz(SoruHavuzCreateDto(
                                      soruId: item.soruId,
                                      dersKategoriId: lesson.dersKategori.dersKategoriId
                                  ));
                                  ToastHelper().makeToastMessage("Soru gönderildi");
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  ("Evet"),
                                  style: TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: kLicoriceColor
                                ),
                              )
                            ],
                          )
                      );
                      
                    },
                  ),
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return QuestionDetailAnsweredScreen(soru: item,);
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
