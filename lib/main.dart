import 'package:developer_student/screens/welcome/welcome_screen.dart';
import 'package:flutter/material.dart';
//import 'package:intl/date_symbol_data_local.dart';

import 'constans.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {

  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter",
      theme: ThemeData(
      //  primaryColor: kAzaleaColor,
      //  backgroundColor: kLicoriceColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: WelcomeScreen(),
    );
  }
}
