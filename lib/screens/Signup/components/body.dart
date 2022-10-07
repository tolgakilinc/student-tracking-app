import 'package:developer_student/Models/AlanBase.dart';
import 'package:developer_student/Models/BolumBase.dart';
import 'package:developer_student/Models/LiseBase.dart';
import 'package:developer_student/Models/SehirBase.dart';
import 'package:developer_student/Models/SignUpCreateDto.dart';
import 'package:developer_student/Models/SinifBase.dart';
import 'package:developer_student/Models/UniversiteBase.dart';
import 'package:developer_student/Models/UnvanBase.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Services/AlanService.dart';
import 'package:developer_student/Services/BolumService.dart';
import 'package:developer_student/Services/LiseService.dart';
import 'package:developer_student/Services/SehirService.dart';
import 'package:developer_student/Services/SinifService.dart';
import 'package:developer_student/Services/UniversiteService.dart';
import 'package:developer_student/Services/UnvanService.dart';
import 'package:developer_student/Services/UserService.dart';
import 'package:developer_student/components/ToastHelper.dart';
import 'package:developer_student/components/already_have_An_account_acheck.dart';
import 'package:developer_student/components/rounded_button.dart';
import 'package:developer_student/components/rounded_input_field.dart';
import 'package:developer_student/components/rounded_password_field.dart';
import 'package:developer_student/screens/Login/login_screen.dart';
import 'package:developer_student/screens/Signup/components/social_icon.dart';
import 'package:flutter/material.dart';

import '../../../constans.dart';
import 'or_divider.dart';

class Body extends StatefulWidget {

