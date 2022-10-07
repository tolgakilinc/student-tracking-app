import 'package:flutter/material.dart';

class FieldTitleText extends StatelessWidget {
  final String nameTitle;
  const FieldTitleText({Key key, this.nameTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        nameTitle,
        style: TextStyle(color: Colors.white, fontSize: 15  ,),
      ),
    );
  }
}
