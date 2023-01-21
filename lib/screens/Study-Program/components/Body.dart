import 'package:developer_student/Models/ProgramBase.dart';
import 'package:developer_student/Models/ProgramCreateDto.dart';
import 'package:developer_student/Models/ProgramDeleteDto.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Providers/LoginProvider.dart';
import 'package:developer_student/Services/ProgramService.dart';
import 'package:developer_student/screens/Study-Program/study_program_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';  //for date locale
import 'package:provider/provider.dart';

import '../../../constans.dart';
class Body extends StatefulWidget {
  User user;
  Body({Key key, this.user}) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    initializeDateFormatting('tr');

    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget> [

            SizedBox(
              height: size.height * 0.02,
            ),            Text("Bugün",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.w600),),
            SizedBox(
              height: size.height * 0.03,
            ),
            Container(
              width: size.width,
              height: 80,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  LinkHeader("Pts",DateTime.now().weekday == 1 ? true : false),
                  LinkHeader("Sal",DateTime.now().weekday == 2 ? true : false),
                  LinkHeader("Çar",DateTime.now().weekday == 3 ? true : false),
                  LinkHeader("Per",DateTime.now().weekday == 4 ? true : false),
                  LinkHeader("Cum",DateTime.now().weekday == 5 ? true : false),
                  LinkHeader("Cmt",DateTime.now().weekday == 6 ? true : false),
                  LinkHeader("Pzr",DateTime.now().weekday == 7 ? true : false),
                ],
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Saat",style: TextStyle(fontSize: 15,color: Colors.white),),
                SizedBox(
                  width: size.width * 0.3,
                ),
                Text("Planlar",style: TextStyle(fontSize: 15,color: Colors.white)),
              ],
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            FutureBuilder(
              future: GetProgram(Provider.of<LoginProvider>(context, listen:false).getUser().kullaniciId, DateFormat("yyyy-MM-dd").format(DateTime.now().toLocal())),
              builder: (context, AsyncSnapshot snapshot){
                if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);
                List<Program> programList = snapshot.data.data;

                return ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => SizedBox(height: 31,),
                  itemCount: programList.length,
                  itemBuilder: (context, index){
                    Program program = programList[index];

                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${DateFormat("hh:mm").format(program.baslangicTarih)}\n\n${DateFormat("hh:mm").format(program.bitisTarih)}",style: TextStyle(color: Colors.white),),
                        Container(
                          width: size.width * 0.6,
                          height: size.height * 0.15,
                          decoration: BoxDecoration(
                            color: kChinaIvoryColor,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(program.icerik)
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                          ),
                            width:50,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                backgroundColor: MaterialStateProperty.all<Color>(kEerieBlackColor),
                              ),
                              child:Icon(FontAwesomeIcons.trash,size: 20,color:kHimawariYellowColor,),
                              onPressed: (){
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: Text(
                                      "Çalışma programı silinsin mi?",
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          setState(() {
                                            DeleteProgram(ProgramDeleteDto(
                                                programId: program.programId,
                                                tarih: program.tarih.toString().replaceAll(" ", "T"),
                                                programAdi: program.programAdi,
                                                kullaniciId: Provider.of<LoginProvider>(context, listen:false).getUser().kullaniciId,
                                                icerik: program.icerik,
                                                bitisTarih: program.bitisTarih.toString().replaceAll(" ", "T"),
                                                baslangicTarih: program.bitisTarih.toString().replaceAll(" ", "T")
                                            ));
                                            Navigator.of(context).pop();
                                          });
                                        },
                                        child: Text(
                                          ("Evet"),
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
                                          ("Hayır"),
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
                        ),
                      ],
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
class LinkHeader extends StatelessWidget {
  final String day;
  final bool link;
  LinkHeader(this.day, this.link);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        // border: Border.all(color: Colors.black),
        color: kLicoriceColor,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),

      margin: EdgeInsets.only(right: 10),
      // decoration: BoxDecoration(
      //   color: link ? Colors.blue.shade500 : Colors.grey.shade300,
      //   borderRadius: BorderRadius.circular(50),
      // ),
      child: Column(
        children: [
          Text(
            day,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          //if (link)
            SizedBox(
              height: 15,
            ),
            Icon(
              Icons.radio_button_off,
              size: 12,
             //color: Colors.white,
              color: link ? Colors.white : kLicoriceColor,
            ),

        ],
      ),
    );
  }
}
