import 'package:developer_student/Models/AlanBase.dart';
import 'package:developer_student/Models/SehirBase.dart';
import 'package:developer_student/Models/UpdateUser.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Services/AlanService.dart';
import 'package:developer_student/Services/SehirService.dart';
import 'package:developer_student/Services/UserService.dart';
import 'package:developer_student/components/ToastHelper.dart';
import 'package:developer_student/components/editing_input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constans.dart';


class AlanEditing extends StatefulWidget {
User user;
  AlanEditing({Key key,this.user}) : super(key: key);

  @override
  _AlanEditingState createState() => _AlanEditingState();
}

class _AlanEditingState extends State<AlanEditing> {
  var selectedAlan = "1";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kEerieBlackColor,
        title: Text("Alan"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  if(selectedAlan.isNotEmpty&&selectedAlan!=widget.user.alan.alanId){
                    setState(() {
                      UpdateUser(UpdateUserDto(
                          ad: widget.user.ad,
                          soyad: widget.user.soyad,
                          eposta: widget.user.eposta,
                          telefonNo: widget.user.telefonNo,
                          yas: widget.user.yas,
                          sehirId: widget.user.sehir.sehirId,
                          alanId: int.parse(selectedAlan),
                          sifre: widget.user.sifre,
                          veliId: widget.user.veli.veliId,
                          bolumId: widget.user.bolum.bolumId,
                          liseId: widget.user.lise.liseId,
                          sinifId: widget.user.sinif.sinifId,
                          universiteId: widget.user.universite.universiteId,
                          unvanId: widget.user.unvan.unvanId
                      ));
                    });
                    ToastHelper().makeToastMessage("Alan bilginiz değiştirildi");
                  }
                  else{
                    ToastHelper().makeToastMessage("Lütfen önce alanınızı seçiniz");
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
              Text("Lütfen değiştirmek istediğiniz alanı seçiniz"),
              Container(
                padding: EdgeInsets.only(left:40),
                child: FutureBuilder(
                  future: GetAllAlan(),
                  builder: (context, snapshot){
                    if(!snapshot.hasData) return CircularProgressIndicator();

                    List<Alan> alanList = snapshot.data.data;

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
                            items: alanList.map((Alan value) {
                              return DropdownMenuItem<String>(
                                value: value.alanId.toString(),
                                child: Container(child: Text(value.alanAdi, textAlign: TextAlign.center,), width:double.infinity),
                              );
                            }).toList(),
                            value: selectedAlan,
                            onChanged: (String  value) {
                              setState(() {
                                selectedAlan = value;
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
