import 'package:flutter/material.dart';

import '../constans.dart';

class AlreadyHaveAnAccountChech extends StatelessWidget {
  final bool login;
  final VoidCallback press;

  const AlreadyHaveAnAccountChech({Key key, this.login, this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Don't' have an Account? " : "Already have an Account? ",
          style: TextStyle(color: kHimawariYellowColor),
        ),
        GestureDetector(
          //Hareketleri algılayan bir widget.
          onTap: press,
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: TextStyle(
                color: kHimawariYellowColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
