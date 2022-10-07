import 'package:developer_student/Models/UserBase.dart';
import 'package:flutter/material.dart';

import 'components/body.dart';


class HomeScreen extends StatelessWidget {
  User user;
  HomeScreen({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Body(user: user,),

    );
  }
}