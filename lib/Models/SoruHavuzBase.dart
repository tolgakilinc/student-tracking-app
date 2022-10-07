// To parse this JSON data, do
//
//     final soruHavuzBase = soruHavuzBaseFromJson(jsonString);

import 'dart:convert';

import 'package:developer_student/Models/DersKategoriBase.dart';
import 'package:developer_student/Models/SoruBase.dart';
import 'package:developer_student/Models/SoruYanitBase.dart';
import 'package:developer_student/Models/SoruYanitDetailBase.dart';

SoruHavuzBase soruHavuzBaseFromJson(String str) => SoruHavuzBase.fromJson(json.decode(str));

String soruHavuzBaseToJson(SoruHavuzBase data) => json.encode(data.toJson());

class SoruHavuzBase {
  SoruHavuzBase({
    this.data,
    this.success,
    this.message,
  });

  List<SoruHavuz> data;
  bool success;
  dynamic message;

  factory SoruHavuzBase.fromJson(Map<String, dynamic> json) => SoruHavuzBase(
    data: List<SoruHavuz>.from(json["data"].map((x) => SoruHavuz.fromJson(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "message": message,
  };
}

class SoruHavuz {
  SoruHavuz({
    this.havuzId,
    this.soru,
    this.soruYanit,
    this.dersKategori,
  });

  int havuzId;
  Soru soru;
  SoruYanitDetail soruYanit;
  DersKategori dersKategori;

  factory SoruHavuz.fromJson(Map<String, dynamic> json) => SoruHavuz(
    havuzId: json["havuzId"],
    soru: Soru.fromJson(json["soru"]),
    soruYanit: SoruYanitDetail.fromJson(json["soruYanit"]),
    dersKategori: DersKategori.fromJson(json["dersKategori"]),
  );

  Map<String, dynamic> toJson() => {
    "havuzId": havuzId,
    "soru": soru.toJson(),
    "soruYanit": soruYanit.toJson(),
    "dersKategori": dersKategori.toJson(),
  };
}