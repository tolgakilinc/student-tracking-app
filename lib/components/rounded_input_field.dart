import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constans.dart';

class RoundedInputField extends StatelessWidget {
  final String hintext;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Color color, textColor;
  final TextEditingController controller;
  final TextInputType keyboardType;
  const RoundedInputField({Key key, this.controller, this.hintext, this.icon, this.onChanged, this.color, this.textColor, this.keyboardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container( //TextFieldContainer()
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: size.width * 0.8,
      child: TextField(
        keyboardType: keyboardType,
        controller: controller,
        onChanged: onChanged,
        cursorColor: kChinaIvoryColor,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.account_circle,
            color:kLicoriceColor ,
          ),
          hintText: hintext,
          contentPadding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(29),
            borderSide: BorderSide(color:kAzaleaColor , width: 2),
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
