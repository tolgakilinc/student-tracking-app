import 'package:flutter/material.dart';

import '../constans.dart';

final Color darkBlue = Color.fromARGB(255, 18, 32, 47);

class DateSelect extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DateSelectt(),
      ),
    );
  }
}

class DateSelectt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return FlatButton(child: Text("Tarih seç"),onPressed: ()=> tarihSec(context),);
    return Container(

      child: ClipRRect(

        borderRadius: BorderRadius.circular(12),
        child: Stack(

            children: <Widget>[
              Positioned.fill(

                child: Container(
                  decoration:  BoxDecoration(
                      color:kChinaIvoryColor
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 140,vertical: 15),
                  primary: Colors.white,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                child: Text("Tarih seç",style: TextStyle(color: Colors.black87),),onPressed: ()=> tarihSec(context),
              ),
            ]),
      ),
    );  }

  tarihSec(BuildContext context) {
    showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      lastDate: DateTime(2023),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: ThemeData.light(),
          child: child,
        );
      },
    );
  }
}
