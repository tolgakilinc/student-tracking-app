
import 'package:flutter/material.dart';

import '../../constans.dart';
import 'Components/Body.dart';


class ParentControlScreen extends StatelessWidget {
  const ParentControlScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     /* appBar: AppBar(
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

        backgroundColor: kEerieBlackColor,
      ),*/

      backgroundColor: kEerieBlackColor,
      /*body: UsageStatistics(),*/
      body: Body(),
    );
  }
}

