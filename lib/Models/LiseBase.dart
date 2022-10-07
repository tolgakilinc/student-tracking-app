// To parse this JSON data, do
//
//     final liseBase = liseBaseFromJson(jsonString);

import 'dart:convert';

import 'package:developer_student/Models/SehirBase.dart';

LiseBase liseBaseFromJson(String str) => LiseBase.fromJson(json.decode(str));

String liseBaseToJson(LiseBase data) => json.encode(data.toJson());

class LiseBase {
  LiseBase({
    this.data,
    this.success,
    this.message,
  });

  List<Lise> data;
  bool success;
  dynamic message;

  factory LiseBase.fromJson(Map<String, dynamic> json) => LiseBase(
    data: List<Lise>.from(json["data"].map((x) => Lise.fromJson(x))),
    success: json["success"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "success": success,
    "message": message,
  };
}

class Lise {
  Lise({
    this.liseId,
    this.liseAdi,
    this.sehir,
  });

  int liseId;
  String liseAdi;
  Sehir sehir;

  factory Lise.fromJson(Map<String, dynamic> json) => Lise(
    liseId: json["liseId"],
    liseAdi: json["liseAdi"],
    sehir: Sehir.fromJson(json["sehir"]),
  );

  Map<String, dynamic> toJson() => {
    "liseId": liseId,
    "liseAdi": liseAdi,
    "sehir": sehir.toJson(),
  };
}