import 'package:developer_student/Models/SehirBase.dart';
import 'package:developer_student/Models/UpdateUser.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Services/SehirService.dart';
import 'package:developer_student/Services/UserService.dart';
import 'package:developer_student/components/ToastHelper.dart';
import 'package:developer_student/components/editing_input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constans.dart';


class CityEditing extends StatefulWidget {

   CityEditing({Key key,this.user}) : super(key: key);
   User user;
  @override
  _CityEditingState createState() => _CityEditingState();
}

class _CityEditingState extends State<CityEditing> {
  var selectedTypes = "1";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kEerieBlackColor,
        title: Text("Şehir"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  if(selectedTypes.isNotEmpty&&selectedTypes!=widget.user.sehir.sehirId){
                    setState(() {
                      UpdateUser(UpdateUserDto(
                          kullaniciId: widget.user.kullaniciId,
                          ad: widget.user.ad,
                          soyad: widget.user.soyad,
                          eposta: widget.user.eposta,
                          telefonNo: widget.user.telefonNo,
                          yas: widget.user.yas,
                          sehirId: int.parse(selectedTypes),
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
                    ToastHelper().makeToastMessage("Şehriniz değiştirildi");
                  }
                  else{
                    ToastHelper().makeToastMessage("Lütfen değiştirmek istediğiniz şehri seçiniz");
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
             Text("Lütfen değiştirmek istediğiniz şehri seçiniz"),
             Container(
               padding: EdgeInsets.only(left:40),
               child: FutureBuilder(
                 future: GetAllSehir(),
                 builder: (context, snapshot){
                   if(!snapshot.hasData) return CircularProgressIndicator();

                   List<Sehir> sehirList = snapshot.data.data;

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
                           items: sehirList.map((Sehir value) {
                             return DropdownMenuItem<String>(
                               value: value.sehirId.toString(),
                               child: Container(child: Text(value.sehirAdi, textAlign: TextAlign.center,), width:double.infinity),
                             );
                           }).toList(),
                           value: selectedTypes,
                           onChanged: (String  value) {
                             setState(() {
                               selectedTypes = value;
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
