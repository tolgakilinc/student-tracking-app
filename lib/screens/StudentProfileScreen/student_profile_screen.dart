import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/components/rounded_button.dart';
import 'package:developer_student/screens/Home/home_screen.dart';
import 'package:developer_student/screens/Login/login_screen.dart';
import 'package:developer_student/screens/StudentProfileScreen/components/Editing/age_editing.dart';
import 'package:developer_student/screens/StudentProfileScreen/components/Editing/alan_editing.dart';
import 'package:developer_student/screens/StudentProfileScreen/components/Editing/name_editing.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:developer_student/components/alert_box.dart';
import '../../constans.dart';
import 'components/Editing/city_editing.dart';
import 'components/Editing/class_editing.dart';
import 'components/Editing/eposta_editing.dart';
import 'components/Editing/password_editing.dart';


class StudentProfileScreen extends StatefulWidget {
  User user;
  StudentProfileScreen({Key key, this.user}) : super(key: key);

  @override
  _StudentProfileScreenState createState() => _StudentProfileScreenState();
}

class _StudentProfileScreenState extends State<StudentProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: Builder(builder: (BuildContext context) {
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
        title: Text("Profil"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(8),
            height: size.height ,
            width: size.width,
            child: ListView(
              children: [
                ListTile(
                  title: Text(
                    'Ad Soyad',
                  ),
                  subtitle: Text("${widget.user.ad} ${widget.user.soyad}"),
                  trailing: Icon(
                    FontAwesomeIcons.pencil,
                    size: 18,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return NameEditing(user: widget.user,);
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text('E-posta'),
                  subtitle: Text(widget.user.eposta),
                  trailing: Icon(
                    FontAwesomeIcons.pencil,
                    size: 18,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return EpostaEditing(user: widget.user,);
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text('Şifre'),
                  subtitle: Text('**********'),
                  trailing: Icon(
                    FontAwesomeIcons.pencil,
                    size: 18,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return PasswordEditing(user: widget.user,);
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text('Yaş'),
                  subtitle: Text(widget.user.yas.toString()),
                  trailing: Icon(
                    FontAwesomeIcons.pencil,
                    size: 18,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AgeEditing(user: widget.user,);
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text('Sınıf'),
                  subtitle: Text(widget.user.sifre),
                  trailing: Icon(
                    FontAwesomeIcons.pencil,
                    size: 18,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ClassEditing(user: widget.user,);
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text('Şehir'),
                  subtitle: Text(widget.user.sehir.sehirAdi),
                  trailing: Icon(
                    FontAwesomeIcons.pencil,
                    size: 18,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CityEditing(user: widget.user,);
                        },
                      ),
                    );
                  },
                ),
                ListTile(
                  title: Text('Alan'),
                  subtitle: Text(widget.user.alan.alanAdi),
                  trailing: Icon(
                    FontAwesomeIcons.pencil,
                    size: 18,
                  ),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return AlanEditing(user: widget.user);
                        },
                      ),
                    );
                  },
                ),


                SizedBox(height: 25,),
               //SimpleAlertBox()
                RoundedButton(
                  color: kLicoriceColor,
                  text: "Çıkış",
                  textColor: Colors.white,
                  press: (){
                    return showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text(
                          "Hesaptan çıkış yap",
                        ),
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                              Navigator.pop(context);
                              },
                              child: Text(
                                ("İptal"),
                                style: TextStyle(color: Colors.white),
                              ),
                            style: ElevatedButton.styleFrom(
                              primary: kLicoriceColor
                            ),
                          ),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LoginScreen();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                ("Çıkış"),
                                style: TextStyle(color: Colors.white),
                              ),
                            style: ElevatedButton.styleFrom(
                                primary: kLicoriceColor
                            ),
                          )
                        ],
                      )
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
