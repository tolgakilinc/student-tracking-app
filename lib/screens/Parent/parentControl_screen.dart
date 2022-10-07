
import 'package:flutter/material.dart';

import '../../constans.dart';
import 'Components/Body.dart';


class ParentControlScreen extends StatelessWidget {
  const ParentControlScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: kEerieBlackColor,
      body: Body(),
    );
  }
}

