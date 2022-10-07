import 'package:developer_student/Models/UpdateUser.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Services/UserService.dart';
import 'package:developer_student/components/ToastHelper.dart';
import 'package:developer_student/components/editing_input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constans.dart';


class NameEditing extends StatefulWidget {
User user;
   NameEditing({Key key, this.user}) : super(key: key);

  @override
  _NameEditingState createState() => _NameEditingState();
}

class _NameEditingState extends State<NameEditing> {
  @override


  TextEditingController name = TextEditingController(text: "");
  TextEditingController surName = TextEditingController(text: "");

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kEerieBlackColor,
        title: Text("Ad Soyad"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                 if(name.text.isNotEmpty&&surName.text.isNotEmpty){
                   setState(() {
                     UpdateUser(UpdateUserDto(
                         kullaniciId: widget.user.kullaniciId,
                         ad: name.text,
                         soyad: surName.text,
                         eposta: widget.user.eposta,
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
                   ToastHelper().makeToastMessage("Ad ve soyadınız değiştirildi");
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

              Text("Lütfen adınızı ve soyadınızı giriniz",style: TextStyle(fontSize: 17),),
               EditingInputField(
                 controller: name,

                 labelText: "Ad",
                 onChanged: (value){},
               ),
              EditingInputField(
                controller: surName,
                labelText: "Soyad",
                onChanged: (value){},
              ),
            ],
          ),
        )

      ),
    );
  }
}
