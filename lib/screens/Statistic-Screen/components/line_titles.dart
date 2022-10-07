import 'package:developer_student/Models/DenemeBase.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData(List<Deneme> denemeList) => FlTitlesData(
      show: true,
      bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 45,
          getTextStyles: (value) => const TextStyle(
              color: Color(0xFF123456),
              fontSize: 12,
              fontWeight: FontWeight.bold),
          rotateAngle: 50,
          getTitles: (value) {
            int index = value.toInt();

            for(int i = 0; i < denemeList.length; i++){
              if(value.toInt() == i && i < 7){
                return denemeList[i].denemeAdi;
              }
            }
          },
          margin: 8),
      leftTitles: SideTitles(
          showTitles: true,
          getTextStyles: (value) => const TextStyle(
                color: Color(0xFF123456),
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
        reservedSize: 20
      ),
    /*topTitles: SideTitles(
      showTitles: false,
      reservedSize: 10,
      margin: 50,
    ),*/

  );
}
