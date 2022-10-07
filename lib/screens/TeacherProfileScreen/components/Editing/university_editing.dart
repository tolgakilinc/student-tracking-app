import 'package:developer_student/Models/UniversiteBase.dart';
import 'package:developer_student/Models/UpdateUser.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Services/UniversiteService.dart';
import 'package:developer_student/Services/UserService.dart';
import 'package:developer_student/components/ToastHelper.dart';
import 'package:developer_student/components/editing_input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constans.dart';


class UniversityEditing extends StatefulWidget {
   UniversityEditing({Key key,this.user}) : super(key: key);
User user;
  @override
  _UniversityEditingState createState() => _UniversityEditingState();
}

class _UniversityEditingState extends State<UniversityEditing> {

  var selectedUniversite = "2";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kEerieBlackColor,
        title: Text("Üniversite"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  if(selectedUniversite.isNotEmpty){
                    setState(() {
                      UpdateUser(UpdateUserDto(
                          kullaniciId: widget.user.kullaniciId,
                          ad: widget.user.ad,
                          soyad: widget.user.soyad,
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
                          universiteId: int.parse(selectedUniversite),
                          unvanId: widget.user.unvan.unvanId
                      ));
                    });
                    ToastHelper().makeToastMessage("Üniversiteniz güncellendi");
                  }
                  else{
                    ToastHelper().makeToastMessage("Lütfen değiştirmek istediğiniz üniversiteyi seçiniz");
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
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 15,),
              Text("Lütfen değiştirmek istediğiniz üniversiteyi seçiniz"),
              Container(
                padding: EdgeInsets.only(left:40 ),
                child: FutureBuilder(
                  future: GetAllUniversite(),
                  builder: (context, snapshot){
                    if(!snapshot.hasData) return CircularProgressIndicator();

                    List<Universite> universiteList = snapshot.data.data;

                    return Container(
                      padding: EdgeInsets.only(left: 15),
                      decoration: BoxDecoration(
                        color:kHimawariYellowColor,
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 12.0),
                      height: 55,
                      width: size.width * 0.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children:<Widget> [
                          DropdownButton<String>(
                            dropdownColor: kHimawariYellowColor,
                            isExpanded: true,
                            items: universiteList.map((Universite value) {
                              return DropdownMenuItem<String>(
                                value: value. universiteId.toString(),
                                child: Container(child: Text(value.universiteAdi, textAlign: TextAlign.center,), width:double.infinity),
                              );
                            }).toList(),
                            value: selectedUniversite,
                            onChanged: (String  value) {
                              setState(() {
                                selectedUniversite = value;
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],



          )

      ),
    );
  }
}
