import 'package:flutter/material.dart';

class buildDivider extends StatefulWidget {
  const buildDivider({Key key}) : super(key: key);

  @override
  State<buildDivider> createState() => _buildDividerState();
}

class _buildDividerState extends State<buildDivider> {
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(10),
          color: Color(0xFFDDE3F1),
          width: size.width,
          height: 1,
        )
      ],
    );
  }
}

_buildDivider(Size screenSize) {

}