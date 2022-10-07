import 'package:flutter/material.dart';

import '../constans.dart';

class SimpleAlertBox extends StatelessWidget {
  const SimpleAlertBox({Key key, this.text, this.leftText, this.rightText})
      : super(key: key);
  final String text;
  final String leftText;
  final String rightText;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _simpleAlertBox(context),
    );
  }
}

_simpleAlertBox(BuildContext context) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
           "Hesaptan çıkış yap",
          ),
          actions: [
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  ("iptal"),
                  style: TextStyle(color: kLicoriceColor),
                )),
            ElevatedButton(
                onPressed: () {},
                child: Text(
                  ("Çıkış yap"),
                  style: TextStyle(color: kLicoriceColor),
                ))
          ],
        );
      });
}
