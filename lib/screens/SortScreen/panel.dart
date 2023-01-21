import 'package:developer_student/Models/DenemeBase.dart';
import 'package:developer_student/Models/OrtalamaBase.dart';
import 'package:developer_student/Models/UserBase.dart';
import 'package:developer_student/Providers/OrtalamaProvider.dart';
import 'package:developer_student/Services/DenemeService.dart';
import 'package:developer_student/Services/OrtalamaService.dart';
import 'package:developer_student/Services/UserService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  User user;
 // bool isExpanded;
  MyApp({key, this.user});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PanelScreen(user: user,),
      ),
    );
  }
}


class PanelScreen extends StatefulWidget {
  User user;
  PanelScreen({key, this.user});

  @override
  State<PanelScreen> createState() => _PanelScreenState();
}

class _PanelScreenState extends State<PanelScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        //padding: EdgeInsets.all(2),
        child: _buildPanel(),
      ),
    );
  }

  Widget _buildPanel() {
    return FutureBuilder(
      future: GetAllOrtalamas(),
        builder: (context, AsyncSnapshot<OrtalamaBase> snapshot){
          if(!snapshot.hasData) return Center(child:CircularProgressIndicator());
          List<Ortalama> userData = snapshot.data.ortalama;

          return ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded){
              setState(() {
                userData[index].isExpanded = !isExpanded;
              });
            },
           /* expansionCallback: (int index, bool isExpanded) {
            setState(() {
              userData[index].isExpanded = !isExpanded;
            });*/

            children: userData.map<ExpansionPanel>((Ortalama item) {
              return ExpansionPanel(

                //    backgroundColor: Colors.black12,
                canTapOnHeader: true,
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(

                    contentPadding: EdgeInsets.all(10),
                    minVerticalPadding: 15,
                    horizontalTitleGap: 0,
                    trailing: SizedBox(
                      height: 50,
                    ),
                    selected: true,
                    leading: Icon(Icons.account_circle_rounded),
                    title: Text("${item.kullanici.ad} ${item.kullanici.soyad}"),
                    subtitle: Text("${item.kullanici.lise.liseAdi}",style: TextStyle(color: Colors.black),),

                  );
                },
                body: ListTile(
                    title: Text("Puan Ortalaması: ${item.puanOrt.toString()}"),
                    trailing: const Icon(Icons.compare_arrows_outlined),

                    onTap: () {
                      Provider.of<OrtalamaProvider>(context, listen: false).setOrtalamaBase(snapshot.data);
                      Provider.of<OrtalamaProvider>(context, listen: false).setSecilenKullaniciOrtalama(item);
                        Navigator.pop(context);
                    }),
               isExpanded: true,


              );
            }).toList(),
          );
        }




    );
  }
}