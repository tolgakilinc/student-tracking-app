import 'package:developer_student/Models/UpdateUser.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Services/UserService.dart';
import 'package:developer_student/components/ToastHelper.dart';
import 'package:developer_student/components/editing_input_field.dart';
import 'package:developer_student/components/editing_password_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constans.dart';


class PasswordEditing extends StatefulWidget {
  PasswordEditing({Key key,this.user}) : super(key: key);
  User user;

  @override
  _PasswordEditingState createState() => _PasswordEditingState();
}

class _PasswordEditingState extends State<PasswordEditing> {
  @override
  TextEditingController oldPassword = TextEditingController(text: "");
  TextEditingController password = TextEditingController(text: "");
  TextEditingController passwordAgain = TextEditingController(text: "");
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kEerieBlackColor,
        title: Text("Şifre"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  if(password.text.isNotEmpty&&passwordAgain.text.isNotEmpty&&passwordAgain.text==password.text&&oldPassword.text.isNotEmpty&&password.text.length>=8){
                    setState(() {
                      UpdateUser(UpdateUserDto(
                          kullaniciId: widget.user.kullaniciId,
                          ad: widget.user.ad,
                          soyad:widget.user.soyad ,
                          eposta: widget.user.eposta,
                          telefonNo: widget.user.telefonNo,
                          yas: widget.user.yas,
                          sehirId: widget.user.sehir.sehirId,
                          alanId: widget.user.alan.alanId,
                          sifre: password.text,
                          veliId: widget.user.veli.veliId,
                          bolumId: widget.user.bolum.bolumId,
                          liseId: widget.user.lise.liseId,
                          sinifId: widget.user.sinif.sinifId,
                          universiteId: widget.user.universite.universiteId,
                          unvanId: widget.user.unvan.unvanId
                      ));
                    });
                    ToastHelper().makeToastMessage("Şifreniz başarıyla değiştirilmiştir");
                  }
                  else{
                    ToastHelper().makeToastMessage("Lütfen şifrenizi doğru yazdığınıza emin olunuz");
                  }
                },
                child: Icon(FontAwesomeIcons.check,
                  size: 18.0,
                  color:  kHimawariYellowColor,
                ),
              )
          ),
        ],
      ),
      body: SafeArea(
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 25,horizontal: 25),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text("Şifreniz en az 8 karakter olmadılır.",style: TextStyle(fontSize: 15),),
                EditingPasswordField(
                  controller: oldPassword,
                  labelText: "Mevcut Şifre",
                  onChanged: (value){},
                ),
                EditingPasswordField(
                  controller: password,
                  labelText: "Yeni Şifre",
                  onChanged: (value){},
                ),
                EditingPasswordField(
                  controller: passwordAgain,
                  labelText: "Yeni Şifre Tekrar",
                  onChanged: (value){},
                ),
              ],
            ),
          )

      ),
    );
  }
}
