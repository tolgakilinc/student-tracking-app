import 'package:developer_student/Models/UserBase.dart';
import 'package:flutter/material.dart';
import '../../constans.dart';
import 'components/select_menu.dart';

class TeacherScreen extends StatefulWidget {
  User user;
  TeacherScreen({Key key, this.user}) : super(key: key);

  @override
  State<TeacherScreen> createState() => _TeacherScreenState();
}

class _TeacherScreenState extends State<TeacherScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
        backgroundColor: kEerieBlackColor,
        title: Text(""),
      ),*/
      backgroundColor: kEerieBlackColor,
      body: SelectMenu(user: widget.user,),
    );
  }
}
