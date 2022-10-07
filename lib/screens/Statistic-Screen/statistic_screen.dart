import 'package:developer_student/screens/Home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../constans.dart';
import 'components/body.dart';
class StatisticScreen extends StatefulWidget {
  const StatisticScreen({Key key}) : super(key: key);

  @override
  State<StatisticScreen> createState() => _StatisticScreenState();
}

class _StatisticScreenState extends State<StatisticScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {  Navigator.pop(context);},
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
        ),
        backgroundColor:kEerieBlackColor ,
        title: Text("İstatistikler"),
      ),
      backgroundColor: kEerieBlackColor,
      body: Body(),
    );
  }
}
