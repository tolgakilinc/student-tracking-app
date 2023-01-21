import 'package:developer_student/Models/ProgramBase.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Providers/LoginProvider.dart';
import 'package:developer_student/Services/UserService.dart';
import 'package:developer_student/components/already_have_An_account_acheck.dart';
import 'package:developer_student/components/rounded_button.dart';
import 'package:developer_student/components/rounded_input_field.dart';
import 'package:developer_student/components/rounded_password_field.dart';
import 'package:developer_student/screens/Home/home_screen.dart';
import 'package:developer_student/screens/Signup/signup_screen.dart';
import 'package:developer_student/screens/Teacher/teacher_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import '../../../constans.dart';


class Body extends StatelessWidget {
  Body({Key key}) : super(key: key);
  TextEditingController email = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");
  Program program;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Login",
              style: TextStyle(fontWeight: FontWeight.bold,height: size.height * 0.006,),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(29),
              child:  Image(image: AssetImage("assets/images/analyze.jpg",), height: size.height * 0.50, ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            RoundedInputField(
              controller: email,
              hintext: "Your Mail",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              controller: password,
              hintext: "Password",
              onChanced: (value) {},
            ),
            RoundedButton(
              text: "Login",
              press: () {
                Login(email.text, password.text).then((value){
                  if(value != null){
                    User user = value.data.first;

                    if(user.unvan.unvanId == 2){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            Provider.of<LoginProvider>(context, listen:false).setUser(user);
                            return HomeScreen(user: user );
                          },
                        ),
                      );
                    }else{
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return TeacherScreen(user: user,);
                          },
                        ),
                      );
                    }
                  }
                });
              },
              color: kLicoriceColor,

            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            AlreadyHaveAnAccountChech(
              login: true,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
