import 'package:developer_student/Models/DersKategoriBase.dart';
import 'package:developer_student/Services/DersKategoriService.dart';
import 'package:flutter/material.dart';

import '../../../constans.dart';

class DropDown extends StatefulWidget {
  final Color color, textColor;
  const DropDown({Key key, this.color, this.textColor}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {

  var selectedTypes = "1";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return FutureBuilder(
      future: GetAllDersKategori(),
      builder: (context, snapshot){
        if(!snapshot.hasData) return CircularProgressIndicator();

        List<DersKategori> lessonList = snapshot.data.data;

        return Container(
          padding: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
            color:kChinaIvoryColor,
            borderRadius: BorderRadius.all(Radius.circular(40)),
          ),
          margin: EdgeInsets.symmetric(vertical: 12.0),
          height: 55,
          width: size.width * 0.8,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children:<Widget> [
              DropdownButton<String>(
                dropdownColor: kChinaIvoryColor,
                isExpanded: true,
                items: lessonList.map((DersKategori value) {
                  return DropdownMenuItem<String>(
                    value: value.dersKategoriId.toString(),
                    child: Container(child: Text(value.dersKategorisi, textAlign: TextAlign.center,), width:double.infinity),
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
    );
  }
}
