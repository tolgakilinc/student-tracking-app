// To parse this JSON data, do
//
//     final soruYanitBase = soruYanitBaseFromJson(jsonString);

import 'dart:convert';

import 'package:developer_student/Models/SoruBase.dart';
import 'package:developer_student/Models/SoruNudeBase.dart';
import 'package:developer_student/Models/UserBase.dart';

SoruYanitDetailBase soruYanitBaseFromJson(String str) => SoruYanitDetailBase.fromJson(json.decode(str));

String soruYanitBaseToJson(SoruYanitDetailBase data) => json.encode(data.toJson());

class SoruYanitDetailBase {
  SoruYanitDetailBase({
    this.data,
    this.success,
    this.message,
  });

  List<SoruYanitDetail> data;
  bool success;
  dynamic message;

  factory SoruYanitDetailBase.fromJson(Map<String, dynamic> json) => SoruYanitDetailBase(
    data: List<SoruYanitDetail>.from(json["data"].map((x) => SoruYanitDetail.fromJson(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "message": message,
  };
}

class SoruYanitDetail {
  SoruYanitDetail({
    this.soruYanitId,
    this.yanit,
    this.soru,
    this.kullanici,
  });

  int soruYanitId;
  String yanit;
  SoruNude soru;
  User kullanici;

  factory SoruYanitDetail.fromJson(Map<String, dynamic> json) => SoruYanitDetail(
    soruYanitId: json["soruYanitId"],
    yanit: json["yanit"],
    soru: SoruNude.fromJson(json["soru"]),
    kullanici: User.fromJson(json["kullanici"]),
  );

  Map<String, dynamic> toJson() => {
    "soruYanitId": soruYanitId,
    "yanit": yanit,
    "soru": soru,
    "kullanici": kullanici,
  };
}