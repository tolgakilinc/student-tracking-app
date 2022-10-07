import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  final Alignment alignment;

  const RoundedButton(
      {Key key, this.text, this.press, this.color, this.textColor, this.alignment, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: size.width * 0.8,
      child: ClipRRect(
        //Yuvarlatılmış bir dikdörtgen kullanarak alt öğesini kırpan bir widget.
        borderRadius: BorderRadius.circular(29.0),
        child: newElevatedButton(),
      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(color: textColor),
      ),
      onPressed: press,
      style: ElevatedButton.styleFrom(
          primary: color,
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          textStyle: TextStyle(
            color: textColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          )),
    );
  }
}
