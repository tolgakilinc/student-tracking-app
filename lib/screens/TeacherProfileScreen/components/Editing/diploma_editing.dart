import 'package:developer_student/components/editing_input_field.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../constans.dart';


class DiplomaEditing extends StatelessWidget {
  const DiplomaEditing({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kEerieBlackColor,
        title: Text("Diploma"),
        actions: [
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  print("selam");
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
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 25,horizontal: 25),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: [

                Text("Diploma numaranızı doğru girdiğinize emin olunuz",style: TextStyle(fontSize: 15),),
                EditingInputField(
                  labelText: "Diploma Numarası",
                  onChanged: (value){},
                ),
              ],
            ),
          )

      ),
    );
  }
}
