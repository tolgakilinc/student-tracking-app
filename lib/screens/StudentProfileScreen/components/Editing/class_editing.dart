import 'package:developer_student/Models/SinifBase.dart';
import 'package:developer_student/Models/UpdateUser.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Services/SinifService.dart';
import 'package:developer_student/Services/UserService.dart';
import 'package:developer_student/components/ToastHelper.dart';
import 'package:developer_student/components/editing_input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constans.dart';


class ClassEditing extends StatefulWidget {
  ClassEditing({Key key,this.user}) : super(key: key);
User user;
  @override
  _ClassEditingState createState() => _ClassEditingState();
}

class _ClassEditingState extends State<ClassEditing> {
  var selectedSinif = "1";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kEerieBlackColor,
        title: Text("Sınıf"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  if(selectedSinif.isNotEmpty){
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
                          sinifId: int.parse(selectedSinif),
                          universiteId: widget.user.universite.universiteId,
                          unvanId: widget.user.unvan.unvanId
                      ));
                    });
                    ToastHelper().makeToastMessage("Sınıfınız değiştirildi");
                  }
                  else{
                    ToastHelper().makeToastMessage("Lütfen önce sınıfınız seçiniz");
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
            width: size.width ,
            padding: EdgeInsets.symmetric(vertical: 25,horizontal: 15),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text("Sınıfınızı doğru girdiğinize emin olunuz",style: TextStyle(fontSize: 15),),
                FutureBuilder(
                  future: GetAllSinif(),
                  builder: (context, snapshot){
                    if(!snapshot.hasData) return CircularProgressIndicator();

                    List<Sinif> sinifList = snapshot.data.data;

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
                            items: sinifList.map((Sinif value) {
                              return DropdownMenuItem<String>(
                                value: value. sinifId.toString(),
                                child: Container(child: Text(value.sinif, textAlign: TextAlign.center,), width:double.infinity),
                              );
                            }).toList(),
                            value: selectedSinif,
                            onChanged: (String  value) {
                              setState(() {
                                selectedSinif = value;
                              });
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          )

      ),
    );
  }
}
