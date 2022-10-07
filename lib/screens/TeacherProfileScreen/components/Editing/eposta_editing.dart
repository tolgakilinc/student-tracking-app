import 'package:developer_student/Models/UpdateUser.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Services/UserService.dart';
import 'package:developer_student/components/ToastHelper.dart';
import 'package:developer_student/components/editing_input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constans.dart';


class EpostaEditing extends StatefulWidget {
  EpostaEditing({Key key, this.user}) : super(key: key);
  User user;

  @override
  _EpostaEditingState createState() => _EpostaEditingState();
}

class _EpostaEditingState extends State<EpostaEditing> {
  @override
  TextEditingController ePosta = TextEditingController(text: "");
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kEerieBlackColor,
        title: Text("E-posta"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  if(ePosta.text.isNotEmpty){
                    setState(() {
                      UpdateUser(UpdateUserDto(
                          kullaniciId: widget.user.kullaniciId,
                          ad: widget.user.ad,
                          soyad: widget.user.soyad,
                          eposta: ePosta.text,
                          telefonNo: widget.user.telefonNo,
                          yas: widget.user.yas,
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
                    ToastHelper().makeToastMessage("E-posta adresiniz değiştirilmiştir.");
                  }
                  else{
                    ToastHelper().makeToastMessage("Lütfen geçerli e-posta adresi giriniz");
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

                Text("E-posta adresinizi doğru yazdığınıza emin olun",style: TextStyle(fontSize: 15),),
                EditingInputField(
                  controller: ePosta,
                  labelText: "E-posta",
                  onChanged: (value){},
                ),
              ],
            ),
          )

      ),
    );
  }
}
