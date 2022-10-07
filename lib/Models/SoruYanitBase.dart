// To parse this JSON data, do
//
//     final soruYanitBase = soruYanitBaseFromJson(jsonString);

import 'dart:convert';

import 'package:developer_student/Models/SoruBase.dart';
import 'package:developer_student/Models/UserBase.dart';

SoruYanitBase soruYanitBaseFromJson(String str) => SoruYanitBase.fromJson(json.decode(str));

String soruYanitBaseToJson(SoruYanitBase data) => json.encode(data.toJson());

class SoruYanitBase {
  SoruYanitBase({
    this.data,
    this.success,
    this.message,
  });

  List<SoruYanit> data;
  bool success;
  dynamic message;

  factory SoruYanitBase.fromJson(Map<String, dynamic> json) => SoruYanitBase(
    data: List<SoruYanit>.from(json["data"].map((x) => SoruYanit.fromJson(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "message": message,
  };
}

class SoruYanit {
  SoruYanit({
    this.soruYanitId,
    this.yanit,
    this.soru,
    this.kullanici,
  });

  int soruYanitId;
  String yanit;
  int soru;
  int kullanici;

  factory SoruYanit.fromJson(Map<String, dynamic> json) => SoruYanit(
    soruYanitId: json["soruYanitId"],
    yanit: json["yanit"],
    soru: json["soru"],
    kullanici: json["kullaniciId"],
  );

  Map<String, dynamic> toJson() => {
    "soruYanitId": soruYanitId,
    "yanit": yanit,
    "soru": soru,
    "kullaniciId": kullanici,
  };
}