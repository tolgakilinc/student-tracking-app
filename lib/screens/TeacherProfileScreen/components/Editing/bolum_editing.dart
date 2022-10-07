import 'package:developer_student/Models/BolumBase.dart';
import 'package:developer_student/Models/UniversiteBase.dart';
import 'package:developer_student/Models/UpdateUser.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Services/BolumService.dart';
import 'package:developer_student/Services/UniversiteService.dart';
import 'package:developer_student/Services/UserService.dart';
import 'package:developer_student/components/ToastHelper.dart';
import 'package:developer_student/components/editing_input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constans.dart';


class BolumEditing extends StatefulWidget {
  BolumEditing({Key key,this.user}) : super(key: key);
  User user;
  @override
  _BolumEditingState createState() => _BolumEditingState();
}

class _BolumEditingState extends State<BolumEditing> {

  var selectedBolums = "2";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kEerieBlackColor,
        title: Text("Bölüm"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  if(selectedBolums.isNotEmpty){
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
                          bolumId: int.parse(selectedBolums),
                          liseId: widget.user.lise.liseId,
                          sinifId: widget.user.sinif.sinifId,
                          universiteId: widget.user.universite.universiteId,
                          unvanId: widget.user.unvan.unvanId
                      ));
                    });
                    ToastHelper().makeToastMessage("Bölümünüz güncellendi");
                  }
                  else{
                    ToastHelper().makeToastMessage("Lütfen değiştirmek istediğiniz bölümü seçiniz");
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
              Text("Lütfen değiştirmek istediğiniz bölümü seçiniz"),
              Container(
                padding: EdgeInsets.only(left:40 ),
                child: FutureBuilder(
                  future: GetAllBolums(),
                  builder: (context, snapshot){
                    if(!snapshot.hasData) return CircularProgressIndicator();

                    List<Bolum> bolumList = snapshot.data.data;

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
                            items: bolumList.map((Bolum value) {
                              return DropdownMenuItem<String>(
                                value: value.bolumId.toString(),
                                child: Container(child: Text(value.bolumAdi, textAlign: TextAlign.center,), width:double.infinity),
                              );
                            }).toList(),
                            value: selectedBolums,
                            onChanged: (String  value) {
                              setState(() {
                                selectedBolums = value;
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
