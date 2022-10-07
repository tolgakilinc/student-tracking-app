import 'package:developer_student/components/rounded_button.dart';
import 'package:developer_student/screens/Login/login_screen.dart';
import 'package:developer_student/screens/Signup/signup_screen.dart';
import 'package:flutter/material.dart';

import '../../../constans.dart';
//import 'package:flutter_svg/svg.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return /*Background*/Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Welcome",
              style: TextStyle(fontWeight: FontWeight.bold ,height: size.height * 0.015 ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child:  Image(image: AssetImage("assets/images/analyze.jpg",), height: size.height * 0.50, ),
            ),
            /*SvgPicture.asset(
              "assets/images/education.jpg",
              height: size.height * 0.45,
            ),*/
            RoundedButton(
              text: "Login",
              color: kLicoriceColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
              alignment: Alignment.center,
            ),
            RoundedButton(
              text: "Sign Up",
              color: kAzaleaColor,
              textColor: Colors.black87,
              press: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SignUpScreen();
                },
                ),);
              },
            )
          ],
        ),
      ),
    );
  }
}
