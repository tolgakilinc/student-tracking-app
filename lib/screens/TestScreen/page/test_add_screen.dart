import 'package:developer_student/Models/DenemeCreateDto.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Services/DenemeService.dart';
import 'package:developer_student/components/ToastHelper.dart';
import 'package:developer_student/components/rounded_button.dart';
import 'package:developer_student/screens/TestScreen/components/test_input_field.dart';
import 'package:flutter/material.dart';

import '../../../constans.dart';


class TestAddScreen extends StatefulWidget {
  User user;
  TestAddScreen({Key key, this.user}) : super(key: key);

  @override
  _TestAddScreenState createState() => _TestAddScreenState();
}

class _TestAddScreenState extends State<TestAddScreen> {

  TextEditingController denemeAdi = TextEditingController(text: "");
  TextEditingController puan = TextEditingController(text: "");
  TextEditingController tytNet = TextEditingController(text: "");
  TextEditingController aytNet = TextEditingController(text: "");
  TextEditingController dilNet = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kEerieBlackColor,
      appBar: AppBar(
        backgroundColor: kEerieBlackColor,
        title: Text("Deneme Ekle"),
        leading: Builder(builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {  Navigator.pop(context);},
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: (
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TestInputField(
                  controller: denemeAdi,
                  textColor: Colors.white,
                  hintext: "Deneme Adı",
                 onChanged: (value){

                 },

                ),
                TestInputField(
                  controller: puan,
                  textColor: Colors.white,
                  hintext: "Puan",
                  onChanged: (value){

                  },

                ),
                TestInputField(
                  controller: tytNet,
                  textColor: Colors.white,
                  hintext: "TYT Net",
                  onChanged: (value){

                  },

                ),
                TestInputField(
                  controller: aytNet,
                  textColor: Colors.white,
                  hintext: "AYT Net",
                  onChanged: (value){

                  },

                ),
                TestInputField(
                  controller: dilNet,
                  textColor: Colors.white,
                  hintext: "DİL Net",
                  onChanged: (value){

                  },

                ),
                SizedBox(
                  height: 25,
                ),
                RoundedButton(
                  color: kLicoriceColor,
                  textColor: Colors.white,
                  press: (){
                    if(denemeAdi.text.isNotEmpty&puan.text.isNotEmpty&tytNet.text.isNotEmpty&aytNet.text.isNotEmpty&aytNet.text.isNotEmpty){
                      setState(() {
                        CreateDeneme(DenemeCreateDto(
                            tytNet: int.parse(tytNet.text),
                            puan: int.parse(puan.text),
                            dilNet: int.parse(dilNet.text),
                            denemeAdi: denemeAdi.text,
                            aytNet: int.parse(aytNet.text),
                            tarih: DateTime.now(),
                            kullaniciId: widget.user.kullaniciId
                        ));
                      });
                      ToastHelper().makeToastMessage("Denemeniz oluşturuldu");
                    }
                    else{
                      ToastHelper().makeToastMessage("Lütfen gerekli yerleri eksiksiz doldurunuz");
                    }
                  },
                  text: "Deneme Ekle",
                )
              ],
            ),
          )
          ),
        ),
      ),
    );
  }
}
