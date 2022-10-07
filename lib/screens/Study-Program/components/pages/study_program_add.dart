import 'package:date_time_picker/date_time_picker.dart';
import 'package:developer_student/Models/ProgramCreateDto.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Services/ProgramService.dart';
import 'package:developer_student/components/ToastHelper.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:developer_student/components/date_select.dart';
import 'package:developer_student/components/rounded_button.dart';
import 'package:developer_student/screens/TestScreen/components/test_input_field.dart';
import 'package:flutter/material.dart';

import '../../../../constans.dart';

class StudyProgramAddScreen extends StatefulWidget {
  User user;
  StudyProgramAddScreen({Key key, this.user}) : super(key: key);

  @override
  _StudyProgramAddScreenState createState() => _StudyProgramAddScreenState();
}

class _StudyProgramAddScreenState extends State<StudyProgramAddScreen> {
  String date;
  String baslangic;
  String bitis;

  TextEditingController programAdi = TextEditingController(text: "");
  TextEditingController icerik = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kEerieBlackColor,
      appBar: AppBar(
        backgroundColor: kEerieBlackColor,
        title: Text("Çalışma  Programı Oluştur"),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: (Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TestInputField(
                  controller: programAdi,
                  textColor: Colors.white,
                  hintext: "Program Adı",
                ),
                SizedBox(height: 2,),
                Container(
                  width: size.width * 0.89,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    color: kChinaIvoryColor,
                  ),
                  child:  DateTimePicker(
                    initialValue: '',
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                    dateLabelText: '  Date',

                    onChanged: (val) {
                      setState(() {
                        date = val;
                      });
                    },
                    onSaved: (val) => print(val),
                  ),
                ),
                SizedBox(height: 12,),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                    Radius.circular(25),
                      ),
                          color: kChinaIvoryColor,
                  ),
                  width: size.width * 0.9,
                  child: DateTimePicker(

                   // textAlign: TextAlign.center,
                    type: DateTimePickerType.time,
                    icon: Icon(Icons.event),
                    timeLabelText: "Hour",
                    onChanged: (val) {
                      setState(() {
                        baslangic = val;
                        print(baslangic);
                      });
                    },
                  ),
                ),
                SizedBox(height: 15,),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                    color: kChinaIvoryColor,
                  ),
                  width: size.width * 0.9,
                  child: DateTimePicker(
                    type: DateTimePickerType.time,
                    icon: Icon(Icons.event),
                    timeLabelText: "Hour",
                    onChanged: (val) {
                      setState(() {
                        bitis = val;
                        print(bitis);
                      });
                    },
                  ),
                ),
                SizedBox(height: 2,),
                TestInputField(
                  controller: icerik,
                  textColor: Colors.white,
                  hintext: "İçerik",
                  onChanged: (value) {},
                ),
                SizedBox(
                  height: 25,
                ),
                RoundedButton(
                  color: kLicoriceColor,
                  textColor: Colors.white,
                  text: "Çalışma Programı Oluştur",
                  press: () {
                    if(icerik.text.isNotEmpty && date.isNotEmpty && programAdi.text.isNotEmpty){
                      CreateProgram(ProgramCreateDto(
                          baslangicTarih: "${date}T$baslangic",
                          bitisTarih: "${date}T$bitis",
                          icerik: icerik.text,
                          kullaniciId: widget.user.kullaniciId,
                          programAdi: programAdi.text,
                          tarih: date
                      ));
                      ToastHelper().makeToastMessage("Çalışma programı oluşturuldu.");
                    }
                    else
                    {
                      ToastHelper().makeToastMessage("Lütfen çalışma programı değerlerini doldurunuz.");
                    }

                    /*Fluttertoast.showToast(

                       msg: "Çalışma Programı Oluşturuldu.",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        timeInSecForIosWeb: 1,
                       // backgroundColor: Colors.red,
                        textColor: Colors.white,
                        fontSize: 16.0
                    );*/
                  },
                )
              ],
            ),
          )),
        ),
      ),
    );
  }
}
