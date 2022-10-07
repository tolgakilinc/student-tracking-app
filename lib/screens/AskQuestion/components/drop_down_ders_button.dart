import 'package:developer_student/Models/ClassBase.dart';
import 'package:developer_student/Services/LessonService.dart';
import 'package:flutter/material.dart';

import '../../../constans.dart';

class DropDownDers extends StatefulWidget {
  const DropDownDers({Key key}) : super(key: key);

  @override
  State<DropDownDers> createState() => _DropDownDersState();
}

class _DropDownDersState extends State<DropDownDers> {

  var selectedLessons = "1";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: GetAllLessons(),
      builder: (context, snapshot){
        if(!snapshot.hasData) return CircularProgressIndicator();

        List<Lesson> lessonList = snapshot.data.data;

        return Container(
          padding: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color:kChinaIvoryColor,
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          margin: EdgeInsets.symmetric(vertical: 12.0),
          height: 55,
          width: size.width * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:<Widget> [
              DropdownButton<String>(
                dropdownColor: kChinaIvoryColor,
                isExpanded: true,
                items: lessonList.map((Lesson value) {
                  return DropdownMenuItem<String>(
                    value: value.dersId.toString(),
                    child: Container(child: Text(value.dersAdi, textAlign: TextAlign.center,), width:double.infinity),
                  );
                }).toList(),
                value: selectedLessons,
                onChanged: (String  value) {
                  setState(() {
                    selectedLessons = value;
                  });
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
