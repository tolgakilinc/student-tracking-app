import 'package:developer_student/Models/ClassBase.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Services/LessonService.dart';
import 'package:developer_student/screens/MyQuestionExpectedScreen/ExpectedQuestionList.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../constans.dart';

class MyQuestionExpectedScreen extends StatelessWidget {
  User user;
  MyQuestionExpectedScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        title: Text(
          "Beklenen Sorularım",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: kEerieBlackColor,
      ),
      body: FutureBuilder(
        future: GetAllLessons(),
        builder: (context, snapshot){
          if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);

          List<Lesson> data = snapshot.data.data;

          return ListView.separated(
            separatorBuilder: (context, index) => Divider(thickness: 1,),
            itemCount: data.length,
            itemBuilder: (context, index){
              Lesson item = data[index];
              return ListTile(
                leading: Icon(FontAwesomeIcons.book,color: Color(0xff123456)),
                title: Text(item.dersAdi),
                subtitle: Text(item.dersKategori.dersKategorisi),
                onTap: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ExpectedQuestionList(user: user, lesson: item,);
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
