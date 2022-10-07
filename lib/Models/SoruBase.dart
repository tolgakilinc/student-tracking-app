// To parse this JSON data, do
//
//     final soruBase = soruBaseFromJson(jsonString);

import 'dart:convert';

import 'package:developer_student/Models/ClassBase.dart';
import 'package:developer_student/Models/UserBase.dart';

SoruBase soruBaseFromJson(String str) => SoruBase.fromJson(json.decode(str));

String soruBaseToJson(SoruBase data) => json.encode(data.toJson());

class SoruBase {
  SoruBase({
    this.data,
    this.success,
    this.message,
  });

  List<Soru> data;
  bool success;
  dynamic message;

  factory SoruBase.fromJson(Map<String, dynamic> json) => SoruBase(
    data: List<Soru>.from(json["data"].map((x) => Soru.fromJson(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "message": message,
  };
}

class Soru {
  Soru({
    this.soruId,
    this.kullanici,
    this.baslik,
    this.ders,
    this.aciklama,
  });

  int soruId;
  User kullanici;
  String baslik;
  Lesson ders;
  String aciklama;

  factory Soru.fromJson(Map<String, dynamic> json) => Soru(
    soruId: json["soruId"],
    kullanici: User.fromJson(json["kullanici"]),
    baslik: json["baslik"],
    ders: Lesson.fromJson(json["ders"]),
    aciklama: json["aciklama"],
  );

  Map<String, dynamic> toJson() => {
    "soruId": soruId,
    "kullanici": kullanici.toJson(),
    "baslik": baslik,
    "ders": ders.toJson(),
    "aciklama": aciklama,
  };
}