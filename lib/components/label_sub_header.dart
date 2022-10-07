import 'package:flutter/material.dart';

class LabelSubHeader extends StatelessWidget {
  final String nameHeader;
  const LabelSubHeader({Key key, this.nameHeader}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.04,
      margin: EdgeInsets.only(bottom: 10),
      child: Text(
        nameHeader,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
