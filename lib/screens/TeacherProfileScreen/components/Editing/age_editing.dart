import 'package:developer_student/Models/UpdateUser.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Services/UserService.dart';
import 'package:developer_student/components/ToastHelper.dart';
import 'package:developer_student/components/editing_input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constans.dart';


class AgeEditing extends StatefulWidget {
  AgeEditing({Key key,this.user}) : super(key: key);
  User user;

  @override
  _AgeEditingState createState() => _AgeEditingState();
}

class _AgeEditingState extends State<AgeEditing> {
  @override
  TextEditingController age = TextEditingController(text: "");

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kEerieBlackColor,
        title: Text("Yaş"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  if(age.text.isNotEmpty){
                    setState(() {
                      UpdateUser(UpdateUserDto(
                          kullaniciId: widget.user.kullaniciId,
                          ad: widget.user.ad,
                          soyad: widget.user.soyad,
                          eposta: widget.user.eposta,
                          telefonNo: widget.user.telefonNo,
                          yas: int.parse(age.text),
                          sehirId: widget.user.sehir.sehirId,
                          alanId: widget.user.alan.alanId,
                          sifre: widget.user.sifre,
                          veliId: widget.user.veli.veliId,
                          bolumId: widget.user.bolum.bolumId,
                          liseId: widget.user.lise.liseId,
                          sinifId: widget.user.sinif.sinifId,
                          universiteId: widget.user.universite.universiteId,
                          unvanId: widget.user.unvan.unvanId
                      ));
                    });
                    ToastHelper().makeToastMessage("Yaşınız güncellendi");
                  }
                  else{
                    ToastHelper().makeToastMessage("Lütfen gerekli alanları doldurunuz");
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

                Text("Lütfen yaşınızı giriniz",style: TextStyle(fontSize: 15),),
                EditingInputField(
                  controller: age,
                  labelText: "Yaş",
                  onChanged: (value){},
                ),
              ],
            ),
          )

      ),
    );
  }
}
