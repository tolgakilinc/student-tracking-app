import 'dart:io';

import 'package:developer_student/Models/ClassBase.dart';
import 'package:developer_student/Models/DersKategoriBase.dart';
import 'package:developer_student/Models/SoruCreateDto.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Providers/LoginProvider.dart';
import 'package:developer_student/Services/DersKategoriService.dart';
import 'package:developer_student/Services/LessonService.dart';
import 'package:developer_student/Services/SoruService.dart';
import 'package:developer_student/components/ToastHelper.dart';
import 'package:developer_student/components/rounded_button.dart';
import 'package:developer_student/screens/AskQuestion/components/drop_down_button.dart';
import 'package:developer_student/screens/AskQuestion/components/drop_down_ders_button.dart';
import 'package:developer_student/screens/AskQuestion/components/field_title_text.dart';
import 'package:developer_student/screens/AskQuestion/components/question_input_field.dart';
import 'package:developer_student/screens/Home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:photo_view/photo_view.dart';  // kullanılabilir
import 'package:provider/provider.dart';
import '../../constans.dart';

class AskQuestionScreen extends StatefulWidget {
  User user;

  AskQuestionScreen({Key key, this.user}) : super(key: key);

  @override
  State<AskQuestionScreen> createState() => _AskQuestionState();
}

class _AskQuestionState extends State<AskQuestionScreen> {
  File image;
  var selectedLessons = "1";
  var selectedTypes = "1";

  TextEditingController baslik = TextEditingController(text: "");
  TextEditingController soru = TextEditingController(text: "");
  TextEditingController aciklama = TextEditingController(text: "");

  Future pickImage() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);

    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this.image = imageTemporary;
    });
  }

  Future takeImage() async {
    final image = await ImagePicker().getImage(source: ImageSource.camera);

    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this.image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: AppBar(
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
          backgroundColor: kEerieBlackColor,
        ),
        backgroundColor: kEerieBlackColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(80),
                      child: Image(
                        image: AssetImage(
                          "assets/images/analyze.jpg",
                        ),
                        height: size.height * 0.2,
                      ),
                    ),
                    Text(
                      "Soru Sor?",
                      style: TextStyle(
                          fontSize: 40,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Column(
                  children: [
                    QuestionInputField(
                      controller: baslik,
                      hintext: "Başlık yazınız",
                      onChanged: (value) {},
                    ),
                    /* QuestionInputField(controller: soru, hintext: "Sorunuzu yazınız",
                    onChanged: (value) {},),*/
                    FutureBuilder(
                      future: GetAllLessons(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return CircularProgressIndicator();

                        List<Lesson> lessonList = snapshot.data.data;

                        return Container(
                          padding: EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                            color: kChinaIvoryColor,
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 12.0),
                          height: 55,
                          width: size.width * 0.8,
                          child: Column(
                           // crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              DropdownButton<String>(
                                dropdownColor: kChinaIvoryColor,
                                isExpanded: true,
                                items: lessonList.map((Lesson value) {
                                  return DropdownMenuItem<String>(
                                    value: value.dersId.toString(),
                                    child: Container(
                                        child: Text(
                                          value.dersAdi,
                                          textAlign: TextAlign.center,
                                        ),
                                        width: double.infinity),
                                  );
                                }).toList(),
                                value: selectedLessons,
                                onChanged: (String value) {
                                  setState(() {
                                    selectedLessons = value;
                                  });
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    /*GestureDetector(
                   onTap: (){
                     FocusScopeNode currentFocus  = FocusScope.of(context);
                     currentFocus.unfocus();
                   },
                   child:QuestionInputField(controller: aciklama, hintext: "Soru yazınız",
                     onChanged: (value) {},) ,
                 ) ,*/
                    QuestionInputField(
                      controller: aciklama,
                      hintext: "Soru yazınız",
                      onChanged: (value) {},
                    ),
                    FutureBuilder(
                      future: GetAllDersKategori(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData)
                          return CircularProgressIndicator();

                        List<DersKategori> lessonList = snapshot.data.data;

                        return Container(
                          padding: EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                            color: kChinaIvoryColor,
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                          margin: EdgeInsets.symmetric(vertical: 12.0),
                          height: 55,
                          width: size.width * 0.8,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              DropdownButton<String>(
                                dropdownColor: kChinaIvoryColor,
                                isExpanded: true,
                                items: lessonList.map((DersKategori value) {
                                  return DropdownMenuItem<String>(
                                    value: value.dersKategoriId.toString(),
                                    child: Container(
                                        child: Text(
                                          value.dersKategorisi,
                                          textAlign: TextAlign.center,
                                        ),
                                        width: double.infinity),
                                  );
                                }).toList(),
                                value: selectedTypes,
                                onChanged: (String value) {
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: kEerieBlackColor,
                              borderRadius: BorderRadius.circular(25)),
                          width: 130,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: kChinaIvoryColor,
                                onPrimary: Colors.black
                                // backgroundColor: MaterialStateProperty.all<Color>(kChinaIvoryColor),
                                ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.camera_alt),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Galeri"),
                              ],
                            ),
                            onPressed: () {
                              pickImage();
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: kEerieBlackColor,
                              borderRadius: BorderRadius.circular(25)),
                          width: 130,
                          height: 60,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: kChinaIvoryColor,
                                onPrimary: Colors.black
                                // backgroundColor: MaterialStateProperty.all<Color>(kChinaIvoryColor),
                                ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.camera_alt),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("Kamera"),
                              ],
                            ),
                            onPressed: () {
                              takeImage();
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 15,
                ),
                RoundedButton(
                  text: "Soru Sor",
                  color: kHimawariYellowColor,
                  textColor: Colors.black87,
                  press: () {
                    if (aciklama.text.isNotEmpty &&
                        baslik.text.isNotEmpty &&
                        selectedLessons.isNotEmpty) {
                      setState(() {
                        CreateSoru(SoruCreateDto(
                          kullaniciId: Provider.of<LoginProvider>(context, listen:false).getUser().kullaniciId,
                          aciklama: aciklama.text,
                          baslik: baslik.text,
                          dersId: int.parse(selectedLessons),
                        ));
                      });
                        ToastHelper().makeToastMessage(
                            "Sorunuz hocalarımıza iletilmiştir. En kısa sürede geri dönüş yapılacaktır.");
                    } else {
                      ToastHelper().makeToastMessage(
                          "Lütfen sorunuz için gerekli yerleri doldurunuz.");
                    }
                  },
                ),
              ],
            ),
          ),
        ));
  }

  Widget get buildFloatingActionButtons {
    return Column(
      children: [
        Spacer(),
        buildAppIconButtonNewPhoto,
        SizedBox(height: 10),
        buildAppIconButtonPickImageFromGallery,
      ],
    );
  }

  FloatingActionButton get buildAppIconButtonNewPhoto {
    return FloatingActionButton.extended(
      label: Text("Fotoğraf Çek"),
      icon: Icon(Icons.photo_camera),
      backgroundColor: kHimawariYellowColor,
      onPressed: () => null,
    );
  }

  FloatingActionButton get buildAppIconButtonPickImageFromGallery {
    return FloatingActionButton.extended(
      label: Text("Galeriden Seç"),
      icon: Icon(Icons.photo_library),
      backgroundColor: kHimawariYellowColor,
      onPressed: () => pickImage(),
    );
  }
}
