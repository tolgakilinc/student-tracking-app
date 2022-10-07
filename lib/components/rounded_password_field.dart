import 'package:flutter/material.dart';

import '../constans.dart';
class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanced;
  final Color color;
  final String hintext;
  final TextEditingController controller;
  const RoundedPasswordField({Key key, this.controller, this.onChanced, this.color, this.hintext}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: size.width * 0.8,
      //TextFieldContainer
      child: TextField(
        controller: controller,
        obscureText: true,
        onChanged: onChanced,
        cursorColor: kHimawariYellowColor,
        decoration: InputDecoration(
          fillColor: kNearMoonColor,
          hintText: hintext,
          prefixIcon: Icon(
            Icons.lock,
            color:kLicoriceColor ,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kLicoriceColor,
          ),

          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: BorderSide(color: kAzaleaColor, width: 2),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: BorderSide(color: kAzaleaColor, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            gapPadding: 0.0,
            borderRadius: BorderRadius.circular(29),
            borderSide: BorderSide(color: kLicoriceColor, width: 1.5),
          ),
        ),
      ),
    );
  }
}
