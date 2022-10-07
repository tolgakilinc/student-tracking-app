import 'package:flutter/material.dart';

import '../../../constans.dart';

class QuestionInputField extends StatelessWidget {
  final String hintext;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Color color, textColor;
  final TextEditingController controller;

  const QuestionInputField(
      {Key key,
      this.hintext,
      this.icon,
      this.onChanged,
      this.color,
        this.controller,
      this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      //TextFieldContainer()
      decoration: BoxDecoration(
        color:kChinaIvoryColor,
        borderRadius: BorderRadius.all(Radius.circular(25)),
      ),
      margin: EdgeInsets.symmetric(vertical: 12.0),
      width: size.width * 0.8,
      child: TextField(
        controller: controller,
        style: TextStyle(color: Colors.black87),
        onChanged: onChanged,
        cursorColor: Colors.black,
        decoration: InputDecoration(
          fillColor: Colors.red,
          hintText: hintext,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: kChinaIvoryColor, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: kChinaIvoryColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 0.0,
            borderRadius: BorderRadius.circular(50),
            borderSide: BorderSide(color: kChinaIvoryColor, width: 1.5),
          ),

        ),
        minLines: 1,
        maxLines: 10,
      ),
    );
  }
}
