import 'package:developer_student/screens/Net-Calculation/components/body.dart';
import 'package:flutter/material.dart';

import '../../constans.dart';

class NetCalculationScreen extends StatelessWidget {
  const NetCalculationScreen({Key key}) : super(key: key);

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
        title: Text("Net Hesapla"),
        backgroundColor: kEerieBlackColor,
      ),
      backgroundColor: kEerieBlackColor,
      body: Body(),
    );
  }
}