  Body({Key key}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var selectedBolums = "2";
  var selectedTypes = "1";
  var selectedUnvanlar ="1";
  var selectedAlan = "1";
  var selectedLise = "2";
  var selectedSinif = "1";
  var selectedUniversite = "2";
  @override
  TextEditingController name = TextEditingController(text: "");

  TextEditingController surName = TextEditingController(text: "");

  TextEditingController email = TextEditingController(text: "");

  TextEditingController pasword = TextEditingController(text: "");

  TextEditingController phone = TextEditingController(text: "");

  TextEditingController age = TextEditingController(text: "");

  TextEditingController parent = TextEditingController(text: "");

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Sign Up",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  height: size.height * 0.01,
                ),
              ),
              SizedBox(
                height: size.height * 0.03,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(29),
                child: Image(
                  image: AssetImage(
                    "assets/images/work_cartoon.jpg",
                  ),
                  height: size.height * 0.25,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              RoundedInputField(
                controller: name,
                hintext: "İsim",
                onChanged: (value) {},
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              RoundedInputField(
                controller: surName,
                hintext: "Soyisim",
                onChanged: (value) {},
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              RoundedInputField(
                controller: email,
                hintext: "E-mail",
                onChanged: (value) {},
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              RoundedInputField(
                controller: phone,
                hintext: "Telefon Numarası",
                keyboardType: TextInputType.number,
                onChanged: (value) {},
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              RoundedInputField(
                controller: age,
                hintext: "Yaş",
                onChanged: (value) {},
                keyboardType: TextInputType.number,
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              FutureBuilder(
                future: GetAllBolums(),
                builder: (context, snapshot){
                  if(!snapshot.hasData) return CircularProgressIndicator();

                  List<Bolum> bolumList = snapshot.data.data;

                  return Container(
                    padding: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color:kAzaleaColor,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 12.0),
                    height: 55,
                    width: size.width * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:<Widget> [
                        DropdownButton<String>(
                          dropdownColor: kAzaleaColor,
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
              SizedBox(
                height: size.height * 0.02,
              ),

              FutureBuilder(
                future: GetAllSehir(),
                builder: (context, snapshot){
                  if(!snapshot.hasData) return CircularProgressIndicator();

                  List<Sehir> sehirList = snapshot.data.data;

                  return Container(
                    padding: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color:kAzaleaColor,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 12.0),
                    height: 55,
                    width: size.width * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:<Widget> [
                        DropdownButton<String>(
                          dropdownColor: kAzaleaColor,
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
              SizedBox(
                height: size.height * 0.02,
              ),

          FutureBuilder(
            future: GetAllUnvanlar(),
            builder: (context, snapshot){
              if(!snapshot.hasData) return CircularProgressIndicator();

              List<Unvan> unvanList = snapshot.data.data;

              return Container(
                padding: EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  color:kAzaleaColor,
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                margin: EdgeInsets.symmetric(vertical: 12.0),
                height: 55,
                width: size.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children:<Widget> [
                    DropdownButton<String>(
                      dropdownColor: kAzaleaColor,
                      isExpanded: true,
                      items: unvanList.map((Unvan value) {
                        return DropdownMenuItem<String>(
                          value: value.unvanId.toString(),
                          child: Container(child: Text(value.unvanAdi, textAlign: TextAlign.center,), width:double.infinity),
                        );
                      }).toList(),
                      value: selectedUnvanlar,
                      onChanged: (String  value) {
                        setState(() {
                          selectedUnvanlar = value;
                        });
                      },
                    ),
                  ],
                ),
              );
            },
          ),
              SizedBox(
                height: size.height * 0.02,
              ),
          FutureBuilder(
            future: GetAllAlan(),
            builder: (context, snapshot){
              if(!snapshot.hasData) return CircularProgressIndicator();

              List<Alan> alanList = snapshot.data.data;

              return Container(
                padding: EdgeInsets.only(left: 15),
                decoration: BoxDecoration(
                  color:kAzaleaColor,
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                ),
                margin: EdgeInsets.symmetric(vertical: 12.0),
                height: 55,
                width: size.width * 0.8,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children:<Widget> [
                    DropdownButton<String>(
                      dropdownColor: kAzaleaColor,
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
              SizedBox(
                height: size.height * 0.02,
              ),
              FutureBuilder(
                future: GetAllLise(),
                builder: (context, snapshot){
                  if(!snapshot.hasData) return CircularProgressIndicator();

                  List<Lise> liseList = snapshot.data.data;

                  return Container(
                    padding: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color:kAzaleaColor,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 12.0),
                    height: 55,
                    width: size.width * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:<Widget> [
                        DropdownButton<String>(
                          dropdownColor: kAzaleaColor,
                          isExpanded: true,
                          items: liseList.map((Lise value) {
                            return DropdownMenuItem<String>(
                              value: value.liseId.toString(),
                              child: Container(child: Text(value.liseAdi, textAlign: TextAlign.center,), width:double.infinity),
                            );
                          }).toList(),
                          value: selectedLise,
                          onChanged: (String  value) {
                            setState(() {
                              selectedLise = value;
                            });
                          },
                        ),
                      ],
                    ),
                  );
                },
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              FutureBuilder(
                future: GetAllSinif(),
                builder: (context, snapshot){
                  if(!snapshot.hasData) return CircularProgressIndicator();

                  List<Sinif> sinifList = snapshot.data.data;

                  return Container(
                    padding: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color:kAzaleaColor,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 12.0),
                    height: 55,
                    width: size.width * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:<Widget> [
                        DropdownButton<String>(
                          dropdownColor: kAzaleaColor,
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
              SizedBox(
                height: size.height * 0.02,
              ),
              FutureBuilder(
                future: GetAllUniversite(),
                builder: (context, snapshot){
                  if(!snapshot.hasData) return CircularProgressIndicator();

                  List<Universite> universiteList = snapshot.data.data;

                  return Container(
                    padding: EdgeInsets.only(left: 15),
                    decoration: BoxDecoration(
                      color:kAzaleaColor,
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    margin: EdgeInsets.symmetric(vertical: 12.0),
                    height: 55,
                    width: size.width * 0.8,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children:<Widget> [
                        DropdownButton<String>(
                          dropdownColor: kAzaleaColor,
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
              SizedBox(
                height: size.height * 0.02,
              ),
              RoundedInputField(
                controller: parent,
                hintext: "Ebeveyn E-mail",
                onChanged: (value) {},
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              RoundedPasswordField(
                controller: pasword,
                hintext: "Password",
                onChanced: (value) {},
              ),
              /*  SizedBox(
            height: size.height * 0.02,
          ),
          RoundedPasswordField(
            hintext: "Password Again",
            onChanced: (value) {},
          ),*/

              RoundedButton(
                text: "Sign Up",
                press: () {
                  if(name.text.isNotEmpty&&surName.text.isNotEmpty&&email.text.isNotEmpty&&phone.text.isNotEmpty&&age.text.isNotEmpty&&pasword.text.isNotEmpty){
                    setState(() {
                      CreateSignUp(SignUpCreateDto(
                        ad: name.text,
                        soyad: surName.text,
                        eposta: email.text,
                        telefonNo: phone.text,
                        yas: int.parse(age.text),
                        sehirId: int.parse(selectedTypes),
                        alanId: int.parse(selectedAlan.toString()),
                        sifre: pasword.text,
                        veliId: 1,
                        bolumId: int.parse(selectedBolums),
                        liseId: int.parse(selectedLise),
                        sinifId: int.parse(selectedSinif),
                        universiteId: int.parse(selectedUniversite),
                        unvanId: int.parse(selectedUnvanlar)
                      ));
                    });
                    ToastHelper().makeToastMessage("Kayıt oluşturuldu");
                  }
                   else{
                    ToastHelper().makeToastMessage("Lütfen gerekli alanları doldurunuz");
                  }



                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
                color: kAzaleaColor,
                textColor: Colors.black87,
              ),
              SizedBox(
                height: size.height * 0.003,
              ),
              AlreadyHaveAnAccountChech(
                login: true,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              OrDivider(),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocialIcon(
                      iconSrc: "assets/icons/facebook.svg",
                      press: () {},
                    ),
                    SocialIcon(
                      iconSrc: "assets/icons/gmail.svg",
                      press: () {},
                    ),
                    SocialIcon(
                      iconSrc: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                  ]),
            ]),
      ),
    );
  }
}
