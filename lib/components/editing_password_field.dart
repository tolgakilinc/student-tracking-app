import 'package:flutter/material.dart';

import '../constans.dart';

class EditingPasswordField extends StatelessWidget {
  final String labelText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  final Color color, textColor;
  final TextEditingController controller;
  const EditingPasswordField({Key key, this.labelText, this.icon, this.onChanged, this.color, this.textColor, this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: size.width * 0.9,
      height: size.height * 0.08,
      child: Column(
        children: [
          TextField(
            controller: controller,
            obscureText: true,
            decoration: InputDecoration(

                labelText: labelText,
                labelStyle: TextStyle(color: Colors.black),
                suffixIcon: Icon(
                  Icons.visibility,
                  color: kLicoriceColor,
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: kAcikMaviColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: kAcikMaviColor),
                  borderRadius: BorderRadius.circular(10),
                )),
          ),

        ],
      ),
    );
  }
}
