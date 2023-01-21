import 'package:flutter/material.dart';

import '../constans.dart';

class RoundedPasswordField extends StatefulWidget {
  final ValueChanged<String> onChanced;
  final Color color;
  final String hintext;
  final TextEditingController controller;

  RoundedPasswordField(
      {Key key, this.controller, this.onChanced, this.color, this.hintext})
      : super(key: key);

  @override
  _RoundedPasswordFieldState createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: size.width * 0.8,
      //TextFieldContainer
      child: TextField(
        controller: widget.controller,
        obscureText: isHiddenPassword,
        onChanged: widget.onChanced,
        cursorColor: kHimawariYellowColor,
        decoration: InputDecoration(
            fillColor: kNearMoonColor,
            hintText: widget.hintext,
            prefixIcon: Icon(
              Icons.lock,
              color: kLicoriceColor,
            ),
            suffixIcon: IconButton(
              icon: isHiddenPassword == true ? Icon(
                Icons.visibility_off, color: Color(0xff123456),) : Icon(
                Icons.visibility, color: Color(0xff123456),), onPressed: () {
                setState(() {
                  isHiddenPassword = !isHiddenPassword;
                });
            },
            ), /*InkWell(
            onTap: _togglePasswordView,
            child: Icon(
              Icons.visibility,
              color: kLicoriceColor,
            ),
          ),*/

            contentPadding: const EdgeInsets.symmetric(horizontal: 10.0,
            vertical: 20.0),
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
    ),);

  }

  void _togglePasswordView() {
    /*if(isHiddenPassword == true ){
      isHiddenPassword = false;
    }
    else{
      isHiddenPassword = true;
    }*/
    setState(() {
      isHiddenPassword = !isHiddenPassword;
    });
  }

  Widget GetIcon() {
    if (isHiddenPassword == true) {
      Icon(
        Icons.visibility,
        color: kLicoriceColor,
      );
    }
    else
      Icon(
        Icons.visibility_off,
        color: kLicoriceColor,
      );
  }
}


