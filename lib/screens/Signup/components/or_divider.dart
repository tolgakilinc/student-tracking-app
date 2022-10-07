import 'package:flutter/material.dart';

import '../../../constans.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(
        children: <Widget>[
          buildDivider(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              "Or",
              style: TextStyle(
                  color: kLicoriceColor, fontWeight: FontWeight.w600),
            ),
          ),
          buildDivider()
        ],
      ),
    );
  }

  Expanded buildDivider() {
    return Expanded(
        child: Divider(
          color: kAzaleaColor, height: 1.5, //Color(0xFFFAD3DF),
        ));
  }
}
