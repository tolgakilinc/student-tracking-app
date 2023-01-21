
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Providers/LoginProvider.dart';
import 'package:developer_student/Services/UserService.dart';
import 'package:developer_student/components/rounded_button.dart';
import 'package:developer_student/screens/Login/login_screen.dart';
import 'package:developer_student/screens/Teacher/teacher_screen.dart';
import 'package:developer_student/screens/TeacherProfileScreen/components/Editing/age_editing.dart';
import 'package:developer_student/screens/TeacherProfileScreen/components/Editing/city_editing.dart';
import 'package:developer_student/screens/TeacherProfileScreen/components/Editing/diploma_editing.dart';
import 'package:developer_student/screens/TeacherProfileScreen/components/Editing/eposta_editing.dart';
import 'package:developer_student/screens/TeacherProfileScreen/components/Editing/name_editing.dart';
import 'package:developer_student/screens/TeacherProfileScreen/components/Editing/password_editing.dart';
import 'package:developer_student/screens/TeacherProfileScreen/components/Editing/university_editing.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../../../constans.dart';
import 'components/Editing/bolum_editing.dart';
class TeacherProfileScreen extends StatelessWidget {
  User user;
  TeacherProfileScreen({Key key, this.user}) : super(key: key);

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
            height: size.height,
            width: size.width,
            child: FutureBuilder(
              future: GetUser(user.kullaniciId),
              builder: (context, snapshot){
                if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
                UserBase base = snapshot.data;
                if(base.data.isEmpty) return Text("kullanıcı bulunamadı.");

                User user = snapshot.data.data.first;

                return Column(
                  children: [
                    ListTile(
                      title: Text('Ad Soyad',),
                      subtitle: Text("${user.ad} ${user.soyad}"),
                      trailing: Icon(FontAwesomeIcons.pencil,size:18 ,),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return NameEditing(user: user,);
                            },
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: Text('E-posta'),
                      subtitle: Text(user.eposta),
                      trailing: Icon(FontAwesomeIcons.pencil,size:18 ,),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return EpostaEditing(user:user,);
                            },
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: Text('Şifre'),
                      subtitle: Text('**********'),
                      trailing: Icon(FontAwesomeIcons.pencil,size:18 ,),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return PasswordEditing(user: user,);
                            },
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: Text("Şehir"),
                      subtitle: Text(user.sehir.sehirAdi),
                      trailing: Icon(FontAwesomeIcons.pencil,size:18 ,),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CityEditing(user: user,);
                            },
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: Text('Yaş'),
                      subtitle: Text(user.yas.toString()),
                      trailing: Icon(FontAwesomeIcons.pencil,size:18 ,),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AgeEditing(user: user,);
                            },
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: Text('Üniversite'),
                      subtitle: Text(user.universite.universiteAdi),
                      trailing: Icon(FontAwesomeIcons.pencil,size:18 ,),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return UniversityEditing(user: user,);
                            },
                          ),
                        );
                      },
                    ),
                    ListTile(
                      title: Text('Bölüm'),
                      subtitle: Text("Bilgisayar Mühendisliği"),
                      trailing: Icon(FontAwesomeIcons.pencil,size:18 ,),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return BolumEditing(user: user,);
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 25,),
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
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text(
                                    ("Cancel"),
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
                );
              },
            ),
          ),
        ),
      ),
    );

  }
}
